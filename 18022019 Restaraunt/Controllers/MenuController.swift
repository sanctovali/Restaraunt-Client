//
//  MenuController.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//
import UIKit

class MenuController {
	//let baseURL = URL(string: "http://api.armenu.net:8090/")!
	let baseURL = URL(string: "https://myrestaurant-sanctovalirestaurant.vapor.cloud/")!
	
	static let orderUpdateNotification = Notification.Name("MenuController.orderUpdated")
	
	var order = Order() {
		didSet {
			NotificationCenter.default.post(name: MenuController.orderUpdateNotification, object: nil)
		}
	}
	
	static let shared = MenuController()
	private init() {}
	
	func fetchCategories(completion: @escaping ([String]?) -> Void) {
		let categoryURL = baseURL.appendingPathComponent("categories")
		let task = URLSession.shared.dataTask(with: categoryURL) { data, _, _ in
			guard let data = data else {
				print("Error in method \(#function): Can't get Categories")
				completion(nil)
				return
			}
			
			guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
				completion(nil)
				return
			}
			
			let categories = jsonDictionary?["categories"] as? [String]
			
			completion(categories)
		}
		task.resume()
	}
	
	func fetchImage(for menuItem: MenuItem, completion: @escaping (UIImage?) -> Void) {
		let imageName = menuItem.imageURL.lastPathComponent
		let imageURL = baseURL.appendingPathComponent("images/" + imageName)
		let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
			guard let data = data else {
				print("Error in method \(#function): Can't get image data")
				completion(nil)
				return
			}
			
			guard let image = UIImage(data: data) else {
				completion(nil)
				return
			}
			
			completion(image)
		}
		task.resume()
	}
	
	func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
		let initialmenuURL = baseURL.appendingPathComponent("menu")
		var components = URLComponents(url: initialmenuURL, resolvingAgainstBaseURL: true)!
		components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
		guard let menuURL = components.url else {
			print("Error in method (\(#function):Can't get valid menu url")
			completion(nil)
			return
		}
		let task = URLSession.shared.dataTask(with: menuURL) {data, _, _ in
			guard let data = data else {
				print("Error in method \(#function): Can't get menu items")
				completion(nil)
				return
			}
			let jsonDecoder = JSONDecoder()
			let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
			completion(menuItems?.items)
		}
		task.resume()
	}
	
	func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void) {
		let orderURL = baseURL.appendingPathComponent("order")
		
		var request = URLRequest(url: orderURL)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		let data = ["menuIds": menuIds]
		let jsonEncoder = JSONEncoder()
		let jsonData = try? jsonEncoder.encode(data)
		request.httpBody = jsonData
		
		let task = URLSession.shared.dataTask(with: request) { data, _, _ in
			guard let data = data else {

				print("Error in method \(#function): Can't send your order")
				completion(nil)
				return
			}
			
			let jsonDecoder = JSONDecoder()
			let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data)
			completion(preparationTime?.prepTime)
		}
		task.resume()
	}
}

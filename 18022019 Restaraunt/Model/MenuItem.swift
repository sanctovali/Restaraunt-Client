//
//  MenuItem.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
	var id: Int
	var name: String
	var detailText: String
	var price: Double
	var category: String
	var imageURL: URL
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case detailText = "description"
		case price
		case category
		case imageURL = "image_url"
	}
}

struct MenuItems: Codable {
	let items: [MenuItem]
}

extension MenuItem: Hashable {
	var hashValue: Int {
		return self.id
	}
}

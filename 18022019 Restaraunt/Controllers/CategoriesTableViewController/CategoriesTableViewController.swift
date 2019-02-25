//
//  CategoriesTableViewController.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
	var categories = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		MenuController.shared.fetchCategories { (categories) in
			guard let categories = categories else { return }
			self.updateUI(with: categories)
		}
	}
	
	func updateUI(with categories: [String])	{
		DispatchQueue.main.async {
			self.categories = categories
			self.tableView.reloadData()
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard segue.identifier == "MenuSegue" else {
			return
		}
		let dvc = segue.destination as! MenuTableViewController
		let index = tableView.indexPathForSelectedRow!.row
		let category = categories[index]
		dvc.category = category
	}

}

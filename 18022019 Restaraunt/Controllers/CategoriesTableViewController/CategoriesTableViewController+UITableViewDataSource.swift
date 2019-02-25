//
//  CategoriesTableViewController+UITableViewDataSource.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 22/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

extension CategoriesTableViewController {//: UITableViewDataSource
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return categories.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
		
		configure(cell, forItemAt: indexPath)
		
		return cell
	}
	
	func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
		let category = categories[indexPath.row]
		cell.textLabel?.text = category.capitalized
	}
}

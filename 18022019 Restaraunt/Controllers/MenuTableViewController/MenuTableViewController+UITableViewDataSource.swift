//
//  MenuTableViewController+UITableViewDataSource.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 22/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

extension MenuTableViewController {//: UITableViewDataSource
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menuItems.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell")!
		
		configure(cell, forItemAt: indexPath)
		
		return cell
	}
	
	func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
		let menuItem = menuItems[indexPath.row]
		cell.textLabel?.text = menuItem.name.capitalized
		cell.detailTextLabel?.text = String(format: "%.2f", menuItem.price) + "\u{20BD}"
	}
}

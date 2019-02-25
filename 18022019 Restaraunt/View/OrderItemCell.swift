//
//  OrderItemCell.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 23/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

class OrderItemCell: UITableViewCell {
	
	static let cellIdentifier = "OrderCell"
	
	private var menuItem: MenuItem!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var countLabel: UILabel!
	@IBOutlet weak var menuItemCountStepper: UIStepper!
	
	
	func configure(forItemAt indexPath: IndexPath) {
		let menuItems = Array(MenuController.shared.order.menuItems.keys)
		menuItem = menuItems[indexPath.row]
		self.titleLabel?.text = menuItem.name
		let count = MenuController.shared.order.menuItems[menuItem]!
		self.countLabel.text = String(count)
		let totalPrice = menuItem.price * Double(count)
		self.priceLabel?.text = String(format: "%.2f", totalPrice) + "\u{20BD}"
		menuItemCountStepper.value = Double(count)
		
	}
	
	func updateCell() {
		let count = MenuController.shared.order.menuItems[menuItem]!
		self.countLabel.text = String(count)
		let totalPrice = menuItem.price * Double(count)
		self.priceLabel?.text = String(format: "%.2f", totalPrice) + "\u{20BD}"
	}
	
	@IBAction func countStepperTapped(_ sender: UIStepper) {
		MenuController.shared.order.menuItems[menuItem] = Int(sender.value)
		updateCell()
	}
}

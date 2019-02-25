//
//  OrderTableViewController++UITableViewDelegate.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 24/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

extension OrderTableViewController/*: UITableDelegate*/ {
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		switch editingStyle {
		case .delete:
			let menuItems = Array(MenuController.shared.order.menuItems.keys)
			let menuItem = menuItems[indexPath.row]
			MenuController.shared.order.menuItems[menuItem] = nil
		case .insert:
			
			break
		case .none:
			break
		}
	}	
}

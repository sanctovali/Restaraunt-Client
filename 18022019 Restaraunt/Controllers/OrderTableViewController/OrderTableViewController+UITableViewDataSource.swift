//
//  OrderTableViewController+UITableViewDataSource.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 23/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

extension OrderTableViewController/*: UITableViewDataSource*/ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuController.shared.order.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderItemCell
        cell.configure(forItemAt: indexPath)
        return cell
    }
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

		return true
	}
    
}

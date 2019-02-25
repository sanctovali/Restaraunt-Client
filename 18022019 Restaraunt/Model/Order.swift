//
//  Order.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//


struct Order: Codable {
	var menuItems: [MenuItem: Int]
	
	init(menuItems: [MenuItem: Int] = [:]) {
		self.menuItems = menuItems
	}
}


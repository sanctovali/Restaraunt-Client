//
//  IntermedearyModels.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import Foundation

struct Category: Codable {
	let categories: [String]
}

struct PreparationTime: Codable {
	let prepTime: Int
	
	enum CodingKeys: String, CodingKey {
		case prepTime = "preparation_time"
	}
}

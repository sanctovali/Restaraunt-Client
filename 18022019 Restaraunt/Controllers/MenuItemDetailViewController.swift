//
//  MenuItemDetailViewController.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 18/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
	@IBOutlet weak var menuItemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var detailTextLabel: UILabel!
	@IBOutlet weak var addToOrderButton: UIButton!
	
	var menuItem: MenuItem! {
		didSet {
			print(menuItem.name)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		MenuController.shared.fetchImage(for: menuItem, completion: { (image) in
			guard let image = image else { return }
			self.updateUI(with: image)
		})
		setupUI()
	}
	
	func setupUI() {
		navigationItem.backBarButtonItem?.title = "Вернуться"
		addToOrderButton.layer.cornerRadius = 5
	}
	
	func updateUI(with image: UIImage) {
		DispatchQueue.main.async {
			self.menuItemImageView.image = image
			self.titleLabel.text = self.menuItem.name
			self.priceLabel.text = String(format: "%.2f", self.menuItem.price) + "\u{20BD}"
			self.detailTextLabel.text = self.menuItem.detailText
		}
	}

	@IBAction func addToOrderButtonTapped(_ sender: UIButton) {
		UIView.animate(withDuration: 0.3) {
			self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
			self.addToOrderButton.transform = CGAffineTransform.identity
		}

		if MenuController.shared.order.menuItems.keys.contains(menuItem) {
			MenuController.shared.order.menuItems[menuItem]! += 1
		} else {
			MenuController.shared.order.menuItems[menuItem] = 1
		}

	}
}

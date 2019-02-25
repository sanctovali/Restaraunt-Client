//
//  OrderConfirmationViewController.swift
//  18022019 Restaraunt
//
//  Created by Valentin Kiselev on 13/02/2019.
//  Copyright © 2019 Valentin Kiselev. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order!  Your wait time is \(minutes!) minutes."
    }
}

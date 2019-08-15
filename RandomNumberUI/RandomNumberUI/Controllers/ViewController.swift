//
//  ViewController.swift
//  RandomNumberUI
//
//  Created by Kyrhee Powell on 6/13/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = "\(Date.init())"
    }

    @IBAction func seedAction(_ sender: Any) {
        srandom(CUnsignedInt(time(nil)))
        randomNumberLabel.text = "Generator Seeded"
    }
    
    
    @IBAction func generateAction(_ sender: Any) {
        let generated = (arc4random() % 100) + 1
        randomNumberLabel.text = "\(generated)"
    }
    
    @IBAction func updateTime(_ sender: Any) {
        let currentTime = Date.init()
        dateLabel.text = currentTime.description
    }
}


//
//  ViewController.swift
//  blackCotsco
//
//  Created by Kire  on 12/6/19.
//  Copyright © 2019 Kire . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openURL(_ sender: UIButton) {
        if let instagramLink = URL(string: "\(sender.titleLabel!.text!)") {
            UIApplication.shared.open(instagramLink)
        }
        
    }
    
}


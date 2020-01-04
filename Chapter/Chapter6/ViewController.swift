//
//  ViewController.swift
//  Chapter6
//
//  Created by Kyrhee Powell on 5/6/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Implicit unwrapping, weak to avoid strong reference cycle
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBAction func showName(sender: AnyObject){
        nameLabel.text = "My name is Kyrhee!"
    }
    
    
    @IBAction func showNickName(sender: AnyObject){
        nameLabel.text = "My name is Kire!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


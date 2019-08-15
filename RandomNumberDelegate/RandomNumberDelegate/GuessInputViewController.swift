//
//  GuessInputViewController.swift
//  RandomNumberDelegate
//
//  Created by Kyrhee Powell on 6/15/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit
//protocol to send data back to the home view controller's userDidFinish
protocol GuessDelegate {
    func userDidFinish(_ controller:GuessInputViewController, guess:String)
}
class GuessInputViewController: UIViewController {
    var delegate: GuessDelegate? = nil
    var previousGuess: String = ""
    
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(!previousGuess.isEmpty){
            guessLabel.text = "Your previous guess was \(previousGuess)"
        }
        guessTextField.becomeFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated
    }
    
    @IBAction func saveGuess(_ sender: Any) {
        if let delegate = delegate, let guessText = guessTextField.text{
            delegate.userDidFinish(self, guess: guessText)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

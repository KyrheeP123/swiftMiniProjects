//
//  ViewController.swift
//  RandomNumberDelegate
//
//  Created by Kyrhee Powell on 6/15/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GuessDelegate {
    var previousGuess = ""
    var randomNumber = 0
    
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createRandomNumber()
        playAgainButton.isHidden = true
        resultLabel.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyGuessSegue"{
            
            let vc = segue.destination as! GuessInputViewController
            //passing the previousGuess property to the GuessInputViewController
            vc.previousGuess = previousGuess
            vc.delegate = self
            
        }
    }
    
    func userDidFinish(_ controller: GuessInputViewController, guess: String){
        userGuessLabel.text = "The guess was " + guess
        previousGuess = guess
        let numberGuess = Int(guess)
        
        if(numberGuess! > randomNumber){
            resultLabel.text = "Guess too high"
        }
        else if(numberGuess! < randomNumber){
            resultLabel.text = "Guess too low"
        }
        else{
            resultLabel.text = "Guess is correct"
            playAgainButton.isHidden = false
        }
        //pops the GuessInputViewController of the stack
        if let navController = self.navigationController{
            navController.popViewController(animated: true)
        }
    }
    
    func createRandomNumber(){
        //random number between 0-100
        randomNumber = Int(arc4random_uniform(100))
        print("The random number is: \(randomNumber)")
        //Blank return?
        return
    }
    
    @IBAction func playAgain(_ sender: Any) {
        createRandomNumber()
        //only show the button when the user guessed right
        playAgainButton.isHidden = true
        guessButton.isHidden = false
        resultLabel.text = "New Game"
        //previous guess set to 35?
        
        previousGuess = "35"
    }
    
}


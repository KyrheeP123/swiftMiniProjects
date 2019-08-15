//
//  DetailViewController.swift
//  BookStore
//
//  Created by Kyrhee Powell on 5/30/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var readSwitch: UISwitch!
    
    var delegate: BookStoreDelegate? = nil
    var myBook = Book()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail"{
            if let vc = segue.destination as? AddBookViewController{
                vc.delegate = delegate
                vc.editBook = true
                myBook.title = titleLabel.text ?? ""
                myBook.author = authorLabel.text ?? ""
                myBook.description = descriptionTextView.text ?? ""
                myBook.pages = 0
                if  readSwitch.isOn{
                    myBook.readThisBook = true
                }else{
                    myBook.readThisBook = false
                }
                vc.book = myBook
            }
        }
    }
    
    
    //Convenience Method - called whenever the DetailViewController is being initialized
    func configureView() {
        if let myBook = detailItem{
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            pagesLabel.text = "\(myBook.pages)"
            if myBook.readThisBook{
                readSwitch.isOn = true
            }else{
                readSwitch.isOn = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Calling convenienve method
        self.configureView()
    }

    var detailItem: Book? {
        didSet {
            // Update the view.
        }
    }
    
    
    @IBAction func deleteBook(_ sender: UIBarButtonItem){
        //Create the alert controller with a Title and Message
        let alertController = UIAlertController(title: "Warning", message: "Delete this book?", preferredStyle: .alert)
        
        //Add button option to the alert controller
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: {(action) in
            print("Cancel")
        })
        alertController.addAction(noAction)
        
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {(action) in
            self.delegate?.deleteBook(self)
        })
        alertController.addAction(yesAction)
        
        //A UIAlert can only have one Alert Action of type cancel this is a run time bug, change to another state
//        let maybeAction = UIAlertAction(title: "Testing", style: .cancel, handler: {(action) in
//            print("Cancel")
//        })
//        
//        alertController.addAction(maybeAction)
        
        
        present(alertController, animated: false, completion: nil)
    }
}


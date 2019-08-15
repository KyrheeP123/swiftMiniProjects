//
//  AddBookViewController.swift
//  BookStore
//
//  Created by Kyrhee Powell on 6/19/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

protocol BookStoreDelegate {
    func newBook(_ controller: AnyObject, newBook: Book)
    func editBook(_ controller: AnyObject, editBook: Book)
    func deleteBook(_ controller: AnyObject)
}

class AddBookViewController: UIViewController {
    var book: Book = Book()
    var delegate: BookStoreDelegate?
    var read = false
    var editBook = false
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var descriptionText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if editBook == true{
            self.title = "Edit Book"
            titleText.text = book.title
            authorText.text = book.author
            pagesText.text = "\(book.pages)"
            descriptionText.text = book.description
            
            if book.readThisBook{
                switchOutlet.isOn = true
            }else{
                switchOutlet.isOn = false
            }
        }

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBookAction(_sender: UIButton){
        book.title = titleText.text!
        book.author = authorText.text!
        book.description = descriptionText.text!
        
        //optional chaining for pagesText not nil and that it can be converted to an Int type
        if let text = pagesText.text, let pages = Int(text){
            book.pages = pages
        }
        if switchOutlet.isOn{
            book.readThisBook = true
        }else{
            book.readThisBook = false
        }
        
        //If user clicks on a current book exectue editBook function to be implemented by the conforming class
        if (editBook){
            delegate?.editBook(self, editBook: book)
        //If user clicks saveBook and this is a new book add the book to the database by executing new book method in the conforming class
        }else{
        
            delegate?.newBook(self, newBook: book)
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

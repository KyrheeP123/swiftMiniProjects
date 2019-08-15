//
//  ViewController.swift
//  BookStoreCoreDate
//
//  Created by Kyrhee Powell on 6/14/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    var bookTitleOfFirstBook = "Hell"
    //Managed object context for database
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows
        return loadBooks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            else{
                return UITableViewCell()
        }
        let book: Book = loadBooks()[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myBookTitleSegue"{
            let vc = segue.destination as! bookTitleEntry
            //vc.bookTitleOfFirstBook!.text = bookTitleOfFirstBook
            //vc.delegate = self
        }
    }

    @IBAction func addNew(_ sender: Any) {
        //add new record to core data
        
        let author: Author = NSEntityDescription.insertNewObject(forEntityName: "Author", into: managedObjectContext) as! Author
        author.firstName = "Kire"
        author.lastName = "Powell"
        do{
            try managedObjectContext.save()
        }catch let error as NSError{
            NSLog("My Error: %@",error)
        }
        
        let book: Book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: managedObjectContext) as! Book
        //assign a value to the attribute 'title' of the new record
        book.title = "My Book \(loadBooks().count)"
        //Attempt to save the entry to the database
        do{
            try managedObjectContext.save()
        }catch let error as NSError{
            NSLog("My Error: %@",error)
        }
        myTableView.reloadData()
    
    }
    
    //Core Data function
    func loadBooks() -> [Book]{
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        var result: [Book] = []
        do{
            result = try managedObjectContext.fetch(fetchRequest)
        }catch{
            NSLog("My Error: %@", error as NSError)
        }
        return result
    }
    
    func sortBooks() -> [Book]{
        let books = loadBooks()
        
        //Sort books with closure because the Book class does not conform to the Comparable protocol
        let sortedBooks = books.sorted {
            switch ($0.title?.last ?? "b" , $1.title?.last ?? "b") {
            // Order errors by count
            case let ( a, b):
                return a < b
            }
        }
         myTableView.reloadData()
        return sortedBooks
    }
    
    @IBAction func removeLastBook(_ sender: Any) {
        var sortedBooks = sortBooks()
        managedObjectContext.delete(sortedBooks.removeLast())
        myTableView.reloadData()
    
    }
    

    
}


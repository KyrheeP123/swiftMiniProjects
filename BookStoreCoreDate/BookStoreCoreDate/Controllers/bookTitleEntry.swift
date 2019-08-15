//
//  bookTitleEntry.swift
//  BookStoreCoreDate
//
//  Created by Kyrhee Powell on 6/14/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit
import CoreData

class bookTitleEntry: UIViewController {
    @IBOutlet weak var bookTitleOfFirstBook: UITextField!
    //var delegate = nil
    //Managed object context for database
    var managedObjectContext: NSManagedObjectContext!
    
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
        
        return sortedBooks
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext as NSManagedObjectContext

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTitle(_ sender: Any) {
        
        let sortedBooks = sortBooks()
        var _ = sortedBooks.first?.title = bookTitleOfFirstBook.text
        
        print(loadBooks())
        
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

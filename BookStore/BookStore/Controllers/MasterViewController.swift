//
//  MasterViewController.swift
//  BookStore
//
//  Created by Kyrhee Powell on 5/30/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, BookStoreDelegate {
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    //Initializing Data Model Booktstore
    var myBookStore = BookStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        //objects.insert(NSDate(), at: 0)
        //let indexPath = IndexPath(row: 0, section: 0)
        //tableView.insertRows(at: [indexPath], with: .automatic)
        performSegue(withIdentifier: "addBookSegue", sender: nil)
    }

    // MARK: - Segues
    //Called everytime a row in the TableView is tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //Grab book from collectoin based on row clicked
                let selectedBook:Book = myBookStore.bookList[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                
                
                //Setting the detail item to the Book selected at the indexPath.row
                controller.detailItem = selectedBook
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.delegate = self
            }
        }else if segue.identifier == "addBookSegue"{
            let vc = segue.destination as! AddBookViewController
            vc.delegate = self
        }
    }

    // MARK: - Table View

    //Only one list of books so 1 here
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //number of books in the bookstore
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBookStore.bookList.count
    }

    //Called for each row to be displayed, called one row at a time
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //Defining the each row should display the title of the book 
        cell.textLabel!.text = myBookStore.bookList[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Can not use the objects term here. You have to resolve to the actual object.
            myBookStore.bookList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    // MARK: - BookStoreDelegateMethods
    
    func newBook(_ controller: AnyObject, newBook: Book) {
        myBookStore.bookList.append(newBook)
        tableView.reloadData()
        // same as hitting the back button visually
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func deleteBook(_ controller: AnyObject) {
        if let row = tableView.indexPathForSelectedRow?.row{
            myBookStore.bookList.remove(at: row)
        }
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func editBook(_ controller: AnyObject, editBook: Book) {
        if let row = tableView.indexPathForSelectedRow?.row{
            myBookStore.bookList[row] = editBook
        }
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
}


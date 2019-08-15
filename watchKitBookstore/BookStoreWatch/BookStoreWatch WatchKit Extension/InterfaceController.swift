//
//  InterfaceController.swift
//  BookStoreWatch WatchKit Extension
//
//  Created by Kyrhee Powell on 6/30/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    //Reference to the table in Interface.storyboard
    @IBOutlet weak var mainTable: WKInterfaceTable!
    
    //Initializing BookStore to get starter data
    var myBookStore: BookStore = BookStore()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        configureTable()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //Passes context, in this case a book, when a row from the mainTable is selected
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return myBookStore.bookList[rowIndex]
    }
    
    //Function to load data in the table
    func configureTable(){
        //The number of rows come from the number of books we have
        mainTable.setNumberOfRows(myBookStore.bookList.count, withRowType: "myBookRow")
        //Iterate through the number of books
        for index in 0..<myBookStore.bookList.count{
            //For each book we will create a new row controller as make is as type BookRow which contains a bookLabel
            if let myRow = mainTable.rowController(at: index) as? BookRow{
                //Use the setText function from WKInterfaceLabel and pass the book title
                myRow.bookLabel.setText(myBookStore.bookList[index].title)
            }
        }
    }
}

class BookRow:NSObject{
    //Label inside the table row
    @IBOutlet weak var bookLabel: WKInterfaceLabel!
}

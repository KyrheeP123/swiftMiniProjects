//
//  DetailController.swift
//  BookStoreWatch WatchKit Extension
//
//  Created by Kyrhee Powell on 6/30/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import Foundation
//To use WKInterfaceController & WKInterfaceLabel
import WatchKit


//Create DetailController subclass of WKInterfaceController
class DetailController: WKInterfaceController{
    //Outlets to be connected to WKInterfaceLabel objects from WKInterfaceController
    @IBOutlet var labelTitle: WKInterfaceLabel!
    @IBOutlet var labelAuthor: WKInterfaceLabel!
    @IBOutlet var labelDescription: WKInterfaceLabel!
    
    //Initialize book object
    var book: Book!
    
    //override awake function from super class, pass a book as the context
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        //initialize context as the book
        if let book = context as? Book{
            //setText for each label in DetailController for book author, title, and description
            labelTitle.setText(book.title)
            labelAuthor.setText(book.author)
            labelDescription.setText(book.description)
        }
    }
}

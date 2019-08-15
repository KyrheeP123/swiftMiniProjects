//
//  BookStore.swift
//  BookStore
//
//  Created by Kyrhee Powell on 5/30/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//
import Foundation
class BookStore{
    var bookList: [Book] = []
    
    //Data Model with an Array as the collection
    init(){
        var newBook = Book()
        newBook.title = "Swift for Absolute Beginners"
        newBook.author = "Bennett and Lees"
        newBook.description = "iOS Programming made easy."
        bookList.append(newBook)
        
        newBook = Book()
        newBook.title = "A Farewell to Arms"
        newBook.author = "Ernest Hemingway"
        newBook.description = "The story of an affiar between an English nurse and an American solider on the Italian front during World War I."
        bookList.append(newBook)
    }
}

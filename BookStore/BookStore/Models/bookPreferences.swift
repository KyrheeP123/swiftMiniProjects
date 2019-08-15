//
//  bookPreferences.swift
//  BookStore
//
//  Created by Kyrhee Powell on 6/14/19.
//  Copyright © 2019 Kyrhee Powell. All rights reserved.
//

import Foundation

//Create preferences object
var prefs: UserDefaults = UserDefaults.standard

//Write key:value pairs in preferences object
//prefs.set("Sherlock Holmes", forKey: "username")
//prefs.set(10, forKey: "booksInList")

//Update preferences. Only to be used if we cannot wait for the next synch interval
//prefs.synchronize()

//Read from key stored preferences object

var username = prefs.string(forKey: "username")
var booksInList = prefs.integer(forKey: "booksInList")


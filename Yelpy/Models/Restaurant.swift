//
//  Restaurant.swift
//  Yelpy
//
//  Created by Alan Bergsneider on 9/29/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation

class Restaurant {
    
    // Create variables
    var imageURL: URL? // ? tells program that it's okay if the value is nil, do not crash, continue with default
    var url: URL?
    var name: String // ? not required because when a dictionary is referenced it is by default an "optional"
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    // Create initializer for Restaurant class
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        url = URL(string: dict["url"] as! String)
        name = dict["name"] as! String
        mainCategory = Restaurant.getMainCategory(dict: dict)
        phone = dict["phone"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
    }
    // Create a method to get the first category of the restaurant
    static func getMainCategory(dict: [String:Any]) -> String { // -> String tells return type for static func
        let categories = dict["categories"] as! [[String:Any]] // [String] is an array of strings, [String:Any] is a dictionary with keys as strings and values of any type, [[String:Any]] is an array of dictionaries with keys of string type and values of any type
        return categories[0]["title"] as! String
    }
    
}

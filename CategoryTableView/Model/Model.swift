//
//  Model.swift
//  CategoryTableView
//
//  Created by Mayur on 25/05/20.
//  Copyright © 2020 Xe. All rights reserved.
//

import Foundation

struct Meal{
    let name:String!
    let price:Double!
}

struct Category {
    let name:String!
    let meals:[Meal]
    
    static let categories = [
        Category(name: "Indian", meals: [
                                 Meal(name: "Dal Tadka", price: 80.0),
                                 Meal(name: "Paneer Masala", price: 100.0),
                                 Meal(name: "Chicken Handi", price: 80.0),
                                 Meal(name: "Chicken Tandoor", price: 100.0),
                                 Meal(name: "Mutton Masala", price: 80.0),
                                 Meal(name: "Paneer Bhurji", price: 100.0),
                                 Meal(name: "Egg Handi", price: 80.0),
                                 Meal(name: "Egg Masala", price: 100.0)
                                 ]),
        Category(name: "Chinese", meals: [
                                 Meal(name: "Chicken Lollipop", price: 80.0),
                                 Meal(name: "Manchurian", price: 100.0),
                                 Meal(name: "Veg Noodles", price: 80.0),
                                 Meal(name: "Chicken Noodles", price: 100.0),
                                 Meal(name: "Soup", price: 80.0),
                                 Meal(name: "Chicken 65", price: 100.0),
        ]),
        Category(name: "Snacks", meals: [
                                 Meal(name: "Poha", price: 80.0),
                                 Meal(name: "Upma", price: 100.0),
                                 Meal(name: "Idli", price: 80.0),
                                 Meal(name: "Wada Sambhar", price: 100.0),
                                 Meal(name: "Wada Pav", price: 80.0),
                                 Meal(name: "Tea", price: 100.0),
                                 Meal(name: "Coffee", price: 80.0),
                                 Meal(name: "Green Tea", price: 100.0)
        ]),
        Category(name: "Test", meals: [
                                 Meal(name: "Meal 1", price: 80.0),
                                 Meal(name: "Meal 2", price: 100.0),
                                 Meal(name: "Meal 3", price: 80.0),
                                 Meal(name: "Meal 4", price: 100.0),
                                 Meal(name: "Meal 5", price: 80.0),
                                 Meal(name: "Meal 6", price: 100.0),
                                 Meal(name: "Meal 7", price: 80.0),
                                 Meal(name: "Meal 8", price: 100.0)
        ]),
    ]
}

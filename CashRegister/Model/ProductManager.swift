//
//  ProductManager.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import Foundation

class ProductManager {
    //dummy product data collection
    var products = [
        Product(n: "Hats", qty: 10, p: 20.5),
        Product(n: "Pants", qty: 15, p: 25.5),
        Product(n: "Shoes", qty: 20, p: 35.5),
        Product(n: "TShirts", qty: 50, p: 50.5)
    ]
    
    //returns the collection of products
    func getAllProducts() -> [Product] {
        return products
    }
}

//
//  Product.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import Foundation

class Product {
    var name: String;
    var quantity: Int
    var price: Double
    
    init(n:String, qty:Int, p:Double) {
        name = n
        quantity = qty
        price = p
    }
}

//
//  History.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import Foundation

class History {
    var name: String;
    var quantity: Int
    var totalPrice: Double
    var purchaseDate : String
    
    init(n:String, qty:Int, p:Double) {
        name = n
        quantity = qty
        totalPrice = p
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss a"
        purchaseDate = dateFormatter.string(from: NSDate() as Date)
    }
}

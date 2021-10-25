//
//  HistoryManager.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import Foundation

class HistoryManager {
    //purchase history data collection
    var histories = [History]()
    
    //add new purchase history data in the collection
    func addPurchaseHistory(product : Product, newQty:Int) {
        var h = History(n:product.name, qty:newQty, p:(product.price * Double(newQty)))
        histories.append(h)
    }
    
    //return the collection of purchase history data
    func getAllPurchaseHistories() -> [History]{
        return histories
    }
}

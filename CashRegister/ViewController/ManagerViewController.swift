//
//  ManagerViewController.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import UIKit

class ManagerViewController: UIViewController {
    var productManager : ProductManager?
    var historyManager : HistoryManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "restockSegue") {
            let restockVC = segue.destination as? RestockViewController
            restockVC!.productManager = productManager
        } else if (segue.identifier == "historySegue") {
            let historyVC = segue.destination as? HistoryTableViewController
            historyVC!.historyManager = historyManager
        }
    }
}

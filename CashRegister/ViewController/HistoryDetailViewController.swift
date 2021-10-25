//
//  HistoryDetailViewController.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import UIKit

class HistoryDetailViewController: UIViewController {

    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var pQty: UILabel!
    @IBOutlet weak var pDate: UILabel!
    @IBOutlet weak var pTotalAmount: UILabel!
    
    var history : History?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set history data received from previous controller view
        pName.text = history?.name
        
        let qty = history?.quantity ?? 0
        pQty.text = "\(qty)"
        
        pDate.text = history?.purchaseDate
        
        let total = history?.totalPrice ?? 0
        pTotalAmount.text = "Total Amount : \(total)"
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

}

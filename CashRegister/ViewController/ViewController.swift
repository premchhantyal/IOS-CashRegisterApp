//
//  ViewController.swift
//  CashRegister
//
//  Created by user193216 on 10/23/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var selectedQty: UILabel!
    @IBOutlet weak var productTableView: UITableView!
    var selectedQtyString : String = ""
    var selectedRow : Int?
    
    var productManager : ProductManager = ProductManager()
    var historyManager : HistoryManager = HistoryManager()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.getAllProducts().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myCustomerTableViewCell
        
        cell.productName?.text = productManager.getAllProducts()[indexPath.row].name
        
        let qty = productManager.getAllProducts()[indexPath.row].quantity ?? 0;
        cell.productQty?.text = "\(qty)"
        
        let price = productManager.getAllProducts()[indexPath.row].price ?? 0;
        cell.productPrice?.text = "\(price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resetFields()
        productName.isHidden = false
        productName.text = productManager.getAllProducts()[indexPath.row].name
        selectedRow = indexPath.row
        
    }

    @IBAction func qtySelected(_ sender: Any) {
        //get selected quantity and set to quantity label
        if let btnTitle = (sender as! UIButton).currentTitle {
            selectedQtyString.append(btnTitle)
        }
        selectedQty.isHidden = false
        selectedQty.text = selectedQtyString
        
        //show total amount
        var cost = productManager.getAllProducts()[selectedRow!].price * Double(selectedQtyString)!;
        totalAmount.isHidden = false
        totalAmount.text = "\(cost)"
        
        //check if selected quantity is greater than quantity in stock for the respective product
        if let n = Int(selectedQtyString) { if ( n > productManager.getAllProducts()[selectedRow!].quantity) {
                var alert = UIAlertController(title: "Error!!", message: "Selected quantity is greater than quantity in stock.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { action in
                    self.resetFields()
                }
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func buyProduct(_ sender: Any) {
        if (selectedRow != nil) { 
            
            //subtract purchased quantity from stock
            productManager.getAllProducts()[selectedRow!].quantity -= Int(selectedQtyString)!
            
            //add history
            historyManager.addPurchaseHistory(product: productManager.getAllProducts()[selectedRow!], newQty:Int(selectedQtyString)!)
            
            //refresh table data
            productTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reload table data to get updated data
        productTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        productName.text = ""
        resetFields() //clear fields on view disappear
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass manager data to managerViewController
        let managerVC = segue.destination as? ManagerViewController
        managerVC!.productManager = productManager
        managerVC!.historyManager = historyManager
    }
    
    //clear all fields
    func resetFields() {
        selectedQty.isHidden = true;
        selectedQty.text = ""
        selectedQtyString = ""
        totalAmount.isHidden = true
        totalAmount.text = ""
    }

}


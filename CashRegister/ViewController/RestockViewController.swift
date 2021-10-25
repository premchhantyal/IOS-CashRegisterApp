//
//  RestockViewController.swift
//  CashRegister
//
//  Created by user193216 on 10/24/21.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var stockTableView: UITableView!
    @IBOutlet weak var newQuantity: UITextField!
    var productManager : ProductManager?
    var selectedRow : Int?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager!.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockCell", for: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = productManager!.getAllProducts()[indexPath.row].name
        
        let qty = productManager!.getAllProducts()[indexPath.row].quantity ?? 0;
        cell.detailTextLabel?.text = "\(qty)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row
        
    }
    
    @IBAction func addRestock(_ sender: Any) {
        if let newQty = newQuantity.text {
            
            //check if new quantity is empty OR row is not selected
            if (selectedRow == nil || newQty.isEmpty) {
                var alert = UIAlertController(title: "Error!!", message: "You have to select an item and provide a new quantity.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }else {
                //add new quantity to the existing quantity of the repective product
                productManager!.getAllProducts()[selectedRow!].quantity += Int(newQty)!
                
                //reload table to show updated data
                stockTableView.reloadData()
                
                newQuantity.text = ""
            }
        }
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
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


    
}

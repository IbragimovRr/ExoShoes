//
//  OrderViewController.swift
//  Exostyle
//
//  Created by Руслан on 05.04.2024.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var array = [Order]()
    var orderNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addOrder()
    }
    
    func addOrder() {
        array = RealmSelf().getOrders()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gradient().setGradientBackground(view: self.view)
        
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension OrderViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath) as! OrderTableViewCell
        cell.number.text = array[indexPath.row].number
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        orderNumber = array[indexPath.row].number
        performSegue(withIdentifier: "goOrder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goOrder" {
            let vc = segue.destination as! PayViewController
            vc.orderNumber = orderNumber
        }
        
    }
    
    
}

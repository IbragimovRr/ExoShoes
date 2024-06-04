//
//  CartViewController.swift
//  Exostyle
//
//  Created by Ибрагимов Эльдар on 05.04.2024.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private var array = [TovarsRealm]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addTovars()
        
    }
    
    private func addPrice() {
        var price = 0
        for x in array {
            price += x.price
        }
        priceLbl.text = "\(price)"
    }
    
    private func addTovars() {
        array = RealmSelf().getBagTovars()
        tableView.reloadData()
        addPrice()
    }
    
    @IBAction func pay(_ sender: UIButton) {
        guard array.count != 0 else {return}
        array.removeAll()
        RealmSelf().removeBag()
        performSegue(withIdentifier: "afterPay", sender: self)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gradient().setGradientBackground(view: self.view)
        
    }

}
extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath) as! CartTableViewCell
        cell.im.image = UIImage(named: array[indexPath.row].image)
        cell.name.text = array[indexPath.row].name
        cell.price.text = "\(array[indexPath.row].price)"
        return cell
    }
    
    
}

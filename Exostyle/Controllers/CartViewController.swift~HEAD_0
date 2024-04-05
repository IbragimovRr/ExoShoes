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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    @IBAction func pay(_ sender: UIButton) {
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath) as! CartTableViewCell
        return cell
    }
    
    
}

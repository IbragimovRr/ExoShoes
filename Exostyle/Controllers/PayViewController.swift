//
//  PayViewController.swift
//  Exostyle
//
//  Created by Руслан on 05.04.2024.
//

import UIKit

class PayViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    var orderNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if orderNumber == "" {
            let random = Int.random(in: 1000000...9999999)
            lbl.text = "\(random)"
            RealmSelf().saveToOrder(number: "\(random)")
        }else {
            lbl.text = orderNumber
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gradient().setGradientBackground(view: self.view)
        
        
    }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func phoneBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Впишите телефон", message: "", preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "+7"
            
        }
        alertController.addAction(UIAlertAction(title: "Добавить", style: .default))
        alertController.addAction(UIAlertAction(title: "Назад", style: .cancel))
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func instagramBtn(_ sender: UIButton) {
        let url = URL(string: "https://www.instagram.com/exo.mhk?igsh=MWFsdW5mMmhtbndtbA==")!
        UIApplication.shared.open(url)
    }
    
}

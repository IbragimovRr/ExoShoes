//
//  LogoViewController.swift
//  Exostyle
//
//  Created by Руслан on 05.04.2024.
//

import UIKit

class LogoViewController: UIViewController {

    @IBOutlet weak var viewBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBorder()
        Tovars().addTovar()
        Recomend().addRecomend()
    }
    
    func createBorder() {
        viewBtn.layer.borderColor = UIColor.white.cgColor
        viewBtn.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Gradient().setGradientBackground(view: self.view)
        
    }



}

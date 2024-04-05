//
//  Gradient.swift
//  Exostyle
//
//  Created by Ибрагимов Эльдар on 05.04.2024.
//

import Foundation
import UIKit

class Gradient {
    
    func setGradientBackground(view:UIView) {
        let colorTop =  UIColor(red: 30.0/255.0, green: 51.0/255.0, blue: 63.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
                
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}

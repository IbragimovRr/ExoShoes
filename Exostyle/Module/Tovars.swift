//
//  File.swift
//  Exostyle
//
//  Created by Руслан on 05.04.2024.
//

import Foundation
import RealmSwift

 
class TovarsRealm: Object {
    @objc dynamic var price: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var size:String = ""
}

struct Tovar {
    var price: Int
    var name: String
    var images: [String]
    var sizes = [34, 36, 38, 40]
}

struct Recomenddation {
    var name:String
    var image:String
}

class Recomend {
    static var array = [Recomenddation]()
    
    func addRecomend() {
        Recomend.array.append(Recomenddation(name: "Новинка", image: "news1"))
        Recomend.array.append(Recomenddation(name: "Акция", image: "sales1"))
    }
}

class Tovars {
    static var array = [Tovar]()
    
    func addTovar() {
        Tovars.array.append(Tovar(price: 18000, name: "Nike Sb Dunk", images: ["1.1", "1.2", "1.3"]))
        Tovars.array.append(Tovar(price: 17493, name: "New Balance 550", images: ["21", "22", "23", "24"]))
        Tovars.array.append(Tovar(price: 39990, name: "Alexander McQueen", images: ["31", "32", "33"]))
        Tovars.array.append(Tovar(price: 7990, name: "Adidas Yeezy Slides", images: ["41", "42", "43", "44"]))
    }
   
}

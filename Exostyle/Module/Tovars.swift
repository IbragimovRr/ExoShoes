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
        Recomend.array.append(Recomenddation(name: "Акция", image: "sale1"))
    }
}

class Tovars {
    static var array = [Tovar]()
    
    func addTovar() {
        Tovars.array.append(Tovar(price: 8997, name: "Графитовая куртка", images: ["1.1", "1.2", "1.3"]))
        Tovars.array.append(Tovar(price: 17493, name: "Черный пуховик", images: ["21", "22", "23", "24"]))
        Tovars.array.append(Tovar(price: 39990, name: "Черное пальто", images: ["31", "32", "33"]))
        Tovars.array.append(Tovar(price: 37990, name: "Короткий пуховик", images: ["41", "42", "43", "44"]))
    }
   
}

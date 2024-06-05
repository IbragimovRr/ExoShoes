//
//  Realm.swift
//  Exostyle
//
//  Created by Руслан on 05.04.2024.
//

import Foundation
import RealmSwift



class RealmSelf {
    
    func removeBag() {
        let realm = try! Realm()
        let result = realm.objects(TovarsRealm.self)
        try! realm.write {
            realm.delete(result)
        }
    }
    
    func saveToBag(tovar:Tovar,size:String?) {
        let realm = try! Realm()
        let bagRealm = TovarsRealm()
        bagRealm.name = tovar.name
        bagRealm.price = tovar.price
        bagRealm.size = size!
        bagRealm.image = tovar.images[0]
        try! realm.write {
            realm.add(bagRealm)
        }
        
    }
    
    func getBagTovars() -> [TovarsRealm] {
        let realm = try! Realm()
        let objects = realm.objects(TovarsRealm.self)
        var tovars = [TovarsRealm]()
        for x in objects {
            tovars.append(x)
        }
        return tovars
    }
    
    
    func saveToOrder(number:String) {
        let realm = try! Realm()
        let order = Order()
        order.number = number
        try! realm.write {
            realm.add(order)
        }
    }
    
    func getOrders() -> [Order] {
        let realm = try! Realm()
        let objects = realm.objects(Order.self)
        var tovars = [Order]()
        for x in objects {
            tovars.append(x)
        }
        return tovars
    }
    
}



class Order: Object {
    @objc dynamic var number: String = ""
}

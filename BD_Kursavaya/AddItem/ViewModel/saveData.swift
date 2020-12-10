//
//  saveData.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 08.12.2020.
//

import UIKit
import RealmSwift

class SaveData {
    
    func saveData(item: AllData){
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(item)
        }
        readData()
    }
    
    func readData() -> Results<AllData>{
        let realm = try! Realm()
        
        let info = try! realm.objects(AllData.self)
        print(info.count)
        return info
    }
    
    func removeData(item: Int){
        let realm = try! Realm()
        
        let objects = realm.objects(AllData.self)
        if objects.count == 1{
            try! realm.write{
                realm.deleteAll()
            }
        }else{
            let deleteItem = objects[item]
            print()
            print("delete item = \(deleteItem)")
            print()
            try! realm.write{
                realm.delete(deleteItem)
            }
        }
    }
    
}


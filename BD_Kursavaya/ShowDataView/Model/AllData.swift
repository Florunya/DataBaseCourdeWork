//
//  AllData.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 04.12.2020.
//

import Foundation
import RealmSwift

enum typeOfBelt{
    case normal
    case slim
    case doNotSet //дефолтный параметр
}

enum typeOfTransmission {
    case downward // понижающая
    case raising // повышающая
    case doNotSet
}

enum cipherOfBelt: String{
    case O = "O"
    case A = "A"
    case B = "B"
    case V = "V"
    case YO = "YO"
    case YA = "YA"
    case YB = "YB"
    case YV = "YV"
    case doNotSet = "Do Not Set"
}

class AllData: Object{
    
    @objc dynamic var n1 = 0.0
    @objc dynamic var n2 = 0.0
    @objc dynamic var a = 0.0
    @objc dynamic var e = 0.0
    @objc dynamic var n = 0.0
    @objc dynamic var h = 0.0
    @objc dynamic var tb = 0.0
    @objc dynamic var q = 0.0
    @objc dynamic var v = 0.0
    @objc dynamic var cipher = ""
    @objc dynamic var typeOfTransmission = ""
    
    
    //Подсчитанные значения
    @objc dynamic var DP1 = 0.0
    @objc dynamic var DP2 = 0.0
    @objc dynamic var aSel = 0.0
    @objc dynamic var aMin = 0.0
    @objc dynamic var b0 = 0.0
    @objc dynamic var bp = 0.0
    @objc dynamic var hc = 0.0
    @objc dynamic var aMax = 0.0
    @objc dynamic var D1 = 0.0 // округленный
    @objc dynamic var D2 = 0.0 // округленный
    @objc dynamic var Dcp = 0.0
    @objc dynamic var L = 0.0 // округленная
    @objc dynamic var L0 = 0.0
    @objc dynamic var delta = 0.0
    @objc dynamic var lambda = 0.0
    @objc dynamic var aFin = 0.0
    @objc dynamic var vTab = 0.0
    @objc dynamic var vRes = 0.0
    @objc dynamic var P = 0.0
    
    
}

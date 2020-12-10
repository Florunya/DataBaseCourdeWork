//
//  ExampleData.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 09.12.2020.
//

import Foundation
import SwiftDataTables

let tableNames = ["Таблица 1", "Таблица 2", "Таблица 3", "Таблица 4"]

public func  normalizeTable1() -> [[Any]] {
    return [
        ["b0", "Нормальные","О","10"],
        ["bp", "Нормальные","О","8.5"],
        ["hc", "Нормальные","О","6"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Нормальные","О","63"],
        ["Рекомендованная максимальная скорость ремня, V","Нормальные","О","25"],
        
        ["b0", "Нормальные","A","13"],
        ["bp", "Нормальные","A","11"],
        ["hc", "Нормальные","A","8"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Нормальные","А","90"],
        ["Рекомендованная максимальная скорость ремня, V","Нормальные","A","25"],
        
        ["b0", "Нормальные","Б","17"],
        ["bp", "Нормальные","Б","14"],
        ["hc", "Нормальные","Б","10.5"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Нормальные","Б","125"],
        ["Рекомендованная максимальная скорость ремня, V","Нормальные","Б","25"],
        
        ["b0", "Нормальные","В","22"],
        ["bp", "Нормальные","В","19"],
        ["hc", "Нормальные","В","13.5"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Нормальные","В","200"],
        ["Рекомендованная максимальная скорость ремня, V","Нормальные","В","25"],
        
        ["b0", "Узкие","УО","10"],
        ["bp", "Узкие","УО","8.5"],
        ["hc", "Узкие","УО","8"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Узкие","УО","63"],
        ["Рекомендованная максимальная скорость ремня, V","Узкие","УО","40"],
        
        ["b0", "Узкие","УА","13"],
        ["bp", "Узкие","УА","11"],
        ["hc", "Узкие","УА","10"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Узкие","УА","90"],
        ["Рекомендованная максимальная скорость ремня, V","Узкие","УА","40"],
        
        ["b0", "Узкие","УБ","17"],
        ["bp", "Узкие","УБ","14"],
        ["hc", "Узкие","УБ","13"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Узкие","УБ","140"],
        ["Рекомендованная максимальная скорость ремня, V","Узкие","УБ","40"],
        
        ["b0", "Узкие","УВ","22"],
        ["bp", "Узкие","УВ","19"],
        ["hc", "Узкие","УВ","18"],
        ["Минимальный расчетный диаметр шкива, Dp1", "Узкие","УВ","224"],
        ["Рекомендованная максимальная скорость ремня, V","Узкие","УВ","40"]
        
    ]
}

public func  normalizeTable2() -> [[Any]] {
    return [
        ["1", "1.5"],
        ["2", "1.2"],
        ["3", "1.0"],
        ["4", "0.95"],
        ["5", "0.9"],
        [">=6", "0.85"]
    ]
}

public func getCounteData() -> [[Any]]{
    
    let saveData = SaveData()
    let array = saveData.readData()
    var dopArray: [Any] = []
    var resultArray: [[Any]] = []
    let count = array.count == 0 ? 0 : array.count - 1
    if array.count != 0 {
        for i in 0...count{
            dopArray.append(i+1)
            dopArray.append(array[i].n1)
            dopArray.append(array[i].n2)
            dopArray.append(array[i].a)
            dopArray.append(array[i].e)
            dopArray.append(array[i].n)
            dopArray.append(array[i].h)
            dopArray.append(array[i].tb)
            dopArray.append(array[i].q)
            dopArray.append(array[i].v)
            dopArray.append(array[i].cipher)
            dopArray.append(array[i].typeOfTransmission)
            dopArray.append(array[i].DP1)
            dopArray.append(array[i].DP2)
            dopArray.append(array[i].aSel)
            dopArray.append(array[i].aMin)
            dopArray.append(array[i].b0)
            dopArray.append(array[i].bp)
            dopArray.append(array[i].hc)
            dopArray.append(array[i].aMax)
            dopArray.append(array[i].D1)
            dopArray.append(array[i].D2)
            dopArray.append(array[i].Dcp)
            dopArray.append(array[i].L)
            dopArray.append(array[i].L0)
            dopArray.append(array[i].delta)
            dopArray.append(array[i].lambda)
            dopArray.append(array[i].aFin)
            dopArray.append(array[i].vTab)
            dopArray.append(array[i].vRes)
            dopArray.append(array[i].P)
            resultArray.append(dopArray)
            dopArray.removeAll()
        }
    }else{
        resultArray = []
    }
    return resultArray
}

public func  normalizeTable3() -> [[Any]] {
    return [
        ["400","2"],
        ["425","2"],
        ["450","2"],
        ["475","2"],
        ["500","2"],
        ["530","2"],
        ["560","2"],
        ["600","2"],
        ["630","2"],
        ["670","2"],
        ["710","2"],
        ["750","2"],
        ["800","2"],
        ["850","2"],
        ["900","2"],
        ["950","2"],
        ["1000","3"],
        ["1060","3"],
        ["1120","3"],
        ["1180","3"],
        ["1250","3"],
        ["1320","3"],
        ["1400","3"],
        ["1500","3"],
        ["1600","3"],
        ["1700","3"],
        ["1800","3"],
        ["1900","3"],
        ["2000","3"],
        ["2120","7.5"],
        ["2240","7.5"],
        ["2360","7.5"],
        ["2500","7.5"],
        ["2650","10"],
        ["2800","10"],
        ["3000","10"],
        ["3150","10"],
        ["3350","10"],
        ["3550","10"],
        ["3750","10"],
        ["4000","10"],
        ["4250","10"],
        ["4500","10"]
        
    ]
}
public func  normalizeTable4() -> [[Any]] {
    return [
        ["63","0.8"],
        ["63","-0.8"],
        ["71","1"],
        ["71","-1"],
        ["80","1"],
        ["80","-1"],
        ["90","1.2"],
        ["90","-1.2"],
        ["100","1.2"],
        ["100","-1.2"],
        ["112","1.2"],
        ["112","-1.2"],
        ["125","1.6"],
        ["125","-1.6"],
        ["140","1.6"],
        ["140","-1.6"],
        ["160","2"],
        ["160","-2"],
        ["180","2"],
        ["180","-2"],
        ["200","2.5"],
        ["200","-2.5"],
        ["224","2.5"],
        ["224","-2.5"],
        ["250","2.5"],
        ["250","-2.5"],
        ["280","3.2"],
        ["280","-3.2"],
        ["315","3.2"],
        ["315","-3.2"]
    ]
}

//
//  Constants.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 04.12.2020.
//

import Foundation



class Constants{
    
    //MARK: - Table 1
    let tableValueO = [
    
        "type": typeOfBelt.normal,
        "b0": 10.0,
        "bp": 8.5,
        "hc": 6.0,
        "Dp1": Float(63.0),
        "V": 25.0
    
    ] as [String : Any]
    
    let tableValueA = [
        
        "type": typeOfBelt.normal,
        "b0": 13.0,
        "bp": 11.0,
        "hc": 8.0,
        "Dp1": Float(90.0),
        "V": 25.0

    
    ] as [String: Any]
    
    let tableValueB = [
        "type": typeOfBelt.normal,
        "b0": 17.0,
        "bp": 14.0,
        "hc": 10.5,
        "Dp1": Float(125.0),
        "V": 25.0
    
    ] as [String: Any]
    
    let tableValueV = [
        "type": typeOfBelt.normal,
        "b0": 22.0,
        "bp": 19.0,
        "hc": 13.5,
        "Dp1": Float(200.0),
        "V": 25.0
    
    ] as [String: Any]
    
    let tableValueYO = [
        "type": typeOfBelt.slim,
        "b0": 10.0,
        "bp": 8.5,
        "hc": 8.0,
        "Dp1": Float(63.0),
        "V": 40.0
        
    ] as [String: Any]
    
    let tableValueYA = [
        "type": typeOfBelt.slim,
        "b0": 13.0,
        "bp": 11.0,
        "hc": 10.0,
        "Dp1": Float(90.0),
        "V": 40.0
        
    ] as [String: Any]
    let tableValueYB = [
    
        "type": typeOfBelt.slim,
        "b0": 17.0,
        "bp": 14.0,
        "hc": 13.0,
        "Dp1": Float(140.0),
        "V": 40.0
    
    ] as [String: Any]
    let tableValueYV = [
        "type": typeOfBelt.slim,
        "b0": 22.0,
        "bp": 19.0,
        "hc": 18.0,
        "Dp1": Float(224.0),
        "V": 40.0
    ] as [String: Any]

 
    let keyForRound = [63.0, 71.0, 80.0, 90.0, 100.0, 112.0, 125.0, 140.0, 160.0, 180.0, 200.0, 224.0, 250.0, 280.0, 315.0]
    
    let roundedDP1 = [
    
        63.0: 0.8,
        71.0: 1.0,
        80.0: 1.0,
        90.0: 1.2,
        100.0: 1.2,
        112.0: 1.2,
        125.0: 1.6,
        140.0: 1.6,
        160.0: 2.0,
        180.0: 2.0,
        200.0: 2.5,
        224.0: 2.5,
        250.0: 2.5,
        280.0: 3.2,
        315.0: 3.2
    
    ] as! [Double: Double]
    
    let keyForLenght = [400, 425, 450, 475, 500, 530, 560, 600, 630, 670, 710, 750, 800, 850, 900, 950, 1000, 1060, 1120, 1180, 1250, 1320, 1400, 1500, 1600, 1700, 1900, 2000, 2120, 2240, 2360, 2500, 2650, 2800, 3000, 3150, 3350, 3550, 3750, 4000, 4250, 4500]
    
    let roundLength = [
    
        400.0: 2.0,
        425.0: 2.0,
        450.0: 2.0,
        475.0: 2.0,
        500.0: 2.0,
        530.0: 2.0,
        560.0: 2.0,
        600.0: 2.0,
        630.0: 2.0,
        670.0: 2.0,
        710.0: 2.0,
        750.0: 2.0,
        800.0: 2.0,
        850.0: 2.0,
        900.0: 2.0,
        950.0: 2.0,
        1000.0: 3.0,
        1060.0: 3.0,
        1120.0: 3.0,
        1180.0: 3.0,
        1250.0: 3.0,
        1320.0: 3.0,
        1400.0: 3.0,
        1500.0: 3.0,
        1600.0: 5.0,
        1700.0: 5.0,
        1900.0: 5.0,
        2000.0: 5.0,
        2120.0: 7.5,
        2240.0: 7.5,
        2360.0: 7.5,
        2500.0: 7.5,
        2650.0: 10.0,
        2800.0: 10.0,
        3000.0: 10.0,
        3150.0: 10.0,
        3350.0: 10.0,
        3550.0: 10.0,
        3750.0: 10.0,
        4000.0: 10.0,
        4250.0: 10.0,
        4500.0: 10.0
    
    ] as! [Double: Double]
    
}

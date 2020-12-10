//
//  FormulsViewModel.swift
//  BD_Kursavaya
//
//  Created by Флора Гарифуллина on 04.12.2020.
//

import Foundation

class Formuls{
//    Определяет минимальный допустимый диаметр для увеличения долговечности и кпд -> Dp1
    func getMinDeametrForKPD(V: Double, n1: Float) -> Float {
        return Float((V * 1000 * 60))/(.pi * n1)
    }
    
//  Определяет минимальный допустимый диаметр при известном межосевом растоянии (u) -> Dp1
    func getMinDeamWithU(a: Float, n1: Float, n2: Float, E: Float) -> Float {
        
        let u = n1/n2
        var aDp2: Float
        var Dp2: Float
        
        switch u {
        case 1:
            aDp2 = 1.5
        case 2:
            aDp2 = 1.2
        case 3:
            aDp2 = 1.0
        case 4:
            aDp2 = 0.95
        case 5:
            aDp2 = 0.9
        default:
            aDp2 = 0.85
        }
        
        Dp2=a/(aDp2)
        
        return Dp2 * (1 - E) / u
    }
    
    func getD1(Q: Float, N: Float, n1: Float) -> Float {
        let item = N * 1000 / n1
        return Q * pow(item, (1/3))
    }
    
//    Определение Dp2 (Диаметра большого шкива) для понижающего
    func getDiamBolShkivaForLow(N: Float, n1: Float,n2: Float, E: Float, Q: Float) -> (Float){
        let D1 = getD1(Q: Q, N: N, n1: n1)
        let u = n1 / n2
        let Dp2 = D1 * (1 - E) * u
        return Dp2
        
    }
    
//    Определение Dp2 (Диаметра большого шкива) для повышающего
    func getDiamBolShkivaForRaise(N: Float, n1: Float, n2: Float, E: Float, Q: Float) -> (Float) {
        let u = n1/n2
        let D1 = getD1(Q: Q, N: N, n1: n1)
        let Dp2 = D1 * u / (1 - E)
        return Dp2
    }
    
    //Считает минимальное и максимальное межосевое растояние (a), затем возвращает среднее
    func getMinAndMaxAReturnA_Sel(Dp1: Float, Dp2: Float, h: Float) -> (Float, Float, Float) {
        let aMin = 0.55 * (Dp1 + Dp2) + h
        let aMax = 2 * (Dp1 + Dp2)
        return (aMin, aMax, ((aMax - aMin) / 2))
    }

    
//    Определение расчетной длины ремня L без округление
    func getLenghtRem(D1: Float, D2: Float, aSel: Float) -> Float {
        return 2 * aSel + (.pi * (D1 + D2)) / 2 + (pow((D2 - D1), 2)) / (4 * aSel)
    }
    
    func getMinDiametrWithTorque(tb: Float) -> Float{
        return 30 * pow(tb, 1/3)
    }
//    определение среднего диаметра
    func getDcp(D1: Float, D2: Float) -> Float {
        return (D1 + D2) / 2
    }
    
//    определение лямбды
    func getLambda(LO: Float, Dcp: Float) -> Float {
        return LO - .pi * Dcp
    }
    
//  определение дельты
    func getDelta(D1: Float, D2: Float) -> Float {
        return (D2 - D1) / 2
    }
    
//    определение окончательного межосевого расстояния a_fin
    func getAFin(delta: Float, lambda: Float) -> Float {
        return (lambda + pow((pow(lambda, 2) - 8 * (pow(delta, 2))), 1/2)) / 4
    }
    
//    определение скорости V
    func getV(Dp1: Float, n1: Float) -> Float {
        return (.pi * Dp1 * n1) / (pow(10, 3) * 60)
    }
    
//    определение угла обхвата p
    func getP(Dp1: Float, Dp2: Float, aFin: Float) -> Float {
//        let p = (Dp2 - Dp1) / (2 * aFin)
        return acos((Dp2 - Dp1) / (2 * aFin)) * 2 * 180 / .pi
//        return (2 * (2 * .pi + acos((Dp2 - Dp1) / (2 * aFin)))) * 180 / .pi
        
    }
}

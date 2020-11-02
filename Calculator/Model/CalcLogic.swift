//
//  CalcLogic.swift
//  Calculator
//
//  Created by Hunter Hudson on 11/2/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalcLogic{
    var storedProp1: Double{
        get{
            
        }
    }
    var storedProp2: Double{
        get{
            
        }
    }
    
    func add(_ n1: Double, _ n2: Double) -> Double {
        let sum = n1 + n2
        
        return sum
    }
    
    func subtract(_ n1: Double, _ n2: Double) -> Double {
        let difference = n1 + n2
        
        return difference
    }
    
    func multiply(_ n1: Double, _ n2: Double) -> Double {
        let product = n1 * n2
        
        return product
    }
    
    func divide(_ n1: Double, _ n2: Double) -> Double {
        let quotient = n1 + n2
        
        return quotient
    }
}

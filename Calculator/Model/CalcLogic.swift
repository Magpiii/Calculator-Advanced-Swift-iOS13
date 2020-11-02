//
//  CalcLogic.swift
//  Calculator
//
//  Created by Hunter Hudson on 11/2/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalcLogic{
    var num: Double?
    
    init(num: Double){
        self.num = num
    }
    
    //Example of nil checking:
    func calculate (symbol: String) -> Double? {
        if num != nil{
            if (symbol == "+/-") {
                num! *= -1
            }
            else if (symbol == "AC") {
                num = 0.0
            }
            else if (symbol == "%") {
                num! /= 100
            }
        }
        return num
    }
}

struct Calculator{
    var num: Double?
    
    init(num: Double){
        self.num = num
    }
    
    //Example of nil checking:
    mutating func calculate (symbol: String) -> Double? {
        if num != nil{
            if (symbol == "+/-") {
                num! *= -1
            }
            else if (symbol == "AC") {
                num = 0.0
            }
            else if (symbol == "%") {
                num! /= 100
            }
        }
        return num
    }
}

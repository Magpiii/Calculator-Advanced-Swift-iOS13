//
//  CalcLogic.swift
//  Calculator
//
//  Created by Hunter Hudson on 11/2/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

/*Dumb way using a class:
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
*/

//Big-brain way using a struct:
struct Calculator{
    //These should be private so other classes and structs can't mess with them:
    private var num: Double?
    
    /*The entire tuple can be optional, or you can make just one or both elements of the tuple optional:
    */
    private var intermediateCalc: (calcMethod: String, num1: Double)?
    
    mutating func setNum(_ num: Double) {
        self.num = num
    }
    
    mutating func calculate (symbol: String) -> Double? {
        if let n = num{
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0.0
            case "%":
                return n / 100
            case "=":
                /*If the user taps on equal, that means they've already typed in the 2nd number, so this will work (or n2 will just be equal to the first number):
                */
                return performTwoNumberCalc(n2: n)
            default:
                //...sets the symbol and the number in the tuple to the appropriate values:
                intermediateCalc = (calcMethod: symbol, num1: n)
            }
            }
        return nil
        }
    
    /*This func is private so other structs and classes can't call it because that would cause an error:
    */
    private func performTwoNumberCalc(n2: Double) -> Double? {
        //Compound assignment allows one to create two optionally bound constants:
        
        if let n1 = intermediateCalc?.num1, let operation = intermediateCalc?.calcMethod {
            switch operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Error code 6: invalid symbol.")
            }
        }
        return nil
    }
}

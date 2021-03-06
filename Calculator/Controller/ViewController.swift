//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Init Calculator:
    private var calculator = Calculator()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    /*Bool for if the user is finished typing (using "private" keyword makes a property only visible in the current scope (in this case ViewController)):
    */
    private var isFinishedTypingNum = true
    
    //Computed properties often save time and effort:
    private var displayValue: Double{
        get {
            /*Guard lets are really only necessary when the alternate case is something that REALLY REALLY REALLY should not happen. Otherwise, an if-let is preferable:
            */
            guard let labelText = Double(displayLabel.text!) else { fatalError("Error code 2: unexpectedly found nil when unwrapping displayLabel.text.") }
            
            return labelText
        }
        //Sets the display label to the new value once displayLabel is set:
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed:
        
        //User is finished if they hit a calc button:
        isFinishedTypingNum = true
        
        if let calcMethod = sender.currentTitle {
            //Uses calculator to to perform calculation based on passed-in calcMethod:
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
    }
}

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        //Optionally binds numValue because sender.currentTitle is an optional:
        if let numValue = sender.currentTitle {
            /*
            if (displayLabel.text != "0"){
                //Adds the sender's current title to the display label:
                displayLabel.text! += "\(numValue)"
            } else {
                /*Sets the display label as the current title of the sender if the label displays 0:
                */
                displayLabel.text = numValue
            }
            */
            
            if isFinishedTypingNum {
                displayLabel.text = numValue
                
                //User is not finished typing number now:
                isFinishedTypingNum = false
            } else {
                /*Continues adding numbers to the display label as long as the user hasn't pressed a calc button:
                */
                displayLabel.text! += numValue
                
                if (numValue == "."){
                    /*The "floor" method allows one to round down a double or float:
                    */
                    
                    //Shorthand way to declare a Boolean:
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        //Simply putting "return" tells the current function to stop:
                        return
                    }
                }
            }
            
        }
    }
}


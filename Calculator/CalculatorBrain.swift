//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Grey Patterson on 2017-02-09.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private var accumulator = 0.0
    
    func setOperand (operand: Double){
        accumulator = operand
    }
    
    func performOperation(symbol: String){
        switch symbol {
        case "π":
            accumulator = M_PI
        case "√":
            accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}

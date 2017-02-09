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
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation, //sqrt,
        "cos": Operation.UnaryOperation //cos
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation
        case BinaryOperation
        case Equals
    }
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
                case .Constant(let value):
                    accumulator = value
                case .UnaryOperation:
                    break
                case .BinaryOperation:
                    break
                case .Equals:
                    break
            }
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}

//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Grey Patterson on 2017-02-09.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import Foundation

func multiply(op1: Double, op2: Double) -> Double{
    return op1*op2
}
func divide(op1: Double, op2: Double) -> Double{
    return op1/op2
}
func add(op1: Double, op2: Double) -> Double{
    return op1+op2
}
func subtract(op1: Double, op2: Double) -> Double{
    return op1-op2
}

class CalculatorBrain{
    private var accumulator = 0.0
    
    func setOperand (operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "×": Operation.BinaryOperation(multiply),
        "÷": Operation.BinaryOperation(divide),
        "+": Operation.BinaryOperation(add),
        "-": Operation.BinaryOperation(subtract),
        "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
                case .Constant(let value):
                    accumulator = value
                case .UnaryOperation(let opFunction):
                    accumulator = opFunction(accumulator)
                case .BinaryOperation(let opFunction):
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

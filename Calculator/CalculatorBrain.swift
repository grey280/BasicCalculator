//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Grey Patterson on 2017-02-09.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import Foundation

class CalculatorBrain{
    // Used for storing the data we're working on
    private var accumulator = 0.0
    
    // Used to feed data in
    func setOperand (operand: Double){
        accumulator = operand
    }
    
    // The different categories of operations we can handle.
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    // The different operations we can handle
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "±": Operation.UnaryOperation({ -$0 }),
        "×": Operation.BinaryOperation({$0 * $1}),
        "÷": Operation.BinaryOperation({$0 / $1}),
        "+": Operation.BinaryOperation({$0 + $1}),
        "-": Operation.BinaryOperation({$0 - $1}),
        "=": Operation.Equals
    ]
    
    // Need the ability to handle binary operations, which need somewhere to be stored briefly
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    private var pending: PendingBinaryOperationInfo?
    
    // Does the actual handling of the binary operation once you hit the = key
    private func executePendingBinaryOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    // Handling all the operations that get passed in
    func performOperation(symbol: String){
        if let operation = operations[symbol]{
            switch operation{
                case .Constant(let value):
                    accumulator = value
                case .UnaryOperation(let opFunction):
                    accumulator = opFunction(accumulator)
                case .BinaryOperation(let opFunction):
                    pending = PendingBinaryOperationInfo(binaryFunction: opFunction, firstOperand: accumulator)
                case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    // An easy way to access the result of operations. Interfaces!
    var result: Double{
        get{
            return accumulator
        }
    }
}

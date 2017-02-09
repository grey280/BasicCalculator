//
//  ViewController.swift
//  Calculator
//
//  Created by Grey Patterson on 2017-02-07.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var displayField: UILabel!
    
    private var userWasTyping = false
    private var pointWasPressed = false
    private var brain = CalculatorBrain()
    
    private var displayValue: Double{ // An easier way of changing the way we access the display
        get {
            return Double(displayField.text!)!
        }
        set {
            displayField.text = String(newValue)
        }
    }
    
    @IBAction private func digitPress(_ sender: UIButton) { // Handles the user pressing a digit
        let digitPressed = sender.title(for: .normal)! // Which digit did they press?
        if !userWasTyping {
            userWasTyping = true
            displayValue = Double(digitPressed)!
        }else{
            displayValue = displayValue * 10 + Double(digitPressed)!
        }
    }
    
    @IBAction private func performOperation(sender: UIButton){
        if userWasTyping{
            brain.setOperand(operand: displayValue)
            userWasTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


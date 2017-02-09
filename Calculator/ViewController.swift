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
    
    @IBAction private func deleteKeyPress(_ sender: UIButton) { // Handles user pressing the delete key
        var temp = displayField.text!
        let length = temp.characters.count
        guard length > 0 else { // If the length is 0 and you try to continue, it'll mean Problems
            return
        }
        temp.remove(at: temp.index(temp.endIndex, offsetBy: -2)) // This and next line: removes ones digit, decimal point
        temp.remove(at: temp.index(temp.endIndex, offsetBy: -2))
        if temp.characters.count < 1 { // Just set it to zero if it's zero
            displayValue = 0.0
        }else{ // Otherwise, convert back to a double, divide by ten so tens becomes ones, etc.
            displayValue = Double(temp)! / 10
        }
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


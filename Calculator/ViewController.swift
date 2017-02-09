//
//  ViewController.swift
//  Calculator
//
//  Created by Grey Patterson on 2017-02-07.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayField: UILabel!
    
    var userWasTyping = false
    
    var displayValue: Double{
        get {
            return Double(displayField.text!)!
        }
        set {
            displayField.text = String(newValue)
        }
    }
    
    @IBAction func digitPress(_ sender: UIButton) { // Handles the user pressing a digit
        let digitPressed = sender.title(for: .normal)! // Which digit did they press?
        if !userWasTyping{ // If this is the first digit they're inputting, remove the zero first
            userWasTyping = true
            displayValue = Double(digitPressed)!
        }else{ // Otherwise, just add on the new digit
            var temp = String(displayValue)
            temp += digitPressed
            displayValue = Double(temp)!
//            displayField.text = displayField.text! + digitPressed
        }
    }
    
    @IBAction func deleteKeyPress(_ sender: UIButton) { // Handles user pressing the delete key
        var temp = displayField.text!
//        let length = displayField.text!.characters.count
        let length = temp.characters.count
        guard length > 0 else { // If the length is 0 and you try to continue, it'll mean Problems
            return
        }
        temp.remove(at: temp.index(before: temp.endIndex))
        if temp.characters.count < 1 {
            displayValue = 0.0
        }else{
            displayValue = Double(temp)!
        }
//        displayField.text!.remove(at: displayField.text!.index(before: (displayField.text!.endIndex))) // Remove the last character
//        if displayField.text!.characters.count < 1 { // If that was the *only* character that you just removed, reset to the default-zero
//            displayField.text = "0"
//            userWasTyping = false
//        }
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


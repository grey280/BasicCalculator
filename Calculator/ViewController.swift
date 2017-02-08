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
    
    @IBAction func digitPress(_ sender: UIButton) {
        let digitPressed = sender.title(for: .normal)!
        if !userWasTyping{
            userWasTyping = true
            displayField.text = digitPressed
        }else{
            displayField.text = displayField.text! + digitPressed
        }
    }
    @IBAction func deleteKeyPress(_ sender: UIButton) {
        let length = displayField.text!.characters.count
        print(length)
        guard length > 0 else {
            return
        }
        displayField.text!.remove(at: displayField.text!.index(before: (displayField.text!.endIndex)))
        if displayField.text!.characters.count < 1 {
            displayField.text = "0"
            userWasTyping = false
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


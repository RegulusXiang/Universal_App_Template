//
//  ViewController.swift
//  FoodTracker
//
//  Created by xg on 16/1/2.
//  Copyright © 2016年 xg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {// adopt the protocol for UITextFieldDelegate

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField! //IB for interface builder, weak means it can be nil, 
    //! meansthe type is an implicitly unwrapped optional, which is an
    //optional type that will always have a value after the value is first set.
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self //The self refers to the ViewController class
        
    }

    //I have no need to implement this method.
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    //MARK: Action
    @IBAction func setDefaultLabel(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
        
    }
    
}


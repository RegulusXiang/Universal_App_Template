//
//  MealViewController.swift
//  FoodTracker
//
//  Created by xg on 16/1/2.
//  Copyright © 2016年 xg. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
                      UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {// adopt the protocol for UITextFieldDelegate

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField! //IB for interface builder, weak means it can be nil, 
    //! meansthe type is an implicitly unwrapped optional, which is an
    //optional type that will always have a value after the value is first set.
    
    //@IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    /*
    This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new meal.
    */
    var meal: Meal?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
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
    
    //MARK: Navigation
    //this method lets you configure a view controller before it's presented
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender{ //This code uses the identity operator (===) to check that the object referenced by the saveButton outlet is the same object instance as sender. If it is, the if statement is executed.
            let name = nameTextField.text ?? "" //if it’s nil, the operator the returns the empty string ("") instead.
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            //set the meal pass to be passed to the MealTableViewController before it's presented
            meal = Meal(name: name, photo: photo, rating: rating)
            
            
        }
        
    }

    //MARK: Action
//    @IBAction func setDefaultLabel(sender: UIButton) {
//        mealNameLabel.text = "Default Text"
//    }
    
    //it’s quite easy to give a view the same capabilities as a control
    //by adding a gesture recognizer to it.
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        //Only allow image to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //mealNameLabel.text = textField.text
        
    }
    
   
    
}


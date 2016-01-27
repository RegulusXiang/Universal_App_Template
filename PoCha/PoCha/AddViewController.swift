//
//  AddViewController.swift
//  PoCha
//
//  Created by 向根 on 16/1/26.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addAuthorTextField: UITextField!
    
    @IBOutlet weak var addCommentTextView: UITextView!
    
    @IBOutlet weak var addDoneButton: UIBarButtonItem!
    
    var book: Book?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if sender === addDoneButton {
            let title = addTitleTextField.text
            let author = addAuthorTextField.text ?? ""
            let comment = addCommentTextView.text
            
            book = Book(title: title!, author: author, comment: comment)
            
            print(book?.title)
            print(book?.author)
            print(book?.comment)
            
        }
        
    }
    
    

}

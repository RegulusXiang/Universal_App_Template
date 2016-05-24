//
//  EditViewController.swift
//  PoCha
//
//  Created by 向根 on 16/1/25.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextViewDelegate {
    
    //MARK: Properties
    @IBOutlet weak var editedTitleLabel: UILabel!
    @IBOutlet weak var editedTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //handle the text view's user input via delegate callbacks
        editedTextView.delegate = self
        
        if let book = book {
            editedTitleLabel.text = book.title
            editedTextView.text = book.comment
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Functions for the comment text view
    func textViewDidEndEditing(textView: UITextView) {
        book!.comment = editedTextView.text
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return true
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            let title = editedTitleLabel.text
            let author = book!.author
            let comment = editedTextView.text ?? ""
            
            book = Book(title:title!,author:author,comment: comment)
        }
    }
    
    
}

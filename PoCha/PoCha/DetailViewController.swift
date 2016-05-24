//
//  DetailViewController.swift
//  PoCha
//
//  Created by 向根 on 16/1/24.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK:Properties
    
    //In the edit view
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    //buttons
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var book: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up view if editing an existing book
        if let book = book{
            navigationItem.title = book.title
            titleLabel.text = book.title
            commentTextView.text = book.comment
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditComment" {
            let bookEditViewController = segue.destinationViewController as! EditViewController
            if editButton === sender {
                bookEditViewController.book = self.book
            }
        }
        
    }
    
    @IBAction func unwindToDetailView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? EditViewController {
            //Update an existing book
            self.book = sourceViewController.book
            
            //Refresh the view, escpecially for the comment text field
            //commentTextView.reloadInputViews()
        }
            
        else {
            //Add a new book
            
        }
        
    }
    
    
}






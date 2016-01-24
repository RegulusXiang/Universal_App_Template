//
//  EditViewController.swift
//  PoCha
//
//  Created by 向根 on 16/1/25.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var editedTitleLabel: UILabel!
    @IBOutlet weak var editedTextView: UITextView!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let book = book {
            editedTitleLabel.text = book.title
            editedTextView.text = book.comment
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    */

}

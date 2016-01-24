//
//  Book.swift
//  PoCha
//
//  Created by 向根 on 16/1/22.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class Book: NSObject {
    
    //MARK: Properties
    var title: String = ""
    var author: String = ""
    var publisher: String = ""
    var author_intro: String = ""
    var summary: String = ""
    
    var comment: String = "" //comments that are wrote by the user
    
    
    //MARK: Methods
    
    init?(title:String, author:String,publisher:String,author_intro:String,summary:String,comment:String)
    {
        //Initialize properties
        self.title = title
        self.author = author
        self.publisher = publisher
        self.author_intro = author_intro
        self.summary = summary
        self.comment = comment
        
    }
    
    init(comment: String)
    {
        self.comment = comment
    }
    

}

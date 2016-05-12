//
//  DoubanAnnotation.swift
//  DoubanAPI
//
//  Created by Regulus Xiang on 16/4/28.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class DoubanAnnotation: NSObject {
    
    var id: String?
    var book_id: String?
    var author_id: String?
    var chapter: String?
    var page_no: Int = 0
    var privacy: Int = 1
    var abstract: String?
    var content: String?
    var comments_count: Int = 0
    var time: String?
    
    override init() {
        super.init()
    }
    
    init(book_id:String, content:String) {
        super.init()
        self.book_id = book_id
        self.content = content
    }
    
    func printAnnotation() {
        print("id: \(id)")
        print("book_id: \(book_id)")
        print("author_id: \(author_id)")
        print("chapter: \(chapter)")
        print("page_no: \(page_no)")
        print("privacy: \(privacy)")
        print("abstract: \(abstract)")
        print("content: \(content)")
        print("comments_count: \(comments_count)")
        print("time: \(time)")
        
    }
    
}

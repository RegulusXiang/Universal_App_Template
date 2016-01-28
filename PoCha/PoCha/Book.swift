//
//  Book.swift
//  PoCha
//
//  Created by 向根 on 16/1/22.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class Book: NSObject, NSCoding{
    
    //MARK: Properties
    var title: String = ""
    var author: String = ""
    var publisher: String = ""
    var author_intro: String = ""
    var summary: String = ""
    
    var comment: String = "" //comments that are wrote by the user
    
    //MARK: Archiving paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("books")
    
    //MARK: Types
    struct PropertyKey {
        static let titleKey = "title"
        static let authorKey = "author"
        static let publisherKey = "publisher"
        static let author_introKey = "author_intro"
        static let summaryKey = "summary"
        static let commentKey = "comment"
    }
    
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
        
        super.init()
        
        if title.isEmpty {
            return nil
        }
        
    }
    
    init(comment: String)
    {
        self.comment = comment
    }
    
    init(title: String, author: String, comment: String)
    {
        self.title = title
        self.author = author
        self.comment = comment
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: PropertyKey.titleKey)
        aCoder.encodeObject(author, forKey: PropertyKey.authorKey)
        aCoder.encodeObject(publisher, forKey: PropertyKey.publisherKey)
        aCoder.encodeObject(author_intro, forKey: PropertyKey.author_introKey)
        aCoder.encodeObject(summary, forKey: PropertyKey.summaryKey)
        aCoder.encodeObject(comment, forKey: PropertyKey.commentKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObjectForKey(PropertyKey.titleKey) as! String
        let author = aDecoder.decodeObjectForKey(PropertyKey.authorKey) as? String
        let publisher = aDecoder.decodeObjectForKey(PropertyKey.publisherKey) as? String
        let author_intro = aDecoder.decodeObjectForKey(PropertyKey.author_introKey) as? String
        let summary = aDecoder.decodeObjectForKey(PropertyKey.summaryKey) as? String
        let comment = aDecoder.decodeObjectForKey(PropertyKey.commentKey) as! String
        
        self.init(title:title,author:author!,publisher:publisher!,author_intro:author_intro!,summary:summary!,comment:comment)
    }

}

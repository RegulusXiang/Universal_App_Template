//
//  DoubanBook.swift
//  DoubanAPI
//
//  Created by Regulus Xiang on 16/3/11.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

struct DoubanBookTag {
    var count: Int
    var name: String
}

class DoubanBook: NSObject {
    
    //MARK: Properties
    var id: String = ""
    var isbn10: String = ""
    var isbn13: String = ""
    var title: String = ""
    var origin_title: String = ""
    var alt_title: String = ""
    var subtitle: String = ""
    var url: String = ""
    var alt: String = ""
    var image: String = ""
    
    //images字典存储大中小三个尺寸的图书图片
    var images:[String:String] = ["small":"","large":"","medium":""]
    
    var author: String = ""
    var translator: String = ""
    var publisher: String = ""
    var pubdate: String = ""
    
    //rating字典
    var rating:[String: Double] = ["max":0.0,"numRaters":0.0,"average":0.0,"min":0.0]
    
    //tags由结构元素构成的数组
    //var tag:[String:String] = ["count":"","name":""]
    //var tags:[DoubanBookTag]
    
    var binding: String = ""
    var price: Double = 0.0
    
    //series字典，注意时冒号不是逗号！！！
    var series:[String:String] = ["id":"","title":""]
    
    var pages: Int = 0
    
    var author_intro: String = ""
    var summary: String = ""
    var catalog: String = ""
    var ebook_url: String = ""
    var ebook_price: Double = 0.0
    
    
}

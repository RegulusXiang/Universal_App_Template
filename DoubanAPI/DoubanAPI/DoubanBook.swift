//
//  DoubanBook.swift
//  DoubanAPI
//
//  Created by Regulus Xiang on 16/3/11.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

struct DoubanImage {
    var small: String
    var large: String
    var medium: String
}

struct DoubanBookRating {
    var max: Int
    var numRates: Int
    var average: Double
    var min: Int
}

struct DoubanBookTag {
    var count: Int
    var name: String
}

struct DoubanBookSeries {
    var id: Int
    var title: String
}

class DoubanBook: NSObject {
    
    //MARK: Properties
    var id: Double = 0
    var isbn10: Double = 0
    var isbn13: Double = 0
    var title: String = ""
    var origin_title: String = ""
    var alt_title: String = ""
    var subtitle: String = ""
    var url: String = ""
    var alt: String = ""
    var image: String = ""
    
    //var images: DoubanImage
    
    var author: String = ""
    var translator: String = ""
    var publisher: String = ""
    var pubdate: String = ""
    
    //var rating: Rating
    //var tags: Tag
    
    var binding: String = ""
    var price: Double = 0.0
    
    //var series: Series
    
    var pages: Int = 0
    
    var author_intro: String = ""
    var summary: String = ""
    var catalog: String = ""
    var ebook_url: String = ""
    var ebook_price: Double = 0.0
    

}

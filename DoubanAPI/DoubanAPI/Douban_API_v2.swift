//
//  Douban_API_v2.swift
//  DoubanAPI
//
//  Created by 向根 on 16/2/2.
//  Copyright © 2016年 向根. All rights reserved.
//

import Foundation
import SwiftyJSON

class DoubanAPI
{
    //解析请求图书JSON信息
    static func parseBookInfo(json: JSON) {
        
        let id: String = json["id"].stringValue
        print(id)
        let isbn10: String = json["isbn10"].stringValue
        print(isbn10)
        let isbn13: String = json["isbn13"].stringValue
        print(isbn13)
        let title: String = json["title"].stringValue
        print(title)
        let origin_title: String = json["origin_title"].stringValue
        print(origin_title)
        let alt_title: String = json["alt_title"].stringValue
        print(alt_title)
        let subtitle: String = json["subtitle"].stringValue
        print(subtitle)
        let url: String = json["url"].stringValue
        print(url)
        let alt: String = json["alt"].stringValue
        print(alt)
        let image: String = json["image"].stringValue
        print(image)
        
        //images字典
        var images:[String:String] = ["small":"","large":"","medium":""]
        images["small"] = json["images"]["small"].stringValue
        print(images["small"])
        images["large"] = json["images"]["large"].stringValue
        print(images["large"])
        images["medium"] = json["images"]["medium"].stringValue
        print(images["medium"])

        
        //考虑作者译者数组存在多个元素的情况
        let author:String = json["author"][0].stringValue
        print(author)
        let translator: String = json["translator"][0].stringValue
        print(translator)
        
        let publisher: String = json["publisher"].stringValue
        print(publisher)
        let pubdate: String = json["pubdate"].stringValue
        print(pubdate)
        
        //rating字典
        var rating:[String: Double] = ["max":0.0,"numRaters":0.0,"average":0.0,"min":0.0]
        rating["max"] = json["rating"]["max"].doubleValue
        rating["numRaters"] = json["rating"]["numRaters"].doubleValue
        rating["average"] = json["rating"]["average"].doubleValue
        rating["min"] = json["rating"]["min"].doubleValue
        for (a,b) in rating {
            print("\(a),\(b)")
        }
        
        //tags字典构成数组
        for var i in 0..<json["tags"].count { //..<不包含上界
            let count: Int = json["tags"][i]["count"].intValue
            let name: String = json["tags"][i]["name"].stringValue
            print(count)
            print(name)
        }
        
        let binding: String = json["binding"].stringValue
        print(binding)
        let price: Double = json["price"].doubleValue
        print(price)
        
        //series字典，《小王子》返回值中没有series信息
        var series:[String:String] = ["id":"","title":""]
        series["id"] = json["series"]["id"].stringValue
        series["title"] = json["series"]["title"].stringValue
        print(series["id"])
        print(series["title"])
        
        let pages: Int = json["pages"].intValue
        print(pages)
        let author_intro: String = json["author_intro"].stringValue
        print(author_intro)
        let summary: String = json["summary"].stringValue
        print(summary)
        let catalog: String = json["catalog"].stringValue
        print(catalog)
        let ebook_url: String = json["ebook_url"].stringValue
        print(ebook_url)
        let ebook_price: Double = json["ebook_price"].doubleValue
        print(ebook_price)
        
    }
    
    //解析图书收藏信息
    static func parseBookCollectionInfo(json:JSON) {
        let status: String = json["status"].stringValue
        print(status)
        let comment:String = json["comment"].stringValue
        print(comment)
        let updated:String = json["updated"].stringValue
        print(updated)
        let user_id:String = json["user_id"].stringValue
        print(user_id)
        
        //rating字典
        var rating:[String: Int] = ["max":0,"min":0,"value":0]
        rating["max"] = json["rating"]["max"].intValue
        rating["min"] = json["rating"]["min"].intValue
        rating["value"] = json["rating"]["value"].intValue
        for (a,b) in rating{
            print("\(a),\(b)")
        }
        
        //tags string数组
        for var i in 0..<json["tags"].count {
            let tag: String = json["tags"][i].stringValue
            print(tag)
        }
        
        let book_id: String = json["book"]["id"].stringValue
        print(book_id)
    }
    
    //根据书籍ID获取书籍信息
    static func getBookInfoByID (id: String)
    {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(id)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
//            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(string)
            
            let json = JSON(data: data!)
            parseBookInfo(json)
            
        })
        task.resume()
    }
    
    //根据书籍ISBN获取书籍信息
    static func getBookInfoByISBN(isbn: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/isbn/\(isbn)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
//            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(string)
            
            let json = JSON(data: data!)
            parseBookInfo(json)
        })
        task.resume()
    }
    
    //根据关键字搜索书籍
    static func searchBook (key:String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/search?q=\(key)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //根据书籍ID获取书籍标签
    static func getBookTagsByBookID(id:String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(id)/tags")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //获取某个用户的书籍标签
    static func getBookTagsByUserID (id:String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/user/\(id)/tags")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //获取某用户的所有图书收藏信息
    static func getBooksCollectedByUser (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/user/\(id)/collections")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //获取某个用户对某本书的收藏信息
    static func getUserCollectionForBook (book_id: String, user_id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(book_id)/collection?user_id=\(user_id)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
            
            let json = JSON(data:data!)
            parseBookCollectionInfo(json)
        })
        task.resume()
    }
    
    //获取某用户的所有笔记
    static func getBookAnnotationsByUserID (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/user/\(id)/annotations")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //获取某本图书的所有笔记
    static func getBookAnnotationsByBookID (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/user/\(id)/annotations")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //获取某篇笔记的信息
    static func getAnnotationByID (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/annotation/\(id)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
    //根据丛书ID获取丛书书目信息
    static func getBookSeriesInfoByID (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/series/\(id)/books")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
        })
        task.resume()
    }
    
}


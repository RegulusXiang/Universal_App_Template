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
    //根据书籍ID获取书籍信息
    static func getBookInfoByID (id: String)
    {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(id)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
            
            let json = JSON(data: data)
            
            
            
        })
        task.resume()
    }
    
    //根据书籍ISBN获取书籍信息
    static func getBookInfoByISBN(isbn: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/isbn\(isbn)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
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
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(book_id)/collection/\(user_id)")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(string)
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


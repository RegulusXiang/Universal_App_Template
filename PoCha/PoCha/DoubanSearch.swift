//
//  DoubanSearch.swift
//  PoCha
//
//  Created by Regulus Xiang on 16/5/10.
//  Copyright © 2016年 向根. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

//实现豆瓣通过关键字找到图书，再进行搜索的功能
class DoubanSearch {
    
    //MARK: Properties
    
    //笔记数组
    var annotation = [DoubanAnnotation]()
    
    //MARK: 笔记获取相关
    
    //处理获取到的某本书的全部笔记
    func parseBookAnnotations (json: JSON) ->[DoubanAnnotation] {
        //初始化基本变量
        let total: Int = json["total"].intValue
        let note: DoubanAnnotation = DoubanAnnotation(book_id: json["annotations"][0]["id"].stringValue,content: "空内容")
        
        //创建笔记数组,创建时需采用明确空间大小的创建方法，否则下标越界
        var annotations = [DoubanAnnotation](count: total, repeatedValue: note)
        print(total)
        
        //let string = json["annotations"][0]["author_user"]["name"].stringValue
        //print(string)
        
        
        for var i = 0;i < total; i++ {
            annotations[i].id = json["annotations"][i]["id"].stringValue
            annotations[i].author_id = json["annotations"][i]["author_user"]["name"].stringValue
            annotations[i].page_no = json["annotations"][i]["page_no"].intValue
            annotations[i].content = json["annotations"][i]["content"].stringValue
            
            if(annotations[i].content != "") {
                annotations[i].printAnnotation()
            }
        }
        return annotations
    }
    
    //获取某本图书的所有笔记
    func getBookAnnotationsByBookID (id: String) {
        let session = NSURLSession.sharedSession()
        let request = NSURLRequest(URL: NSURL(string: "https://api.douban.com/v2/book/\(id)/annotations")!)
        //request.HTTPMethod = method
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            //let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(string)
            
            let json = JSON(data:data!)
            self.parseBookAnnotations(json)
        })
        task.resume()
    }
    
    
    
    //MARK: 关键字搜索相关
    //根据关键字搜索结果获取图书ID
    func getBookID(json:JSON) -> String{
        var book_id = ""
        
        book_id = json["books",0,"id"].stringValue
        //print(book_id)
        return book_id
    }
    
    //根据关键字搜索图书并获得图书的book_id
    func searchKeywordForBookID (key: String){
        let session = NSURLSession.sharedSession()
        print(key)
        var url: String = "https://api.douban.com/v2/book/search?q=\(key)"
        print(url)
        //var book_id: String
        //NSURL无法识别中文，需将其转制为UTF8编码
        url = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let request = NSURLRequest(URL: NSURL(string: url)!)
       
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            //let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(string)
            let json = JSON(data:data!)
            let book_id = self.getBookID(json)
            print(book_id)
            //return book_id
            self.getBookAnnotationsByBookID(book_id)
        })
        task.resume()
    }

    
    
}
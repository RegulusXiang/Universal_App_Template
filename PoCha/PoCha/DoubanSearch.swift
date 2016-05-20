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
//import Alamofire

//实现豆瓣通过关键字找到图书，再进行搜索的功能
class DoubanSearch {
    
    //MARK: Properties
    
    //笔记数组
    var annotations = [DoubanAnnotation]()
    var total: Int = 0 //笔记数量
    
    //MARK: 笔记获取相关
    
    //处理获取到的某本书的全部笔记
    func parseBookAnnotations (json: JSON) {
        //初始化基本变量
        total = json["total"].intValue
        let note: DoubanAnnotation = DoubanAnnotation(book_id: json["annotations"][0]["book_id"].stringValue,content: "空内容")
        
        for var i = 0;i < total; i++ {
            //可能包含内容为空的笔记
            if(json["annotations",i,"content"].stringValue != "") {
                total--
            }
        }
        
        //创建笔记数组,创建时需采用明确空间大小的创建方法，否则下标越界
        //此处无需再创建一个笔记数组，因为类的私有成员中一景存在一个annotation了
        annotations = [DoubanAnnotation](count: total, repeatedValue: note)
        print("total: ",terminator:"")
        print(total)
        
        /*
        如果单纯以total值或search.annotations.count发生变化作为死循环的判断条件的话，
        跳出死循环时annotations还没有发生变化或没有达到最终状态，因此更为稳妥的办法还是采用的GCD
        */
        
        for var i = 0;i < total; i++ {
            //可能包含内容为空的笔记
            if(json["annotations",i,"content"].stringValue != "") {
                
               self.annotations[i].id = json["annotations"][i]["id"].stringValue
               self.annotations[i].author_id = json["annotations"][i]["author_user"]["name"].stringValue
               self.annotations[i].page_no = json["annotations"][i]["page_no"].intValue
               self.annotations[i].content = json["annotations"][i]["content"].stringValue
               self.annotations[i].printAnnotation()
            }
            else {
                break
            }
            
        }
        print("DoubanSearch-Annotations.count: ",terminator: "")
        print(self.annotations.count)
        //return annotations
    }
    
    //获取某本图书的所有笔记
    func getBookAnnotationsByBookID (id: String) {
        //let json = JSON()
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
    func searchKeywordForBookID (key: String) {
        let session = NSURLSession.sharedSession()
        print(key)
        var url: String = "https://api.douban.com/v2/book/search?q=\(key)"
        print(url)
        //var book_id: String
        //NSURL无法识别中文，需将其转制为UTF8编码
        url = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let request = NSURLRequest(URL: NSURL(string: url)!)
        var book_id  = ""
       
        let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            //let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print(string)
            let json = JSON(data:data!)
            book_id = self.getBookID(json)
            print("book_id: " + book_id)
            self.getBookAnnotationsByBookID(book_id)
        })
        task.resume()
        
    }
}
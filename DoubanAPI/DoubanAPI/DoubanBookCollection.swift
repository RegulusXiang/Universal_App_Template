//
//  DoubanBookCollection.swift
//  DoubanAPI
//
//  Created by Regulus Xiang on 16/3/14.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class DoubanBookCollection: NSObject {
    
    var status: String?
    var comment: String?
    var updated: String?
    var user_id: String?
    
    //tags数组
    var tags:[String] = []
    
    //rating字典
    var rating:[String: Int] = ["max":0,"min":0,"value":0]
    
    //DoubanBook
    var book_id: String?
    
    //user信息在此不会用，故不解析

}

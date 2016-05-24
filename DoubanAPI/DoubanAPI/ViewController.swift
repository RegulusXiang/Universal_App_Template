//
//  ViewController.swift
//  DoubanAPI
//
//  Created by 向根 on 16/2/2.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func mainButtonTapped(sender: AnyObject) {
       DoubanAPI.getBookInfoByID("1084336")
       //DoubanAPI.getBookInfoByISBN("7505715666")
       //DoubanAPI.getBookInfoByISBN("9787544749527")
       //DoubanAPI.searchBook("悲伤与理智")
        //DoubanAPI.getUserCollectionForBook("4117922",user_id: "70057728")
        //DoubanAPI.getAnnotationByID("37642114")
        //DoubanAPI.getBookAnnotationsByBookID("26264154")
        //DoubanAPI.searchKeywordForBookID("小王子")
    }


}


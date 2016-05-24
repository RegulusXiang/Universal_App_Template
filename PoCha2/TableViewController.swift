//
//  TableViewController.swift
//  PoCha2
//
//  Created by Regulus Xiang on 16/5/11.
//  Copyright © 2016年 Regulus Xiang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate //, UISearchResultsUpdating
{
    
    //MARK: Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    let tableData = ["roaringwild","saintroller","randomevent","vermicelli"]
    var filteredTableData = [String]()
    
    var searchController = UISearchController()
    
    //豆瓣搜索类对象
    var search = DoubanSearch()
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        searchBar.delegate = self
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        if (self.searchController.active) {
            return self.filteredTableData.count
        }
        else {
            return self.tableData.count
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // 3
        if (self.searchController.active) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            
            return cell
        }
        else {
            cell.textLabel?.text = tableData[indexPath.row]
            
            return cell
        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        //searchBar.resignFirstResponder()
        
        //清空搜索结果列表
        filteredTableData.removeAll(keepCapacity: false)
        
        print("clear tables!")
        
        //根据searchBar内容搜索图书笔记
        //search.searchKeywordForBookID(searchBar.text!)
        
        print("------------------MARK1--------------------")
        
        print("annotations.count: ",terminator: "")
        print(search.annotations.count)
        print("Total: ",terminator:"")
        print(search.total)
        
        //MARK: Problem
        //获取API资源时无法进入主进程,调用的函数出现return后就不会继续往下运行？
        //呵呵😊，实际原因是for循环没满足判断条件没有进入:i < search.annotation.count (=0)
        
        /*此处没能进入for循环的原因还是由于网络异步通讯，此时的total因为还没来得及获取annotations，数值为0
        于是跳过了for循环,之后会打印total变成有效数字
        解决方法1:采用GCD多线程控制，实现线程队列
        解决方法2:死循环直到total值不再发生变化
        结局方法3:GCD＋Async语法糖
        */
        
        //方法2:失败
        //        while(true) {
        //            if(search.total == 0) {
        //                continue
        //            }
        //            else if (search.annotations.count == 81) {
        //                break
        //            }
        //        }
        
        //方法1.1:GCD queue，执行一个线程的main queue
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        //            //需要长时间处理的代码
        //            self.search.searchKeywordForBookID(searchBar.text!)
        //            dispatch_async(dispatch_get_main_queue(), {
        //                //需要主线程执行的代码
        //                for var i = 0; i < self.search.total; ++i {
        //                    print("--------------------MARK2---------------------")
        //                    print(self.search.annotations[i].author_id!)
        //                    self.filteredTableData[i] = self.search.annotations[i].author_id!
        //                }
        //
        //            })
        //        })
        
        //方法1.2:GCD queue，采用一个FIFO且一次执行一个线程的serial queue
        let serialQueue: dispatch_queue_t = dispatch_queue_create("serial_queue",
            DISPATCH_QUEUE_SERIAL)
        
        dispatch_async(serialQueue, {
            //NSLog("s1");
            self.search.searchKeywordForBookID(searchBar.text!)
        });
        dispatch_async(serialQueue, {
            //sleep(2);
            //NSLog("s2");
            for var i = 0; i < self.search.total; ++i {
                print("--------------------MARK2---------------------")
                print(self.search.annotations[i].author_id!)
                self.filteredTableData[i] = self.search.annotations[i].author_id!
            }
        });
        dispatch_async(serialQueue, {
            //sleep(1);
            //NSLog("s3");
            print("------------------MARK3-------------------")
            self.tableView.reloadData()
        });
        
        print("Annotations.count: ",terminator: "")
        print(search.annotations.count)
        
        print("Total: ",terminator:"")
        print(search.total)
        
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        print("cancel button clicked!")
        print("--------------------MARK4--------------------")
        
        for j in 0..<search.annotations.count {
            print(filteredTableData[j])
        }
    }
    
    
    //获取搜索结果并建立filteredData数组
    /*This method is automatically called whenever the search bar becomes the first responder or changes are made to the text in the search bar. Perform any required filtering and updating inside of this method.
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
    filteredTableData.removeAll(keepCapacity: false)
    
    //根据seaerchBar的text计算得到过滤后字符串数组filteredTableData
    let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
    let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
    filteredTableData = array as! [String]
    
    //根据searchBar内容搜索图书笔记
    search.searchKeywordForBookID(searchController.searchBar.text!)
    
    for i in 0..<search.annotation.count {
    filteredTableData[i] = search.annotation[i].author_id!
    }
    
    self.tableView.reloadData()
    }
    */
}


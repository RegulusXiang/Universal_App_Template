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
        
//        self.searchController = ({
//            //在TableView顶部添加SearBar
//            let controller = UISearchController(searchResultsController: nil)
//            //controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//            
//            self.tableView.tableHeaderView = controller.searchBar
//            
//            return controller
//        })()
        
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
        search.searchKeywordForBookID(searchBar.text!)
        
        for i in 0..<search.annotation.count {
            filteredTableData[i] = search.annotation[i].author_id!
        }
        
        self.tableView.reloadData()
        
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("cancel button clicked!")
        print("---------------------------------------")
        
        for var j in 0..<search.annotation.count {
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


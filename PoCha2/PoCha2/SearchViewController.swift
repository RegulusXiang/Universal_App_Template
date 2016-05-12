//
//  ViewController.swift
//  PoCha2
//
//  Created by Regulus Xiang on 16/5/6.
//  Copyright © 2016年 Regulus Xiang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate{
    
    //MARK: properties
    var keyword: String?
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// Search controller to help us with filtering.
    var searchController: UISearchController!
    
    /// Secondary search results table view.
    //var resultsTableController: ResultsTableController!
    
    /// Restoration state for UISearchController
    //var restoredState = SearchControllerRestorableState()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //resultsTableController.tableView.delegate = self
        
        //searchController = UISearchController(searchResultsController: resultsTableController)
        //searchController.searchResultsUpdater = self
        //searchController.searchBar.sizeToFit()
        //tableView.tableHeaderView = searchController.searchBar
        
        //searchController.delegate = self
        //searchController.dimsBackgroundDuringPresentation = false // default is YES
        //searchController.searchBar.delegate = self    // so we can monitor text
        
        searchBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        //搜索按钮点击后触发的事件
        keyword = searchBar.text
        print(keyword)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("Cancel button clicked!")
    }
    
    // MARK: UISearchControllerDelegate
    
    func presentSearchController(searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func willPresentSearchController(searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func didPresentSearchController(searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func willDismissSearchController(searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }
    
    func didDismissSearchController(searchController: UISearchController) {
        //debugPrint("UISearchControllerDelegate invoked method: \(__FUNCTION__).")
    }



}


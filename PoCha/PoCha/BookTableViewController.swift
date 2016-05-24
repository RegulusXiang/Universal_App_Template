//
//  BookTableViewController.swift
//  PoCha
//
//  Created by 向根 on 16/1/22.
//  Copyright © 2016年 向根. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {
    
    //MARK: Properties
    var books = [Book]()
    
    //MARK: Methods
    
    func loadSampleBooks()
    {
        let sampleBook = Book(title: "纳兰词",
            author: "（法）圣埃克苏佩里",
            publisher: "中国友谊出版公司",
            author_intro: "圣埃克苏佩里",
            summary: "小王子驾到！",
            comment: "读书消得泼茶香，当时只道是寻常。")
        
        books.insert(sampleBook!, atIndex: books.count)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
        if let savedBooks = loadBooks() {
            books += savedBooks
        } else {
            loadSampleBooks()
        }
    }
    
    //自定义navigation bar样式，由于BookTableViewController的root view controller为
    //navigation controller，故在此处对其进行自定义
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        let barColor = UIColor(red: 0x36/255.0, green: 0x74/255.0, blue: 0x59/255.0, alpha: 1.0)
        //按钮文字颜色
        nav?.tintColor = UIColor.whiteColor()
        //bar背景颜色
        nav?.barTintColor = barColor
        //设置标题颜色,设置标题字体，使用第三方字体库
        nav?.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "Wyue-GutiFangsong-NC", size: 24.0)!];
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BookTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BookTableViewCell //downcast the type of the cell to your custom cell subclass, BookTableViewCell.
        
        // Configure the cell...
        let book = books[indexPath.row]
        cell.titleLabel.text = book.title
        cell.commentLabel.text = book.comment
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            books.removeAtIndex(indexPath.row)
            
            saveBooks()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail"{
            let bookDetailViewController = segue.destinationViewController as! EditViewController
            
            if let selectedBookCell = sender as? BookTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedBookCell)
                let selectedBook = books[indexPath!.row]
                bookDetailViewController.book = selectedBook
            }
            
        }
    }
    
    
    @IBAction func unwindFromAddViewToBookList (sender: UIStoryboardSegue) {
        
        print("unwind function-1")
        
        if let sourceViewController = sender.sourceViewController as? AddViewController,
            //bug located it's sourceViewController not destinationViewController
            book = sourceViewController.book
        {
            print(book.title)
            print(book.author)
            print(book.comment)
            
            //Add a new book
            let newIndexPath = NSIndexPath(forRow: books.count, inSection: 0)
            books.append(book)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
            //Save the books
            saveBooks()
        }
    }
    
    @IBAction func unwindFromEditViewToBookList (sender: UIStoryboardSegue) {
        print("unwind function-2")
        
        if let sourceViewController = sender.sourceViewController as? EditViewController,
            book = sourceViewController.book {
                //Update a existing book
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    books[selectedIndexPath.row] = book
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                }
                
                //Save the books
                saveBooks()
        }
    }
    
    //MARK: NSCoding
    func saveBooks() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(books, toFile: Book.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save books...")
        }
    }
    
    func loadBooks() -> [Book]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Book.ArchiveURL.path!) as? [Book]
    }
    
    
}

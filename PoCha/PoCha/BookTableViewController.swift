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
        let sampleBook = Book(title: "小王子",
            author: "（法）圣埃克苏佩里",
            publisher: "中国友谊出版公司",
            author_intro: "圣埃克苏佩里（1900－1944）1900年，尼采逝世。这一年，安德烈・纪德在布鲁塞尔一次会议上宣称：“当今文学土地的面貌可以说是一片沼泽。”1900年，圣埃克苏佩里诞生。净化沼泽的意愿和能力历史地落在这个“世纪儿”的身上，圣埃克苏佩里是尼采式的第二代法国作家，拿但业的儿子，琐罗亚斯德的孙子，这个飞行员受到极大的遗传影响。灾种影响使他在探索、忧虑和英雄主义的道路上走到尽头。如尼采所说：“你应该超截止自己，走得更远，登得更高，直至群星在你脚下。”尼采成为他座舱中想象的伙伴。这个飞越沙漠和海洋的年轻驾驶员同样也遵循着纪德的教诲：“与其过宁静的生活，不如过悲怆的生活。”圣埃克苏佩里在他整个的一生中都在反复思考力量和热诚的真谛。",
            summary: "小王子驾到！大家好，我是小王子，生活在B612星球，别看我是王子出生，我要做的事也不少，有时给花浇水，有时我还得耐心地把火山口通一通。实在闷得发慌的时候，为了找些事做，学点东西，我也访问一些其他的星球，像325号、326号、327号之类的。当然，我经历的事情也不少，有开心的，也有不开心的。这些事我通常会向地球上一个叫圣埃克苏佩里的人倾诉。对了，你可不要小瞧他，他是拿但业的儿子，琐罗亚斯德的孙子。他还被人们认为尼采式的第二代法国作家。他一生有两大爱好：飞行和写作。我之所以能够这样受欢迎也是他的功劳。因为他把我在其他星球的所见所闻编成了一本小书，也就是你们即将看到的这一本。它不但被誉为有史以来阅读仅次于《圣经》的书，全球发行的语言更是超过100种。可惜的是，在这本书出版后没多久，他在一次架机执行任务时一去不复返了，没有人知道他去了哪里。",
            comment: "没有什么好说的")
    
        books.insert(sampleBook!, atIndex: books.count)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
        loadSampleBooks()
        
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
        cell.authorLabel.text = book.author
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
            let bookDetailViewController = segue.destinationViewController as! DetailViewController
            
            if let selectedBookCell = sender as? BookTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedBookCell)
                let selectedBook = books[indexPath!.row]
                bookDetailViewController.book = selectedBook
            }
        
    }
    
    }
}

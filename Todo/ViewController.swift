//
//  ViewController.swift
//  Todo
//
//  Created by 王钊 on 15/6/14.
//  Copyright (c) 2015年 王钊. All rights reserved.
//

import UIKit

var todos: [TodoModel] = []
func dateFromString(string: String) ->NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.dateFromString(string)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [
            TodoModel(id: "1", image: "child-selected", title: "1, 去游乐场", date: dateFromString("2015-06-08")!),
            TodoModel(id: "2", image: "shopping-cart-selected", title: "2, 购物", date: dateFromString("2015-06-13")!),
            TodoModel(id: "3", image: "phone-selected", title: "3, 打电话", date: dateFromString("2015-06-16")!),
            TodoModel(id: "4", image: "travel-selected", title: "4, 旅行", date: dateFromString("2015-06-18")!)
        ]
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as! UITableViewCell
        var todo = todos[indexPath.row] as TodoModel
        var image = cell.viewWithTag(101) as! UIImageView
        var title = cell.viewWithTag(102) as! UILabel
        var date = cell.viewWithTag(103) as! UILabel
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        let locale = NSLocale.currentLocale()
        let dateFomate = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        let dateFomatter = NSDateFormatter()
        dateFomatter.dateFormat = dateFomate
        
        date.text = dateFomatter.stringFromDate(todo.date)
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



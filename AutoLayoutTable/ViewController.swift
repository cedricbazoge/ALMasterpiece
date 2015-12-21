//
//  ViewController.swift
//  AutoLayoutTable
//
//  Created by Cedric Bazoge on 12/12/15.
//  Copyright © 2015 TWC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var items:[MasterpieceModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeItems()
        tableView.registerNib(UINib(nibName: "ALTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ALTableViewCell!
        
        cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ALTableViewCell

        let item = items[indexPath.row]
        
        let artist = item.artist ?? "N/A"
        cell.author?.text = "Artist: \(artist)"
        let title = item.title ?? "N/A"
        cell.title?.text = title
        let created = item.date ?? "N/A"
        cell.createDate?.text = "Created: \(created)"
        let comment = item.comment ?? "N/A"
        cell.comment?.text = comment
        cell.thumbnail?.image = item.thumbnail
        
        return cell
    }
    
    
    func initializeItems(){
        let path = NSBundle.mainBundle().pathForResource("masterpiece", ofType: "json")
        if let data = NSData(contentsOfFile: path!) {
            let jsonContent =  try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! NSArray
            for dict in jsonContent! {
                let masterpieceItem = MasterpieceModel(item: dict as! Dictionary<String, AnyObject>)
                items.append(masterpieceItem)
            }
        }
    }
    
    
}


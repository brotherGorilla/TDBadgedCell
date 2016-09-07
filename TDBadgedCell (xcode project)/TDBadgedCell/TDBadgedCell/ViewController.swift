//
//  ViewController.swift
//  TDBadgedCell
//
//  Created by Tim Davies on 07/09/2016.
//  Copyright © 2016 Tim Davies. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let demoItems : [[String:String]] = [
        ["title" : "This is an example badge", "badge": "1"],
        ["title" : "A second example", "badge": "Warning!"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoItems.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TDBadgedCell {
        var cell : TDBadgedCell? = tableView.dequeueReusableCellWithIdentifier("BadgedCell") as! TDBadgedCell?;
        if((cell == nil)) {
            cell = TDBadgedCell(style: .Default, reuseIdentifier: "BadgedCell");
        }
        
        cell?.textLabel!.text = demoItems[indexPath.row]["title"]
        cell?.badgeString = demoItems[indexPath.row]["badge"]!
        
        if(indexPath.row == 1) {
            cell?.badgeColour = UIColor.orangeColor()
        }
        
        return cell!
    }
}


//
//  JCTableViewDataSource.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCTableViewDataSource: NSObject, UITableViewDataSource {

    var itemArrayM : Array<JCLivesItem>?

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let count = self.itemArrayM?.count {
            return count
        }

        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = JCTableViewCell.cellWithTableView(tableView)

        cell.selectionStyle = .None

        let liveItem = self.itemArrayM![indexPath.row]

        cell.liveItem = liveItem

        return cell
    }
}

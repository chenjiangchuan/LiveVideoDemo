//
//  JCTableViewDelegate.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

typealias CellSelected = ((AnyObject?) -> Void)?


class JCTableViewDelegate: NSObject, UITableViewDelegate {

    var itemArrayM : Array<JCLivesItem>?
    var cellSelected : CellSelected?

    /**
     回调函数的setter函数

     - parameter tempCellSelected:
     */
    func setCellSelected(tempCellSelected : CellSelected) {
        self.cellSelected = tempCellSelected
    }

    /**
     tableViewCell被选中

     - parameter tableView:
     - parameter indexPath:
     */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        if let myCellSelected = self.cellSelected {
            myCellSelected!(indexPath)
        }
    }

    /**
     tableViewCell即将显示的时候调用

     - parameter tableView:
     - parameter cell:
     - parameter indexPath:
     */
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {

        cell.transform = CGAffineTransformMakeRotation(1.0)

        UIView.animateWithDuration(0.5) {
            cell.transform = CGAffineTransformMakeRotation(0)
        }
    }
}

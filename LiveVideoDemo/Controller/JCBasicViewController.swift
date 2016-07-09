//
//  JCBasicViewController.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit
import AFNetworking

class JCBasicViewController: UIViewController {

    private var tableViewDelegate : JCTableViewDelegate!
    private var tableViewDataSource : JCTableViewDataSource!
    private var topItem : JCTopItem!
    private var livesItemArrayM : Array<JCLivesItem>?

    // MARK: - life circle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "直播"
        
        // 添加tableView
        self.view.addSubview(tableView)

        // 初始化tableView
        self.setupTableView()

        // 从服务器上获取数据
        self.setupLoadDataFromServer()

        // 解析plist数据
//        self.setupLoadPlist()

    }

    // MARK: - private methods
    /**
     从服务器上获取数据
     */
    func setupLoadDataFromServer() -> Void {

        let url = "http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"

        [JCHttpTool .jc_get(url, parameters: nil, progressed: nil, succeed: { (task:NSURLSessionDataTask, obj:AnyObject?) in

            // 如果obj是字典
            if obj is NSDictionary {

                // 转为NSDictionary
                if let dataDict = obj as? NSDictionary {
                    self.topItem = JCTopItem(dict: dataDict)

                    self.livesItemArrayM = self.topItem.lives
                    self.tableViewDataSource.itemArrayM = self.topItem.lives
                    self.tableViewDelegate.itemArrayM = self.topItem.lives

                    weak var weak_self : JCBasicViewController? = self
                    
                    self.tableViewDelegate.setCellSelected({ (obj:AnyObject?) in
                        weak_self!.cellSelectedWithObj(obj)
                    })

                    self.tableView.reloadData()
                }
            }


            }, failed: { (task:NSURLSessionDataTask?, error:NSError) in
                print(error)
        })]
    }
    
    /**
     cell选中调用的函数

     - parameter obj: NSIndexPath
     */
    func cellSelectedWithObj(obj : AnyObject?) -> Void {

        if let indexPath = obj as? NSIndexPath {

            let videoLiveVC : JCVideoLiveViewController = JCVideoLiveViewController()
            let liveItem = self.livesItemArrayM![indexPath.row]
            videoLiveVC.liveURL = liveItem.stream_addr
            videoLiveVC.imageURL = liveItem.creator?.portrait

            self.navigationController?.pushViewController(videoLiveVC, animated: true)
        }

    }

    /**
     解析plist数据，用于分析plist的时候用
     */
    //TODO: (jiangchuanc@gmail.com) - 分析plist时用的
    func setupLoadPlist() {
        let string = NSBundle.mainBundle().pathForResource("video.plist", ofType: nibName)

        let dict = NSDictionary.init(contentsOfFile: string!)

        self.topItem = JCTopItem(dict: dict!)
        self.tableViewDelegate.itemArrayM = self.topItem.lives
        self.tableViewDataSource.itemArrayM = self.topItem.lives

//        NSObject.resolveDict(dict!["lives"]![0]!["creator"]! as! NSDictionary)
//        NSObject.resolveDict(dict!["lives"]![0]! as! NSDictionary)
//        NSObject.resolveDict(dict!)
    }

    /**
     初始化tableView
     */
    func setupTableView() -> Void {

        self.tableViewDelegate = JCTableViewDelegate()
        self.tableViewDataSource = JCTableViewDataSource()

        tableView.dataSource = self.tableViewDataSource
        tableView.delegate = self.tableViewDelegate
    }

    // MARK: - getter and setter

    private lazy var tableView : UITableView = {

        let tableView : UITableView = UITableView(frame: self.view.bounds)
        
        tableView.backgroundColor = UIColor.redColor()
        tableView.rowHeight = 375+50

        return tableView

    }()
}

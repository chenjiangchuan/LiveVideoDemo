//
//  JCLivesItem.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCLivesItem: NSObject {

    var id : String?
    var room_id : Int?
    var online_users : Int?
    var rotate : Int?
    var version : Int?
    var multi : Int?
    var link : Int?
    var share_addr : String?
    var slot : Int?
    var image : String?
    var group : Int?
    var city : String?
    var optimal : Int?
    var creator : JCCreatorItem?
    var pub_stat : Int?
    var stream_addr : String?
    var name : String?
    var status : Int?

    convenience init(dict : NSDictionary) {
        self.init()

        self.id = dict["id"] as? String
        self.room_id = dict["room_id"] as? Int
        self.online_users = dict["online_users"] as? Int
        self.rotate = dict["rotate"] as? Int
        self.version = dict["version"] as? Int
        self.multi = dict["multi"] as? Int
        self.link = dict["link"] as? Int
        self.share_addr = dict["share_addr"] as? String
        self.slot = dict["slot"] as? Int
        self.image = dict["image"] as? String
        self.group = dict["group"] as? Int
        self.city = dict["city"] as? String
        self.optimal = dict["optimal"] as? Int
        self.pub_stat = dict["pub_stat"] as? Int
        self.stream_addr = dict["stream_addr"] as? String
        self.name = dict["name"] as? String
        self.status = dict["status"] as? Int

        let creatorDict = dict["creator"] as! NSDictionary

        self.creator = JCCreatorItem(dict: creatorDict)
    }

}

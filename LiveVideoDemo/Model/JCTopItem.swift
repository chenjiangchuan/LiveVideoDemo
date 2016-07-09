//
//  JCTopItem.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCTopItem: NSObject {

    var expire_time : Int?
    var lives : Array<JCLivesItem> = Array()
    var dm_error : Int?
    var error_msg : String?

    convenience init(dict : NSDictionary) {
        self.init();

        self.expire_time = dict["expire_time"] as? Int
        self.dm_error = dict["dm_error"] as? Int
        self.error_msg = dict["error_msg"] as? String

        // JCLivesItem模型
        let livesArray : NSArray = dict["lives"] as! NSArray

        for livesDict in livesArray {
            let livesItem = JCLivesItem(dict: livesDict as! NSDictionary)
            self.lives.append(livesItem)
        }
    }
}

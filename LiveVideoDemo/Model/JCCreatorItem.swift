//
//  JCCreatorItem.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCCreatorItem: NSObject {

    var id : Int?
    var description_ : String?
    var rank_veri : Int?
    var third_platform : String?
    var gmutex : Int?
    var birth : String?
    var emotion : String?
    var nick : String?
    var inke_verify : Int?
    var verified : Int?
    var level : Int?
    var location : String?
    var portrait : String?
    var hometown : String?
    var verified_reason : String?
    var veri_info : String?
    var gender : Int?
    var profession : String?

    var cell_hegith : CGFloat?

    convenience init(dict : NSDictionary) {
        self.init()

        self.id = dict["id"] as? Int
        self.description_ = dict["description"] as? String
        self.rank_veri = dict["rank_veri"] as? Int
        self.third_platform = dict["third_platform"] as? String
        self.gmutex = dict["gmutex"] as? Int
        self.birth = dict["birth"] as? String
        self.emotion = dict["emotion"] as? String
        self.nick = dict["nick"] as? String
        self.inke_verify = dict["inke_verify"] as? Int
        self.verified = dict["verified"] as? Int
        self.level = dict["level"] as? Int
        self.location = dict["location"] as? String
        self.portrait = dict["portrait"] as? String
        self.hometown = dict["hometown"] as? String
        self.verified_reason = dict["verified_reason"] as? String
        self.veri_info = dict["veri_info"] as? String
        self.gender = dict["gender"] as? Int
        self.profession = dict["profession"] as? String
    }

//    var cell_height : CGFloat {
//
//        
//
//        if self.cell_height != 0 {
//            return self.cell_height
//        }
//
//        let picWidth : CGFloat = 680;
//        let picHeight : CGFloat = 680;
//
//        let width = UIScreen.mainScreen().bounds.size.width
//
//        return self.cell_height = width / picWidth * picHeight
//    }

}

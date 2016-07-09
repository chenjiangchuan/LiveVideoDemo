//
//  ErgodicPlist.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import Foundation

extension NSObject {
    // MARK: 自动打印属性名称
    static func resolveDict(dict : NSDictionary) {

        let strM = NSMutableString()
        let strInitM = NSMutableString()

        dict.enumerateKeysAndObjectsUsingBlock { (key, obj, stop) in

            // 类型
            var type = NSMutableString()

            if obj.isKindOfClass(NSClassFromString("__NSCFString")!) {
                type = "NSString"
            } else if obj.isKindOfClass(NSClassFromString("__NSCFArray")!) {
                type = "NSArray"
            } else if obj.isKindOfClass(NSClassFromString("__NSCFNumber")!) {
                type = "Int"
            } else if obj.isKindOfClass(NSClassFromString("__NSCFDictionary")!) {
                type = "NSDictionary"
            } else {
                type = "NSString"
            }

            var str = NSMutableString()
            var strInit = NSMutableString()

            if type.containsString("NS") {
                // 说明是对象，这里我们要去掉NS，因为swift基本类型没有NS开头
                let footer = (type as NSString).substringFromIndex(2)

                // 如果是Array
                if footer == "Array" {
                    str = NSMutableString(format: "var \(key) : \(footer)<<#type#>> = Array()")
                    strInit = NSMutableString(format: "dict[\"\(key)\"] as! \(type)")
                } else {
                    str = NSMutableString(format: "var \(key) : \(footer)?")
                    strInit = NSMutableString(format: "self.\(key) = dict[\"\(key)\"] as? \(footer)")
                }
            } else { // Int
                str = NSMutableString(format: "var \(key) : \(type)?")
                strInit = NSMutableString(format: "self.\(key) = dict[\"\(key)\"] as? \(type)")
            }

            strM.appendFormat("\n\(str)")
            strInitM.appendFormat("\n\(strInit)")
        }

        print(strM)
        print()
        print(strInitM)
    }

}
//
//  JCHttpTool.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit
import AFNetworking

typealias Succeed = ((NSURLSessionDataTask, AnyObject?) -> Void)?
typealias Failure = ((NSURLSessionDataTask?, NSError) -> Void)?
typealias Progress = ((NSProgress) -> Void)?

class JCHttpTool : NSObject {

    /**
     GET请求

     - parameter url:        url地址
     - parameter parameters: 传入的参数
     - parameter progressed: 当前进度回调
     - parameter succeed:    数据接收成功的回调
     - parameter failed:     错误回调
     */
    class func jc_get(url:String!,parameters:AnyObject?,progressed:Progress, succeed:Succeed,failed:Failure) {

        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        let myprogress:Progress = progressed


        let mrg : AFHTTPSessionManager = AFHTTPSessionManager()

        mrg.responseSerializer = AFJSONResponseSerializer()
        mrg.responseSerializer.acceptableContentTypes = NSSet(objects: "text/html", "application/json", "text/plain") as? Set<String>

         mrg.GET(url, parameters: parameters, progress: { (progress) in

            if let myprogress = myprogress {
                myprogress(progress)
            }

            }, success: { (task: NSURLSessionDataTask, obj: AnyObject?) in

                if let mysucceed = mysucceed {
                    mysucceed(task, obj)
                }

         }) { (task: NSURLSessionDataTask?, error: NSError) in

                if let myfailure = myfailure {
                    myfailure(task, error)
                }
        }
    }

    /**
     POST请求

     - parameter url:        url地址
     - parameter parameters: 传入的参数
     - parameter progressed: 当前进度回调
     - parameter succeed:    数据接收成功的回调
     - parameter failed:     错误回调
     */
    class func jc_post(url:String!,parameters:AnyObject?,progressed:Progress, succeed:Succeed,failed:Failure) {

        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        let myprogress:Progress = progressed


        let mrg : AFHTTPSessionManager = AFHTTPSessionManager()

        mrg.responseSerializer = AFJSONResponseSerializer()
        mrg.responseSerializer.acceptableContentTypes = NSSet(objects: "text/html", "application/json", "text/plain") as? Set<String>

        mrg.POST(url, parameters: parameters, progress: { (progress) in

            if let myprogress = myprogress {
                myprogress(progress)
            }

            }, success: { (task:NSURLSessionDataTask, obj:AnyObject?) in

                if let mysucceed = mysucceed {
                    mysucceed(task, obj)
                }

        }) { (task:NSURLSessionDataTask?, error:NSError) in

            if let myfailure = myfailure {
                myfailure(task, error)
            }
        }
    }

}
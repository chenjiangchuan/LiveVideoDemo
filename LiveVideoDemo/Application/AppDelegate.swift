//
//  AppDelegate.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let rect = UIScreen.mainScreen().bounds
        window = UIWindow(frame: rect)

        window?.rootViewController = JCNavigationController(rootViewController: JCBasicViewController())

        window?.makeKeyAndVisible()

        return true
    }
}


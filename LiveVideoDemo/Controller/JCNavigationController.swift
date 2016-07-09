//
//  JCNavigationController.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.redColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(20)
        ]
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {

        if self.childViewControllers.count == 0 {
            self.navigationBarHidden = false
        } else {
            self.navigationBarHidden = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {

        self.navigationBarHidden = false
        return super.popViewControllerAnimated(animated)
    }

}

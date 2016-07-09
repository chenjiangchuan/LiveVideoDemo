//
//  UIImageView+JC.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

extension UIImageView {

    /**
     对SDImageView的封装

     - parameter url:
     */
    public func jc_setImageWithURL(url: NSURL!) {

        return self.jc_setImageWithURL(url!, placeholderImage: nil)
    }

    public func jc_setImageWithURL(url: NSURL!, placeholderImage placeholder: UIImage!) {

        return self.sd_setImageWithURL(url!, placeholderImage: placeholder!)
    }

}
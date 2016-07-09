//
//  JCTableViewCell.swift
//  LiveVideoDemo
//
//  Created by chenjiangchuan on 16/7/8.
//  Copyright © 2016年 JC'Chan. All rights reserved.
//

import UIKit

class JCTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var onlineNumLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!

    static let cellIdentifier = "cell"

    var liveItem : JCLivesItem! {
        willSet {
            self.liveItem = newValue
        }

        didSet {
            // 设置数据
            self.nameLabel.text = liveItem.name
            self.cityLabel.text = liveItem.city
            self.onlineNumLabel.text = String.init(format: "%d", liveItem.online_users!)
            let strUrl = String.init(format: "http://img.meelive.cn/%@", (liveItem.creator?.portrait)!)

            if let url = NSURL.init(string: strUrl) {

                // 680*680
                self.iconImageView.jc_setImageWithURL(url, placeholderImage: UIImage(named: "login_register_background"))

                self.coverImageView.jc_setImageWithURL(url, placeholderImage: UIImage(named: "login_register_background"))
            }


        }
    }

    class func cellWithTableView(tableView : UITableView) -> JCTableViewCell {

        var cell : JCTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? JCTableViewCell

        if  cell == nil {
            cell = NSBundle.mainBundle() .loadNibNamed("JCTableViewCell", owner: nil, options: nil).first as? JCTableViewCell
        }

        return cell!
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // icon圆角处理
        self.iconImageView.layer.cornerRadius = self.iconImageView.layer.frame.size.height * 0.5
        self.iconImageView.clipsToBounds = true

        self.coverImageView.contentMode = .ScaleAspectFill
        self.coverImageView.clipsToBounds = true
    }
}

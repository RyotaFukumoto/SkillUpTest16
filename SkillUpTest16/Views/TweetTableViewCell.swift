//
//  TweetTableViewCell.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var thumbnail: UIImageView!
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var screenName: UILabel!
    @IBOutlet weak private var tweettext: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var item: Tweet? {
        didSet {
            name.text = item?.name
            screenName.text = item?.screenName
            tweettext.text = item?.text
            if let nameText = item?.name,
                let thumName = ThumbnailDao.findByName(name: nameText) {
                let thumData = thumName.imageData
                thumbnail.image = UIImage(data: thumData as Data)
            }
        }
    }
        
}

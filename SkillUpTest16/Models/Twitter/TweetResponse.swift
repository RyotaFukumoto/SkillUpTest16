//
//  TweetResponse.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//
import Foundation
import SwiftyJSON

class TweetResponse: NSObject {
    var tweets: [Tweet] = []
    func map(json: Any) -> [Tweet] {
        tweets = []
        let json = JSON(json)
        json.forEach { (_, rest) in
            let name = rest["user"]["name"].string
            let screenName = rest["user"]["screen_name"].string
            let thumbnailUrl = rest["user"]["profile_image_url_https"].string
            let text = rest["text"].string
            
            tweets.append(Tweet(name: name, screenName: screenName, thumbnailUrl: thumbnailUrl, text: text))
            if let nameAfr = name, let thumUrlAfr = thumbnailUrl {
                thumbnailAdd(name: nameAfr, thumbnailUrl: thumUrlAfr)
            }
            
        }
        
        return tweets
    }
    
    func thumbnailAdd(name: String, thumbnailUrl: String) {
        if let thumUrl = URL(string: thumbnailUrl as String),
            let imageData = try? Data(contentsOf: thumUrl ) {
            ThumbnailDao.addThumbnail(name: name, image: imageData)
        }
    }
}

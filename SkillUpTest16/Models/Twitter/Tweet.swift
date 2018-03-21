//
//  Tweet.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

struct Tweet {
    var screenName: String?
    var name: String?
    var thumbnailUrl: String?
    var text: String?
    
    init(name: String?, screenName: String?,
         thumbnailUrl: String?, text: String?) {
        self.name = name
        self.screenName = screenName
        self.thumbnailUrl = thumbnailUrl
        self.text = text
    }
    
}

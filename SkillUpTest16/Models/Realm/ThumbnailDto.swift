//
//  ThumbnailDto.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import Foundation
import RealmSwift

class ThumbnailDto: Object {
    @objc dynamic var name = ""
    @objc dynamic var imageData = NSData()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

//
//  ThumbnailDao.swift
//  SkillUpTest16
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import Foundation
import UIKit

final class ThumbnailDao {
    static let dao = RealmDaoHelper<ThumbnailDto>()
    static func addThumbnail(name: String, image: Data) {
        let thumbnail = ThumbnailDto()
        thumbnail.name = name
        thumbnail.imageData = image as NSData
        
        dao.add(object: thumbnail)
    }
    
    static func findByName(name: String) -> ThumbnailDto? {
        
        let thumbnail = dao.findFirst(key: name as AnyObject)
        return thumbnail
    }
    
    static func deleteAll() {
        
        dao.deleteAll()
    }
    
}

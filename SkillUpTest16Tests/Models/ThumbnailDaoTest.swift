//
//  ThumbnailDaoTest.swift
//  SkillUpTest16Tests
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import XCTest
@testable import SkillUpTest16

class ThumbnailDaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ThumbnailDao.deleteAll()
    }
    
    override func tearDown() {
        ThumbnailDao.deleteAll()
        super.tearDown()
    }
    
    func testAddThumbnail(){
        let name = "taro"
        let imageData:Data = UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))!
        
        ThumbnailDao.addThumbnail(name: name, image: imageData)
        
        let thum = ThumbnailDao.dao.findAll()
        XCTAssertEqual(thum.first?.name, "taro")
        XCTAssertEqual(thum.first?.imageData, UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))! as NSData)
        
    }
    
    func testFindByName() {
        let name = "taro"
        let imageData:Data = UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))!
        
        ThumbnailDao.addThumbnail(name: name, image: imageData)
        XCTAssertEqual(ThumbnailDao.findByName(name: "taro"),UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))! as NSData)
        
    }
    func testDeleteAll() {
        let name = "taro"
        let imageData:Data = UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))!
        ThumbnailDao.addThumbnail(name: name, image: imageData)
        
        ThumbnailDao.deleteAll()
        let thum = ThumbnailDao.dao.findAll()
        XCTAssertEqual(thum.count,0)
    }
}

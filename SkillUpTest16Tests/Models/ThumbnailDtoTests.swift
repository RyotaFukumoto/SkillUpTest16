//
//  ThumbnailDtoTests.swift
//  SkillUpTest16Tests
//
//  Created by ryota on 2018/03/17.
//  Copyright © 2018年 ryota. All rights reserved.
//

import XCTest
@testable import SkillUpTest16
class ThumbnailDtoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThumbnailDto(){
        let name = "taro"
        let imageData:NSData = UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))! as NSData
        
        let thum = ThumbnailDto()
        thum.name = name
        thum.imageData = imageData
        
        XCTAssertEqual(thum.name, "taro")
        XCTAssertEqual(thum.imageData, UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))! as NSData)
    }
    
    func testPrimaryKey() {
        let primaryKey = ThumbnailDto.primaryKey()
        
        XCTAssertEqual(primaryKey, "name")
    }
    
}

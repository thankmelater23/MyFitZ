//
//  MyFitZTests.swift
//  MyFitZTests
//
//  Created by Andre Villanueva on 10/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import XCTest
@testable import MyFitZ

class MyFitZTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        var currWar: Wardrobe = Wardrobe()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var currWar: Wardrobe = Wardrobe()
        XCTAssert(currWar.selectedCloset.count != 0, "Empty wardrobe")
        XCTAssert(currWar.selectedCloset.first != nil, "Uninitialized")
    }
    
    func testWardrobeInitializedProperly(){
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

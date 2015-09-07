//
//  My_FitzTests.swift
//  My_FitzTests
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

//@testable import My_Fitz
import XCTest

class My_FitzTests: XCTestCase {

  func testWardrobeType(){


    //XCTAssertEqual(wardrobe, Wardrobe(), "Not the same")
  }
  func testMultiplyingTwoNegativeNumbersYieldsAPositiveValue() {
    let x = 6
    let y = 4
    let product = x * y
    XCTAssertTrue(((x + y) == 10), "X + Y = \(x + y)")

    XCTAssertTrue(product > 0, "Multiplying two negative numbers should yield a positive number. Product: \(product)")
  }

    override func setUp() {
        super.setUp()
        let drobe = Wardrobe()
        let item = Item()
        
        let model = item.model
        assert(model != nil, "Model is empty")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

//      func testSetCell(){
//
//      }
    
//        func testWardrobeTypeAppending(){
//            let testWardrobe:Wardrobe? = Wardrobe()
//            let testItem: Item! = Item()
//            let testCategoryString: String = CATEGORY_PICKER_OPTIONS[0]
//            let testSubCategoryString: String = "Test Sub Category"
//            
//            //Check for nil
//            assert(testWardrobe != nil)
//            
//            testWardrobe?.appendItemAt(testCategoryString, funcSubCategory: testSubCategoryString, newItem: testItem)
//            
//            assert((testWardrobe?.doesItemExistAt(testCategoryString, funcSubCategory: testSubCategoryString, item: testItem))!)
//    }
}

//
//  MyFitZUITests.swift
//  MyFitZUITests
//
//  Created by Andre Villanueva on 10/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import XCTest
//import SnapshotHelper

class MyFitZUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        let app = XCUIApplication()
        XCUIDevice.sharedDevice().orientation = .FaceUp
        XCUIDevice.sharedDevice().orientation = .FaceUp
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        app.buttons["WishList"].tap()
        app.buttons["Footware"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        XCUIDevice.sharedDevice().orientation = .Portrait
        app.childrenMatchingType(.Window).elementBoundByIndex(6).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.swipeDown()
        XCUIDevice.sharedDevice().orientation = .Portrait
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        
        let tablesQuery = app.tables
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(17).childrenMatchingType(.StaticText).matchingIdentifier("N/A").elementBoundByIndex(0).tap()
        tablesQuery.cells.containingType(.StaticText, identifier:"Condition:").staticTexts["N/A"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        app.buttons["EDIT"].tap()
        app.navigationBars["Wish List-Edit"].buttons["Wish List-Detail"].tap()
        app.navigationBars["Wish List-Detail"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        
        let wishListSubcategoryNavigationBar = app.navigationBars["Wish List-SubCategory"]
        wishListSubcategoryNavigationBar.buttons["Add Item"].tap()
        app.navigationBars["Wish List-Item Create"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        wishListSubcategoryNavigationBar.childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.navigationBars["Wish List-Category"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.buttons["hamperImage"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        app.navigationBars["Wish List-RECENYLY_WORN"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.buttons["favoritesButton"].tap()
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        app.navigationBars["Wish List-Favorited Items"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.buttons["search"].tap()
        app.navigationBars["Wish List-Search"].buttons["Wish List-Selection"].tap()
        app.navigationBars["Wish List-Selection"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.buttons["OPTIONS"].tap()
        
        let aboutButton = app.buttons["About"]
        aboutButton.tap()
        
        let backToMainButton = app.buttons["Back To Main"]
        backToMainButton.tap()
        aboutButton.tap()
        backToMainButton.tap()
        app.buttons["Contact Us"].tap()
        backToMainButton.tap()
        app.buttons["Help"].tap()
        backToMainButton.tap()
        XCUIDevice.sharedDevice().orientation = .FaceUp
        setLanguage(app)
        app.launch()
        
         // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}

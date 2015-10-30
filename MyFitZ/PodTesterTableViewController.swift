//
//  PodTesterTableViewController.swift
//  Pod Tester
//
//  Created by Andre Villanueva on 10/11/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import UIKit
import CRToast
import RETableViewManager

class PodTesterTableViewController: UITableViewController, RETableViewManagerDelegate {
    var manager:RETableViewManager?
    var section:RETableViewSection?
    var anotherSection:RETableViewSection?
    var item:RETextItem?
    var numberItem:RENumberItem?
    var boolThing:REBoolItem?
    
    override func viewDidLoad() {
        manager = RETableViewManager.init(tableView: self.tableView, delegate: self)
        self.section = RETableViewSection(headerTitle: "Test Header")
        self.manager!.addSection(section)
        
        self.numberItem = RENumberItem(title: "Number Item", value: "", placeholder: "Place Value")
        self.item = RETextItem(title: "Test Item", value: "This is the value")
        self.boolThing = REBoolItem(title: "Choose up", value: true)
        
        self.section?.addItem(numberItem)
        self.section?.addItem(item)
        self.section?.addItem(boolThing)
        
        self.anotherSection?.addItem(numberItem)
        self.anotherSection?.addItem(item)
        self.anotherSection?.addItem(boolThing)
        
        var dicOfOptions = [kCRToastTextKey: "Hello world",
                            kCRToastTextAlignmentKey: "NSTextAlignmentCenter",
                            kCRToastBackgroundColorKey : UIColor.redColor(),
                            kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
                            kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
                            kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
                            kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"]
        
//        CRToastManager .showNotificationWithOptions(dicOfOptions, completionBlock: {
//            MRProgressOverlayView.dismissOverlayForView(self.view, animated: true)
//            print("This is a test log")})
//        
//        MRProgressOverlayView.showOverlayAddedTo(self.view, animated: true)
//        
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
}

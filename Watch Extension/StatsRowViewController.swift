//
//  StatsRowViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/30/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit

class StatsRowViewController: NSObject{
    
    @IBOutlet var title: WKInterfaceLabel!
    @IBOutlet var value: WKInterfaceLabel!
    
    
    var questionAndValue: [String: String]?{
        didSet{
            if let questionAndValue = questionAndValue{
                title.setText(questionAndValue["title"])
                value.setText(questionAndValue["value"])
            }
        }
    }
}
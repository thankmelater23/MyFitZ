//
//  GlanceController.swift
//  Watch Extension
//
//  Created by Andre Villanueva on 5/16/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {
    @IBOutlet var itemsValue: WKInterfaceLabel!
    @IBOutlet var amountOfFavoritedItems: WKInterfaceLabel!
    @IBOutlet var popularItem: WKInterfaceImage!
    @IBOutlet var amountOfNewItems: WKInterfaceLabel!
    @IBOutlet var amountOfItems: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

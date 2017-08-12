//
//  WatchDetailController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/26/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class WatchDetailController: WKInterfaceController, WCSessionDelegate{
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var model: WKInterfaceLabel!
    @IBOutlet var category: WKInterfaceLabel!
    var item: WatchItem?{
        didSet{
//            self.image.setImage(self.item!.image)
            self.category.setText(self.item!.category)
            self.model.setText(self.item!.model)
        }
    }
    
    var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activateSession()
            }
        }
    }
    
    var message: [String: AnyObject] = [:]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let item = context as? WatchItem{self.item = item}
        
        setTitle("Detail")
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
//        if WCSession.isSupported(){
//            session = WCSession.defaultSession()
//            //            session?.sendMessage(message, replyHandler: {(content:[String : AnyObject]) -> Void in print("") } , errorHandler: { (error) -> Void in print("")})
//        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
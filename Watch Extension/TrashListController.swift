//
//  TrashListController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/30/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity
import UIKit

class TrashListController: WKInterfaceController, WCSessionDelegate{
    @IBOutlet var table: WKInterfaceTable!
    
    var selectedIndex = 0
    var items: [WatchItem]?{
        didSet{
            let count = (items?.count)! as Int!
            self.table.setNumberOfRows(count, withRowType: TrashList)
            
            
            for index in 0..<self.table.numberOfRows{
                if let controller = table.rowControllerAtIndex(index) as? TrashListRowController{
                    controller.item = items![index]
                }
            }
        }
    }
    var message: [String: AnyObject] = [:]
    var itemSender: [String: AnyObject] = [:]
    var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activateSession()
            }
        }
    }
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        setTitle("Deleted")
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
//        self.getData()
        items = createItems()
    }
    
    func getData(){
        if WCSession.isSupported(){
            session = WCSession.defaultSession()
            message.updateValue(TrashList, forKey: TrashList)
            
            if ((session?.reachable) != nil){
                session!.sendMessage(message, replyHandler: { (response) -> Void in
                    // 4
                    let watchItemArray = response[TrashList]
                    self.items![0].model = watchItemArray as? String
//                    let arrayCount = watchItemArray!.count
//                    
//                    for index in 0...arrayCount{
//                        let watchItem = WatchItem()
//                        var dicOfItem = watchItemArray![index] as! [String: AnyObject]
////                        watchItem.setItemFromDic(dicOfItem)
//                        watchItem.model = "fast"
//                        self.items?.append(watchItem)
//                    }
                    }, errorHandler: { (error) -> Void in
                        print(error)
                        self.items = self.createItems()
                })
            }else{
                items = createItems()
            }
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didAppear() {
        super.didAppear()
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let item = items![rowIndex]
        let controllers = "detail"
        selectedIndex = rowIndex
        presentControllerWithName(controllers, context: item)
    }
    
    func createItems()-> [WatchItem]{
        var items = [WatchItem]()
        for i in 0...CategoryOptions.count{
            let item = WatchItem()
            
            if i < CategoryOptions.count{
                
                item.category = CategoryOptions[i]//"shoewareImage"
            }else{item.category = CategoryOptions[0]}
            
            item.model = "Item Model  " + String(i)
            item.brand = "Item brand" + String(i)
            item.lastTimeWorn = "12/12/12"
            item.dateDeleted = "12/12/12"
            item.payedPrice = 10 * Double(i)
            item.timesWorn = 2 * i
            item.favorited = true
            item.image = UIImage(named: "shoewareImage")
            items.append(item)
        }
        return items
    }
    
}
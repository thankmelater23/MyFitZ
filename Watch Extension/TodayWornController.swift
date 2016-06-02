//
//  TodayWornController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/30/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class TodayWornController: WKInterfaceController, WCSessionDelegate{
    @IBOutlet var table: WKInterfaceTable!
    @IBOutlet var itemsValue: WKInterfaceLabel!
    @IBOutlet var amountOfFavoritedItems: WKInterfaceLabel!
    @IBOutlet var popularItem: WKInterfaceImage!
    @IBOutlet var amountOfNewItems: WKInterfaceLabel!
    
    @IBOutlet var amountOfItems: WKInterfaceLabel!
    var selectedIndex = 0
    var items: [WatchItem]?{
        didSet{
            let count = (items?.count)! as Int!
            self.table.setNumberOfRows(count, withRowType: TodayWornList)
            
            
            for index in 0..<self.table.numberOfRows{
                if let controller = table.rowControllerAtIndex(index) as? TodayWornRowViewController{
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
//        setTitle("Today View")
        
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
            message.updateValue(FavList, forKey: FavList)
            
            if ((session?.reachable) != nil){
                session!.sendMessage(message, replyHandler: { (response) -> Void in
                    // 4
                    for (_, value) in response{
                        let watchItem = WatchItem()
                        watchItem.setItemFromDic(value as! [String : AnyObject])
                        self.items?.append(watchItem)
                    }
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
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let item = items![rowIndex]
        let controllers = "detail"
        selectedIndex = rowIndex
        presentControllerWithName(controllers, context: item)
    }
    
    func createItems()-> [WatchItem]{
        var items = [WatchItem]()
        for i in 1...10{
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
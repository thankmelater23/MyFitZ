//
//  StatsController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/30/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class StatsController: WKInterfaceController, WCSessionDelegate{
    @IBOutlet var table: WKInterfaceTable!
    
    var selectedIndex = 0
    var QnA: [[String: String]]?{
        didSet{
            let count = (QnA?.count)! as Int!
            self.table.setNumberOfRows(count, withRowType: StatsList)
            
            
            for index in 0..<self.table.numberOfRows{
                if let controller = table.rowControllerAtIndex(index) as? StatsRowViewController{
                    controller.questionAndValue = QnA![index]
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

        setTitle("Statistics")
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
//        self.getData()
        QnA = createItems()
    }
    
    func getData(){
//        if WCSession.isSupported(){
//            session = WCSession.defaultSession()
//            message.updateValue(RecentList, forKey: RecentList)
//            
//            if ((session?.reachable) != nil){
//                session!.sendMessage(message, replyHandler: { (response) -> Void in
//                    // 4
//                    for (_, value) in response{
//                        let watchItem = WatchItem()
//                        watchItem.setItemFromDic(value as! [String : AnyObject])
//                        self.items?.append(watchItem)
//                    }
//                    }, errorHandler: { (error) -> Void in
//                        print(error)
//                        self.items = self.createItems()
//                })
//            }else{
//                items = createItems()
//            }
//        }
    }
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didAppear() {
        super.didAppear()
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
//        let item = QnA![rowIndex]
//        let controllers = "detail"
//        selectedIndex = rowIndex
//        presentControllerWithName(controllers, context: item)
    }
    
    func createItems()-> [[String: String]]{
        var tempQnA = [[String: String]]()
        
        for i in 1...10{
            var item = [String: String]()
            item["title"] = "Question " + String(i)
            item["value"] = "Answer number " + String(i)
            tempQnA.append(item)
        }
        return tempQnA
    }
}

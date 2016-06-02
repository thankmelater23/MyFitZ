//
//  WatchItem.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/26/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

class WatchItem: NSObject{
    var image: UIImage?
    var imageData: NSData?{
        didSet{
            if let imageData = imageData{
                
                image = UIImage(data: imageData)
            }
        }
    }
    var brand: String?
    var model: String?
    var category: String?
    var lastTimeWorn: String?
    var dateDeleted: String?
    var payedPrice: Double?
    var timesWorn: Int?
    var favorited: Bool?
//    lazy var classData = [String: AnyObject]()
    
    override init(){
        self.image = UIImage()
        self.model = String()
        self.brand = String()
        self.category = String()
        self.lastTimeWorn = String()
        self.dateDeleted = String()
        self.payedPrice = Double()
        self.timesWorn = Int()
        self.favorited = Bool()
    }

    func setItemFromDic(dictionary: [String: AnyObject]){
        self.imageData = dictionary["image"] as! NSData?
        self.model = dictionary["model"] as! String?
        self.brand = dictionary["brand"] as! String?
        self.category = dictionary["category"] as! String?
        self.lastTimeWorn = dictionary["lastTimeWorn"] as! String?
        self.dateDeleted = dictionary["dateDeleted"] as! String?
        self.payedPrice = dictionary["payedPrice"] as! Double?
        self.timesWorn = dictionary["timesWorn"] as! Int?
        self.favorited = dictionary["favorited"] as! Bool?
        
//        classData = dictionary
    }
    
    //Converts the information in the WatchItem to a dictionary
    func convertWatchItemToDickAndReturn()->[String: AnyObject]{
        var newDic = [String: AnyObject]()
        
        newDic["image"] = self.imageData
        newDic["model"] = self.model
        newDic["brand"] = self.brand
        newDic["category"] = self.category
        newDic["lastTimeWorn"] = self.lastTimeWorn
        newDic["dateDeleted"] = self.dateDeleted
        newDic["payedPrice"] = self.payedPrice
        newDic["timesWorn"] = self.timesWorn
        newDic["favorited"] = self.favorited
        
        return newDic
    }
}


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

struct WatchhItemAttributeNames{
    let ITEM_BRAND_STRING        = "Watchh Brand"
    let ITEM_MODEL_STRING        = "Watchh Model"
    let ITEM_CATEGORY_STRING     = "Watchh Category"
    let ITEM_SUBCATEGORY_STRING  = "Watchh Sub-Category"
    let ITEM_INDEX_STRING        = "Watchh Index"
    let ITEM_PRICE_STRING        = "Watchh Original Price"
    let ITEM_IMAGENAME_STRING    = "Watchh Image Name"
    let ITEM_FAVORITED_STRING    = "Watchh Favorited"
    let ITEM_ISTHISNEW_STRING    = "Watchh New Item"
    let ITEM_TIMESWORN_STRING    = "Watchh Times Worn"
    let ITEM_LASTTIMEWORN_STRING = "Watchh Last Time Worn"
    let ITEM_IMAGE_STRING        = "Watchh Image"
    let ITEM_KIND_STRING        = "Watchh Kind"
    let ITEM_SIZE_STRING        = "Watchh Size"
    let ITEM_ID_STRING        = "Watchh ID"
    
    //MARK: -Optional
    let ITEM_DATEPURCHASERD_STRING = "Watchh Date Purchased"
    let ITEM_COLOR_STRING          = "Watchh Primary Color"
    let ITEM_SECONDARYCOLOR_STRING = "Watchh Secondary Color"
    let ITEM_THIRDCOLOR_STRING = "Watchh Third Color"
    let ITEM_DATERELEASED_STRING = "Watchh Date Released"
    let ITEM_ITEMNOTES_STRING = "Watchh Item Note"
    let ITEM_CONDITION_STRING = "Watchh Condition"
    let ITEM_PRIMARYMATERIAL_STRING = "Watchh Primary Material"
    let ITEM_SECONDAY_MATERIAL_STRING = "Watchh Secondary Material"
    let ITEM_RETAILPRICE_STRING = "Watchh Payed Price"
    let ITEM_STORELURL_STRING = "Watchh Store URL/Website"
    let ITEM_STORELOCATION_STRING = "Watchh Store Location"
    let ITEM_SELLERNAME_STRING        = "Watchh Seller Name"
    let ITEM_LOCATIONPATH_STRING   = "Watchh Location Path"
    let ITEM_DATEDELETED_STRING = "Watchh Date Deleted"
}
let WatchhItemAttributeName = WatchhItemAttributeNames()

class WatchItem: NSObject{
//    var image: UIImage?
//    let watchString = "watch"
//    var imageData: NSData?{
//        didSet{
//            if let imageData = imageData{
//                
//                image = UIImage(data: imageData)
//            }
//        }
//    }
    var brand: String?
    var model: String?
    var category: String?
    var lastTimeWorn: String?
    var dateDeleted: String?
    var payedPrice: Double?
    var timesWorn: Int?
    var favorited: Bool?
    
    override init(){
//        self.image = UIImage()
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
//        self.imageData = dictionary["image"] as! NSData?
        self.model = "N/A"//dictionary["model"] as? String? ?? "N/A"
        self.brand = "N/A"//dictionary["brand"] as? String? ?? "N/A"
        self.category = "N/A"//dictionary["category"] as? String? ?? "N/A"
        self.lastTimeWorn = "N/A"//dictionary["lastTimeWorn"] as? String? ?? "N/A"
        self.dateDeleted = "N/A"//dictionary["dateDeleted"] as? String? ?? "N/A"
        self.payedPrice = 10.0//dictionary["payedPrice"] as? Double? ?? 0.0
        self.timesWorn = 1//dictionary["timesWorn"] as? Int? ?? 0
        self.favorited = false//dictionary["favorited"] as? Bool? ?? false
    }
    
    //Converts the information in the WatchItem to a dictionaryf
    func convertWatchItemToDickAndReturn()->[String: AnyObject]{
        var newDic = [String: AnyObject]()
        
//        newDic["image"] = self.imageData
        newDic["model"] = self.model ?? "N/A"
        newDic["brand"] = self.brand ?? "N/A"
        newDic["category"] = self.category ?? "N/A"
        newDic["lastTimeWorn"] = self.lastTimeWorn ?? "N/A"
        newDic["dateDeleted"] = self.dateDeleted ?? "N/A"
        newDic["payedPrice"] = self.payedPrice ?? 10.0
        newDic["timesWorn"] = self.timesWorn ?? 0
        newDic["favorited"] = self.favorited ?? false
        
        return newDic
    }
    
    //MARK: -Methods
    //MARK: -Initializers
    required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
        super.init()
        //Required
        self.brand        = decoder.decodeObjectForKey(WatchhItemAttributeName.ITEM_BRAND_STRING) as! String?
        self.model        = decoder.decodeObjectForKey(WatchhItemAttributeName.ITEM_MODEL_STRING) as! String?
        self.category     = decoder.decodeObjectForKey(WatchhItemAttributeName.ITEM_CATEGORY_STRING) as! String?
//        self.subCategory  = decoder.decodeObjectForKey(WatchhItemAttributeName.ITEM_SUBCATEGORY_STRING) as! String!
        self.payedPrice   = decoder.decodeDoubleForKey(WatchhItemAttributeName.ITEM_IMAGE_STRING) as Double?
        self.favorited    = decoder.decodeBoolForKey(WatchhItemAttributeName.ITEM_FAVORITED_STRING) as Bool!
//        self.isThisNew    = decoder.decodeBoolForKey(WatchhItemAttributeName.ITEM_ISTHISNEW_STRING) as Bool!
        self.timesWorn    = decoder.decodeIntegerForKey(WatchhItemAttributeName.ITEM_TIMESWORN_STRING) as Int?
        self.lastTimeWorn = decoder.decodeObjectForKey(WatchhItemAttributeName.ITEM_LASTTIMEWORN_STRING) as! String?
        
    }//Decode data in class 
    func encodeWithCoder(coder: NSCoder){
        //Required
        coder.encodeObject(self.brand, forKey: WatchhItemAttributeName.ITEM_BRAND_STRING)
        coder.encodeObject(self.model, forKey: WatchhItemAttributeName.ITEM_MODEL_STRING)
        coder.encodeObject(self.category, forKey: WatchhItemAttributeName.ITEM_CATEGORY_STRING)
//        coder.encodeObject(self.subCategory, forKey: WatchhItemAttributeName.ITEM_SUBCATEGORY_STRING)
        coder.encodeDouble(self.payedPrice!, forKey: WatchhItemAttributeName.ITEM_PRICE_STRING)
//        coder.encodeObject(self.image, forKey: WatchhItemAttributeName.ITEM_IMAGE_STRING)
        coder.encodeBool(self.favorited!, forKey: WatchhItemAttributeName.ITEM_FAVORITED_STRING)
//        coder.encodeBool(self.isThisNew!, forKey: WatchhItemAttributeName.ITEM_ISTHISNEW_STRING)
        coder.encodeInteger(self.timesWorn!, forKey: WatchhItemAttributeName.ITEM_TIMESWORN_STRING)
        coder.encodeObject(self.lastTimeWorn, forKey: WatchhItemAttributeName.ITEM_LASTTIMEWORN_STRING)
    }//Encodes data in class

}




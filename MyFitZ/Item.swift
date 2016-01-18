//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit
import Async

//MARK: -Item Class
/// Represents an item of clothing with multiple vars to represent the details of the item
class Item: NSObject, NSCoding{
    //MARK: -Variables
    //MARK: -Item Required
    var brand: String!, model: String!
    var category: String!, subCategory : String!, index : Int!
    var payedPrice: Double!
    var image: UIImage!
    var favorited: Bool! = false
    var isThisNew: Bool! = true
    var timesWorn: Int!
    var lastTimeWorn: String!
    var kind: String!
    var size: String!
    var id: Int!
    
    //MARK: - Item Required defined values
    var datePurchased: String!
    var color: String!
    var secondaryColor: String!
    var thirdColor: String!
    var dateReleased: String!
    var itemNotes: String!
    var condition: String!
    var primaryMaterial: String!
    var secondaryMaterial: String!
    var retailPrice: Double!
    var sellerURL: String!
    var storeLocation: String!
    var sellerName: String!
    //    var arrayOfImages: [UIImages]
    //  var numberOfDifferentFitsWornWith
    
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    /// Returns values of all the item vars
    override var description: String {
        log.info(__FUNCTION__)
        let string = "\nbrand:\(self.brand) \nmodel:\(self.model) \ncategory:\(self.category) \nsubCategory:\(self.subCategory) \nindex:\(self.index) \npayedPrice:\(self.payedPrice) \nimage:\(self.image) \nfavorited:\(self.favorited) \nisThisNew:\(self.isThisNew) \ntimesWorn:\(self.timesWorn) \nlastTimeWorn:\(self.lastTimeWorn) \nkind:\(self.kind) \nsize:\(self.size)\nID:\(self.id)\ndatePurchased:\(self.datePurchased) \ncolor:\(self.color)\nStore Location:\(self.storeLocation) \nSeller Name:\(self.sellerName)"
        return string
    }
    
    deinit{
        log.info(__FUNCTION__)
        log.info("\n\nItem: \(self.model)//\(self.brand) Deninitialized")
    }
    
    //MARK: -Methods
    //MARK: -Initializers
    required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
        super.init()
        //Required
        self.brand        = decoder.decodeObjectForKey(ItemAttributeName.ITEM_BRAND_STRING) as! String!
        self.model        = decoder.decodeObjectForKey(ItemAttributeName.ITEM_MODEL_STRING) as! String!
        self.category     = decoder.decodeObjectForKey(ItemAttributeName.ITEM_CATEGORY_STRING) as! String!
        self.subCategory  = decoder.decodeObjectForKey(ItemAttributeName.ITEM_SUBCATEGORY_STRING) as! String!
        self.index        = decoder.decodeIntegerForKey((ItemAttributeName.ITEM_INDEX_STRING)) as Int!
        self.payedPrice        = decoder.decodeDoubleForKey(ItemAttributeName.ITEM_PRICE_STRING) as Double!
        self.image        = decoder.decodeObjectForKey(ItemAttributeName.ITEM_IMAGE_STRING) as! UIImage!
        self.favorited    = decoder.decodeBoolForKey(ItemAttributeName.ITEM_FAVORITED_STRING) as Bool!
        self.isThisNew    = decoder.decodeBoolForKey(ItemAttributeName.ITEM_ISTHISNEW_STRING) as Bool!
        self.timesWorn    = decoder.decodeIntegerForKey(ItemAttributeName.ITEM_TIMESWORN_STRING) as Int!
        self.lastTimeWorn = decoder.decodeObjectForKey(ItemAttributeName.ITEM_LASTTIMEWORN_STRING) as! String!
        self.kind = decoder.decodeObjectForKey(ItemAttributeName.ITEM_KIND_STRING) as! String!
        self.size = decoder.decodeObjectForKey(ItemAttributeName.ITEM_SIZE_STRING) as! String!
        self.id    = decoder.decodeIntegerForKey(ItemAttributeName.ITEM_ID_STRING) as Int!
        
        
        //Optional
        self.datePurchased = decoder.decodeObjectForKey(ItemAttributeName.ITEM_DATEPURCHASERD_STRING) as! String!
        self.color         = decoder.decodeObjectForKey(ItemAttributeName.ITEM_COLOR_STRING) as! String!
        self.secondaryColor = decoder.decodeObjectForKey(ItemAttributeName.ITEM_SECONDARYCOLOR_STRING) as! String!
        self.thirdColor = decoder.decodeObjectForKey(ItemAttributeName.ITEM_THIRDCOLOR_STRING) as! String!
        self.dateReleased = decoder.decodeObjectForKey(ItemAttributeName.ITEM_DATERELEASED_STRING) as! String!
        self.itemNotes = decoder.decodeObjectForKey(ItemAttributeName.ITEM_ITEMNOTES_STRING) as! String!
        self.condition = decoder.decodeObjectForKey(ItemAttributeName.ITEM_CONDITION_STRING) as! String!
        self.primaryMaterial = decoder.decodeObjectForKey(ItemAttributeName.ITEM_PRIMARYMATERIAL_STRING) as! String!
        self.secondaryMaterial = decoder.decodeObjectForKey(ItemAttributeName.ITEM_SECONDAY_MATERIAL_STRING) as! String!
        self.retailPrice = decoder.decodeObjectForKey(ItemAttributeName.ITEM_RETAILPRICE_STRING) as! Double!
        self.sellerURL = decoder.decodeObjectForKey(ItemAttributeName.ITEM_STORELURL_STRING) as! String!
        self.storeLocation = decoder.decodeObjectForKey(ItemAttributeName.ITEM_STORELOCATION_STRING) as! String!
        self.sellerName = decoder.decodeObjectForKey(ItemAttributeName.ITEM_SELLERNAME_STRING) as! String!
        
        //Others
        self.path = decoder.decodeObjectForKey(ItemAttributeName.ITEM_LOCATIONPATH_STRING) as! [String: String]!
    }//Decode data in class
    func encodeWithCoder(coder: NSCoder){
        //Required
        coder.encodeObject(self.brand, forKey: ItemAttributeName.ITEM_BRAND_STRING)
        coder.encodeObject(self.model, forKey: ItemAttributeName.ITEM_MODEL_STRING)
        coder.encodeObject(self.category, forKey: ItemAttributeName.ITEM_CATEGORY_STRING)
        coder.encodeObject(self.subCategory, forKey: ItemAttributeName.ITEM_SUBCATEGORY_STRING)
        coder.encodeInteger(self.index!, forKey: ItemAttributeName.ITEM_INDEX_STRING)
        coder.encodeDouble(self.payedPrice!, forKey: ItemAttributeName.ITEM_PRICE_STRING)
        coder.encodeObject(self.image, forKey: ItemAttributeName.ITEM_IMAGE_STRING)
        coder.encodeBool(self.favorited, forKey: ItemAttributeName.ITEM_FAVORITED_STRING)
        coder.encodeBool(self.isThisNew!, forKey: ItemAttributeName.ITEM_ISTHISNEW_STRING)
        coder.encodeInteger(self.timesWorn!, forKey: ItemAttributeName.ITEM_TIMESWORN_STRING)
        coder.encodeObject(self.lastTimeWorn, forKey: ItemAttributeName.ITEM_LASTTIMEWORN_STRING)
        coder.encodeObject(self.kind, forKey: ItemAttributeName.ITEM_KIND_STRING)
        coder.encodeObject(self.size, forKey: ItemAttributeName.ITEM_SIZE_STRING)
        coder.encodeInteger(self.id, forKey: ItemAttributeName.ITEM_ID_STRING)
        //Optional
        coder.encodeObject(self.datePurchased, forKey: ItemAttributeName.ITEM_DATEPURCHASERD_STRING)
        coder.encodeObject(self.color, forKey: ItemAttributeName.ITEM_COLOR_STRING)
        coder.encodeObject(self.secondaryColor, forKey: ItemAttributeName.ITEM_SECONDARYCOLOR_STRING)
        coder.encodeObject(self.thirdColor, forKey: ItemAttributeName.ITEM_THIRDCOLOR_STRING)
        coder.encodeObject(self.dateReleased, forKey: ItemAttributeName.ITEM_DATERELEASED_STRING)
        coder.encodeObject(self.itemNotes, forKey: ItemAttributeName.ITEM_ITEMNOTES_STRING)
        coder.encodeObject(self.condition, forKey: ItemAttributeName.ITEM_CONDITION_STRING)
        coder.encodeObject(self.primaryMaterial, forKey: ItemAttributeName.ITEM_PRIMARYMATERIAL_STRING)
        coder.encodeObject(self.secondaryMaterial, forKey: ItemAttributeName.ITEM_SECONDAY_MATERIAL_STRING)
        coder.encodeObject(self.retailPrice, forKey: ItemAttributeName.ITEM_RETAILPRICE_STRING)
        coder.encodeObject(self.sellerURL, forKey: ItemAttributeName.ITEM_STORELURL_STRING)
        coder.encodeObject(self.storeLocation, forKey: ItemAttributeName.ITEM_STORELOCATION_STRING)
        coder.encodeObject(self.sellerName, forKey: ItemAttributeName.ITEM_SELLERNAME_STRING)
        
        
        coder.encodeObject(self.path, forKey: ItemAttributeName.ITEM_LOCATIONPATH_STRING)
        
        log.verbose(self.path)
    }//Encodes data in class
    ///Creates blank Item
    override init(){
        log.info(__FUNCTION__)
        
        super.init()
        log.info("Item Object Init")
        
        self.brand        = "N/A"
        
        self.model        = "N/A"
        
        self.category     = "N/A"
        
        self.subCategory  = "N/A"
        
        self.payedPrice        = UNSET_DOUBLE_VALUE
        
        self.image        = UIImage(named: BLANK_IMAGE_STRING)
        
        self.favorited    = false
        
        self.isThisNew    = false
        
        self.timesWorn    = UNSET_INT_VALUE
        
        self.lastTimeWorn = "N/A"
        
        self.kind = "N/A"
        
        self.size = "N/A"
        
        self.index        = UNSET_INT_VALUE
        
        self.id        = UNSET_INT_VALUE
        
        //Optionals
        self.datePurchased = "N/A"
        self.color        = "N/A"
        self.secondaryColor = "N/A"
        self.thirdColor = "N/A"
        self.dateReleased = "N/A"
        self.itemNotes = "N/A"
        self.condition = "N/A"
        self.primaryMaterial = "N/A"
        self.secondaryColor = "N/A"
        self.retailPrice = UNSET_DOUBLE_VALUE
        self.sellerURL = "N/A"
        self.storeLocation = "N/A"
        self.sellerName = "N/A"
        self.path = [String: String]()
    }
    ///Creates custom item
    init(make: String?, model: String?, category: String?, subCategory: String?, payedPrice: Double?,
        Image: UIImage?, favorited: Bool, isThisNew: Bool?, timesWorn: Int?, lastTImeWorn: String?,
        kind: String?, size: String, index: Int?, datePurchased: String?, color: String?){
            log.info(__FUNCTION__)
            
            super.init()
            self.brand        = make
            self.model        = model
            self.category     = category
            self.subCategory  = subCategory
            self.payedPrice        = payedPrice
            self.image        = Image
            self.favorited    = favorited
            self.isThisNew    = isThisNew
            self.timesWorn    = timesWorn
            self.lastTimeWorn = lastTImeWorn
            self.kind = kind
            self.size = size
            self.index        = index
            
            //Optionals
            self.datePurchased = datePurchased
            self.color         = color
    }
}





//MARK: -General Methods
extension Item{
    /**
     Increments timesWorn value by one
     */
    func incrementTimesWorn(){
        log.info(__FUNCTION__)
        log.info("Item times Worn incremented from: \(self.timesWorn) to: \(self.timesWorn + 1)")
        self.timesWorn = self.timesWorn + 1
    }
    /**
     Makes sure that the path is populated properly when item is created and edited
     
     - parameter closet: The String of the closet the item is located in
     */
    func populatePath(closet:String){
        log.info(__FUNCTION__)
        log.verbose("\(self.model) path is being populated")
        self.path[PathType.PATHTYPE_CLOSET_STRING] = closet
        self.path[PathType.PATHTYPE_ID_STRING] = String(self.id)
        self.path[PathType.PATHTYPE_CATEGORY_STRING] = self.category
        self.path[PathType.PATHTYPE_SUBCATEGORY_STRING] = self.subCategory
        self.path[PathType.PATHTYPE_INDEX_STRING] = String(self.index)
    }
    /**
     Removes this item reference from a dictionary list when the item is deleted or modified
     
     - parameter path: The reference to the item
     
     - returns: The dictionary
     */
    func removePathFromArrayAndGivesBackNewArray(var path: [[String: String]]) -> [[String: String]]{
        log.info(__FUNCTION__)
        log.info("removing path from array")
        for (index, arrayDic) in path.enumerate(){
            if arrayDic[PathType.PATHTYPE_ID_STRING] == String(self.id){
                path.removeAtIndex(index)
                log.info("path found and deleted")
            }
        }
        
        return path
    }
    
    func itemStory()->String{
        log.info(__FUNCTION__)
        
        let brand = self.brand ?? "N/A"
        let model = self.model ?? "N/A"
        let category = self.category ?? "N/A"
        let subCategory = self.subCategory ?? "N/A"
        let _ = self.index ?? 0
        let payedPrice = self.payedPrice ?? 0
        
        let favorited = self.favorited ?? false
        let isThisNew = self.isThisNew ?? false
        let timesWorn = self.timesWorn ?? 0
        let lastTimeWorn = self.lastTimeWorn ?? "N/A"
        let kind = self.kind ?? "N/A"
        let size = self.size ?? "N/A"
        let _ = self.id ?? 0
        //MARK: - Item Required defined values
        let _ = self.datePurchased ?? "N/A"
        let color = self.color ?? "N/A"
        let secondaryColor = self.secondaryColor ?? "N/A"
        let thirdColor = self.thirdColor ?? "N/A"
        let _ = self.dateReleased ?? "N/A"
        let itemNotes = self.itemNotes ?? "N/A"
        let condition = self.condition ?? "N/A"
        let primaryMaterial = self.primaryMaterial ?? "N/A"
        let secondaryMaterial = self.secondaryMaterial ?? "N/A"
        let retailPrice = self.retailPrice ?? 0
        let sellerURL = self.sellerURL ?? "N/A"
        let storeLocation = self.storeLocation ?? "N/A"
        let sellerName = self.sellerName ?? "N/A"
        
        let nilLike = "N/A"
        var story = String()
        
        //1
        if brand != nilLike{
            story += String(brand + "-" + model + " in \nCategory: " + category + "\nSubCategory: " + subCategory + "\n\n")
        }else{story += String(model + " in \nCategory: " + category + "\nSubCategory: " + subCategory + "\n\n")}
        
        //2
        story += String(model + " " + (favorited == true ? "is" : "is not") + " favorited, and ")
        
        if timesWorn > 0{
            story += String("item has been worn " + String(timesWorn) + " times, and ")
            
        }else{story += String("has not been worn, and ")}
        
        if lastTimeWorn != nilLike{
            story += String("last time worn " + String(lastTimeWorn.returnDaysInDate()) + " days ago, ")
        }
        
        if isThisNew == true{
            story += String(", and is a new item, ")
            
        }else{ story += String(" and is not a new item, ")}
        
        if condition == nilLike{
            story += String("and condition is unknown.")
        }else{story += String("and has a condition of: " + condition + ".\n\n")}
        
        //3
        if kind != nilLike{
            story += String(model + " " + kind + " is")
        }else{story += String(model + " is")}
        
        if size != nilLike{
            story += String(" size of: " + size)
        }
        
        if color != nilLike{
            story += String(", and " + color)
        }
        
        if secondaryColor != nilLike{
            story += String(", and " + secondaryColor)
        }
        
        if thirdColor != nilLike{
            story += String(", and " + thirdColor)
        }
        
        
        if primaryMaterial != nilLike{
            story += String(model + "Consists of " + primaryMaterial + " material")
            
            if secondaryMaterial != nilLike{
                story += String(" and" + secondaryMaterial + " material")
            }
        }
        
        story += ".\n\n"
        //4
        
        story += String(model + " details: ")
        
        
        
        if retailPrice != UNSET_DOUBLE_VALUE{
            story += String("Valued at " + String(retailPrice) + ", ")
        }
        
        if payedPrice != UNSET_DOUBLE_VALUE{
            story += String("I payed " + String(payedPrice) + ", ")
        }
        
        if sellerName != nilLike{
            story += String("purchased from: " + sellerName + ", ")
        }
        
        if sellerURL != nilLike{
            story += String("can aslo be found at the site of : " + sellerURL + ", ")
        }
        
        if storeLocation != nilLike{
            story += String("can aslo be found at the site of " + storeLocation + " ")
        }
        
        story += String(" these are some details of " + model)
        
        //5
        story += String("\n\n" + model + " notes: \n\n" + itemNotes)
        
        log.info("\(self.model) Item story created")
        
        return story
    }
    ///Sets values of items to proper values
    func setItemValuesToProperValues(){
        //        log.info(__FUNCTION__)
        var modified = false
        
        if self.brand == nil{
            self.brand = "N/A"
            modified = true
        }
        if self.model == nil{
            self.model = "N/A"
            modified = true
        }
        if self.category == nil{
            self.category = "N/A"
            modified = true
        }
        if self.subCategory == nil{
            self.subCategory = "N/A"
            modified = true
        }
        if self.index == nil{
            self.index = UNSET_INT_VALUE
            modified = true
        }
        if self.payedPrice == nil || self.payedPrice == 0{
            self.payedPrice = UNSET_DOUBLE_VALUE
            modified = true
        }
        if self.image == nil{
            self.image = UIImage(named: BLANK_IMAGE_STRING)
            modified = true
        }
        if self.favorited == nil{
            self.favorited = false
            modified = true
        }
        if self.isThisNew == nil{
            self.isThisNew = false
            modified = true
        }
        if self.timesWorn == nil || self.timesWorn == 0{
            self.timesWorn = UNSET_INT_VALUE
            modified = true
        }
        if self.lastTimeWorn == nil{
            self.lastTimeWorn = "N/A"
            modified = true
        }
        if self.kind == nil{
            self.kind = "N/A"
            modified = true
        }
        if self.size == nil{
            self.size = "N/A"
            modified = true
        }
        
        if self.id == nil{
            self.id = UNSET_INT_VALUE
            modified = true
        }
        
        
        
        
        if self.datePurchased == nil{
            self.datePurchased = "N/A"
            modified = true
        }
        if self.color == nil{
            self.color = "N/A"
            modified = true
        }
        if self.secondaryColor == nil{
            self.secondaryColor = "N/A"
            modified = true
        }
        if self.thirdColor == nil{
            self.thirdColor = "N/A"
            modified = true
        }
        if self.dateReleased == nil{
            self.dateReleased = "N/A"
            modified = true
        }
        if self.itemNotes == nil{
            self.itemNotes = "N/A"
            modified = true
        }
        if self.condition == nil{
            self.condition = "N/A"
            modified = true
        }
        if self.primaryMaterial == nil{
            self.primaryMaterial = "N/A"
            modified = true
        }
        if self.secondaryMaterial == nil{
            self.secondaryMaterial = "N/A"
            modified = true
        }
        if self.retailPrice == nil || self.retailPrice == 0{
            self.retailPrice = UNSET_DOUBLE_VALUE
            modified = true
        }
        if self.sellerURL == nil{
            self.sellerURL = "N/A"
            modified = true
        }
        if self.storeLocation == nil{
            self.storeLocation = "N/A"
            modified = true
        }
        if self.sellerName == nil{
            self.sellerName = "N/A"
            modified = true
        }
        if self.path == nil{
            self.path = [String: String]()
            modified = true
        }
        
        if modified{
            log.info(model + " was modified")
        }
    }
}



////TODO: Create equatable functions
////MARK: -Equatable-Wardrobe Extension
//extension Item: Equatable{
//     func ==(lhs: Item, rhs: Item) -> Bool{
//        return lhs.category == rhs.category
//    }
//}

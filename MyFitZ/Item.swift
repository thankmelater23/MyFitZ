//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

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
        let string = "\nbrand:\(self.brand) \nmodel:\(self.model) \ncategory:\(self.category) \nsubCategory:\(self.subCategory) \nindex:\(self.index) \npayedPrice:\(self.payedPrice) \nimage:\(self.image) \nfavorited:\(self.favorited) \nisThisNew:\(self.isThisNew) \ntimesWorn:\(self.timesWorn) \nlastTimeWorn:\(self.lastTimeWorn) \nkind:\(self.kind) \nsize:\(self.size)\nID:\(self.id)\ndatePurchased:\(self.datePurchased) \ncolor:\(self.color)\nStore Location:\(self.storeLocation) \nSeller Name:\(self.sellerName)"
        return string
    }
    
    deinit{
        print("\n\nItem: \(self.model)//\(self.brand)\nDenit")
    }
    
    //MARK: -Methods
    //MARK: -Initializers
    required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
        super.init()
        //Required
        self.brand        = decoder.decodeObjectForKey(ITEM_BRAND_STRING) as! String!
        self.model        = decoder.decodeObjectForKey(ITEM_MODEL_STRING) as! String!
        self.category     = decoder.decodeObjectForKey(ITEM_CATEGORY_STRING) as! String!
        self.subCategory  = decoder.decodeObjectForKey(ITEM_SUBCATEGORY_STRING) as! String!
        self.index        = decoder.decodeIntegerForKey((ITEM_INDEX_STRING)) as Int!
        self.payedPrice        = decoder.decodeDoubleForKey(ITEM_PRICE_STRING) as Double!
        self.image        = decoder.decodeObjectForKey(ITEM_IMAGE_STRING) as! UIImage!
        self.favorited    = decoder.decodeBoolForKey(ITEM_FAVORITED_STRING) as Bool!
        self.isThisNew    = decoder.decodeBoolForKey(ITEM_ISTHISNEW_STRING) as Bool!
        self.timesWorn    = decoder.decodeIntegerForKey(ITEM_TIMESWORN_STRING) as Int!
        self.lastTimeWorn = decoder.decodeObjectForKey(ITEM_LASTTIMEWORN_STRING) as! String!
        self.kind = decoder.decodeObjectForKey(ITEM_KIND_STRING) as! String!
        self.size = decoder.decodeObjectForKey(ITEM_SIZE_STRING) as! String!
        self.id    = decoder.decodeIntegerForKey(ITEM_ID_STRING) as Int!
        
        
        //Optional
        self.datePurchased = decoder.decodeObjectForKey(ITEM_DATEPURCHASERD_STRING) as! String!
        self.color         = decoder.decodeObjectForKey(ITEM_COLOR_STRING) as! String!
        self.secondaryColor = decoder.decodeObjectForKey(ITEM_SECONDARYCOLOR_STRING) as! String!
        self.thirdColor = decoder.decodeObjectForKey(ITEM_THIRDCOLOR_STRING) as! String!
        self.dateReleased = decoder.decodeObjectForKey(ITEM_DATERELEASED_STRING) as! String!
        self.itemNotes = decoder.decodeObjectForKey(ITEM_ITEMNOTES_STRING) as! String!
        self.condition = decoder.decodeObjectForKey(ITEM_CONDITION_STRING) as! String!
        self.primaryMaterial = decoder.decodeObjectForKey(ITEM_PRIMARYMATERIAL_STRING) as! String!
        self.secondaryMaterial = decoder.decodeObjectForKey(ITEM_SECONDAY_MATERIAL_STRING) as! String!
        self.retailPrice = decoder.decodeObjectForKey(ITEM_RETAILPRICE_STRING) as! Double!
        self.sellerURL = decoder.decodeObjectForKey(ITEM_STORELURL_STRING) as! String!
        self.storeLocation = decoder.decodeObjectForKey(ITEM_STORELOCATION_STRING) as! String!
        self.sellerName = decoder.decodeObjectForKey(ITEM_SELLERNAME_STRING) as! String!
        
        //Others
        self.path = decoder.decodeObjectForKey(ITEM_LOCATIONPATH_STRING) as! [String: String]!
    }//Decode data in class
    func encodeWithCoder(coder: NSCoder){
        
        //Required
        coder.encodeObject(self.brand, forKey: ITEM_BRAND_STRING)
        coder.encodeObject(self.model, forKey: ITEM_MODEL_STRING)
        coder.encodeObject(self.category, forKey: ITEM_CATEGORY_STRING)
        coder.encodeObject(self.subCategory, forKey: ITEM_SUBCATEGORY_STRING)
        coder.encodeInteger(self.index!, forKey: ITEM_INDEX_STRING)
        coder.encodeDouble(self.payedPrice!, forKey: ITEM_PRICE_STRING)
        coder.encodeObject(self.image, forKey: ITEM_IMAGE_STRING)
        coder.encodeBool(self.favorited, forKey: ITEM_FAVORITED_STRING)
        coder.encodeBool(self.isThisNew!, forKey: ITEM_ISTHISNEW_STRING)
        coder.encodeInteger(self.timesWorn!, forKey: ITEM_TIMESWORN_STRING)
        coder.encodeObject(self.lastTimeWorn, forKey: ITEM_LASTTIMEWORN_STRING)
        coder.encodeObject(self.kind, forKey: ITEM_KIND_STRING)
        coder.encodeObject(self.size, forKey: ITEM_SIZE_STRING)
        coder.encodeInteger(self.id, forKey: ITEM_ID_STRING)
        //Optional
        coder.encodeObject(self.datePurchased, forKey: ITEM_DATEPURCHASERD_STRING)
        coder.encodeObject(self.color, forKey: ITEM_COLOR_STRING)
        coder.encodeObject(self.secondaryColor, forKey: ITEM_SECONDARYCOLOR_STRING)
        coder.encodeObject(self.thirdColor, forKey: ITEM_THIRDCOLOR_STRING)
        coder.encodeObject(self.dateReleased, forKey: ITEM_DATERELEASED_STRING)
        coder.encodeObject(self.itemNotes, forKey: ITEM_ITEMNOTES_STRING)
        coder.encodeObject(self.condition, forKey: ITEM_CONDITION_STRING)
        coder.encodeObject(self.primaryMaterial, forKey: ITEM_PRIMARYMATERIAL_STRING)
        coder.encodeObject(self.secondaryMaterial, forKey: ITEM_SECONDAY_MATERIAL_STRING)
        coder.encodeObject(self.retailPrice, forKey: ITEM_RETAILPRICE_STRING)
        coder.encodeObject(self.sellerURL, forKey: ITEM_STORELURL_STRING)
        coder.encodeObject(self.storeLocation, forKey: ITEM_STORELOCATION_STRING)
        coder.encodeObject(self.sellerName, forKey: ITEM_SELLERNAME_STRING)
        
        
        coder.encodeObject(self.path, forKey: ITEM_LOCATIONPATH_STRING)
        
        print(self.path)
    }//Encodes data in class
    ///Creates blank Item
    override init(){
        super.init()
        
        self.brand        = "N/A"
        
        self.model        = "N/A"
        
        self.category     = "N/A"
        
        self.subCategory  = "N/A"
        
        self.payedPrice        = NSNumber().doubleValue
        
        self.image        = UIImage(named: BLANK_IMAGE_STRING)
        
        self.favorited    = false
        
        self.isThisNew    = Bool()
        
        self.timesWorn    = NSNumber().integerValue
        
        self.lastTimeWorn = "N/A"
        
        self.kind = "N/A"
        
        self.size = "N/A"
        
        self.index        = NSNumber().integerValue
        
        self.id        = NSNumber().integerValue
        
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
        self.retailPrice = Double()
        self.sellerURL = "N/A"
        self.storeLocation = "N/A"
        self.sellerName = "N/A"
        self.path = [String: String]()
    }
    ///Creates custom item
    init(make: String?, model: String?, category: String?, subCategory: String?, payedPrice: Double?,
        Image: UIImage?, favorited: Bool, isThisNew: Bool?, timesWorn: Int?, lastTImeWorn: String?,
        kind: String?, size: String, index: Int?, datePurchased: String?, color: String?){
            
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
        self.timesWorn = self.timesWorn + 1
    }
    /**
     Makes sure that the path is populated properly when item is created and edited
     
     - parameter closet: The String of the closet the item is located in
     */
    func populatePath(closet:String){
        self.path[PATHTYPE_CLOSET_STRING] = closet
        self.path[PATHTYPE_ID_STRING] = String(self.id)
        self.path[PATHTYPE_CATEGORY_STRING] = self.category
        self.path[PATHTYPE_SUBCATEGORY_STRING] = self.subCategory
        self.path[PATHTYPE_INDEX_STRING] = String(self.index)
    }
    /**
     Removes this item reference from a dictionary list when the item is deleted or modified
     
     - parameter path: The reference to the item
     
     - returns: The dictionary
     */
    func removePathFromArrayAndGivesBackNewArray(var path: [[String: String]]) -> [[String: String]]{
        
        for (index, arrayDic) in path.enumerate(){
            if arrayDic[PATHTYPE_ID_STRING] == String(self.id){
                path.removeAtIndex(index)
            }
        }
        
        return path
    }
}



////TODO: Create equatable functions
////MARK: -Equatable-Wardrobe Extension
//extension Item: Equatable{
//     func ==(lhs: Item, rhs: Item) -> Bool{
//        return lhs.category == rhs.category
//    }
//}

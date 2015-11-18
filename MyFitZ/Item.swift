//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit


///Holds all the information to an item
class Item: NSObject, NSCoding{
  ///MARK: - Item Required defined values
  //Item info
    var brand: String!, model: String!
    var category: String!, subCategory : String!, index : Int!
    var price: Double!
    var image: UIImage!
    var favorited: Bool! = false
    var isThisNew: Bool! = true
    var timesWorn: Int!
    var lastTimeWorn: String!
    

    //MARK: - Item Required defined values
    var datePurchased: String!
    var color: String!
    var secondaryColor: String!
    var thirdColor: String!
    var dateReleased: String!
    var itemDescription: String!
    var condition: String!
    var primaryMaterial: String!
    var secondaryMaterial: String!
    var retailPrice: Double!
    var storeLocationURL: String!
//    var arrayOfImages: [UIImages]
//  var numberOfDifferentFitsWornWith
    
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()

    override var description: String {
      let string = "\nbrand:\(self.brand) \nmodel:\(self.model) \ncategory:\(self.category) \nsubCategory:\(self.subCategory) \nindex:\(self.index) \nprice:\(self.price)? \nimage:\(self.image) \nfavorited:\(self.favorited) \nisThisNew:\(self.isThisNew) \ntimesWorn:\(self.timesWorn) \nlastTimeWorn:\(self.lastTimeWorn) \ndatePurchased:\(self.datePurchased) \ncolor:\(self.color)"
      return string
    }

  //NSCoding methods
  required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
    super.init()
    //Required
    self.brand        = decoder.decodeObjectForKey(ITEM_BRAND_STRING) as! String!
    self.model        = decoder.decodeObjectForKey(ITEM_MODEL_STRING) as! String!
    self.category     = decoder.decodeObjectForKey(ITEM_CATEGORY_STRING) as! String!
    self.subCategory  = decoder.decodeObjectForKey(ITEM_SUBCATEGORY_STRING) as! String!
    self.index        = decoder.decodeIntegerForKey((ITEM_INDEX_STRING)) as Int!
    self.price        = decoder.decodeDoubleForKey(ITEM_PRICE_STRING) as Double!
    self.image        = decoder.decodeObjectForKey(ITEM_IMAGE_STRING) as! UIImage!
    self.favorited    = decoder.decodeBoolForKey(ITEM_FAVORITED_STRING) as Bool!
    self.isThisNew    = decoder.decodeBoolForKey(ITEM_ISTHISNEW_STRING) as Bool!
    self.timesWorn    = decoder.decodeIntegerForKey(ITEM_TIMESWORN_STRING) as Int!
    self.lastTimeWorn = decoder.decodeObjectForKey(ITEM_LASTTIMEWORN_STRING) as! String!

    //Optional
    self.datePurchased = decoder.decodeObjectForKey(ITEM_DATEPURCHASERD_STRING) as! String!
    self.color         = decoder.decodeObjectForKey(ITEM_COLOR_STRING) as! String!
    self.secondaryColor = decoder.decodeObjectForKey(ITEM_SECONDARYCOLOR_STRING) as! String!
    self.thirdColor = decoder.decodeObjectForKey(ITEM_THIRDCOLOR_STRING) as! String!
    self.dateReleased = decoder.decodeObjectForKey(ITEM_DATERELEASED_STRING) as! String!
    self.itemDescription = decoder.decodeObjectForKey(ITEM_ITEMDESCRIPTION_STRING) as! String!
    self.condition = decoder.decodeObjectForKey(ITEM_CONDITION_STRING) as! String!
    self.primaryMaterial = decoder.decodeObjectForKey(ITEM_PRIMARYMATERIAL_STRING) as! String!
    self.secondaryMaterial = decoder.decodeObjectForKey(ITEM_SECONDAY_MATERIAL_STRING) as! String!
    self.retailPrice = decoder.decodeObjectForKey(ITEM_RETAILPRICE_STRING) as! Double!
    self.storeLocationURL = decoder.decodeObjectForKey(ITEM_STORELOCATION_STRING) as! String!

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
    coder.encodeDouble(self.price!, forKey: ITEM_PRICE_STRING)
    coder.encodeObject(self.image, forKey: ITEM_IMAGE_STRING)
    coder.encodeBool(self.favorited, forKey: ITEM_FAVORITED_STRING)
    coder.encodeBool(self.isThisNew!, forKey: ITEM_ISTHISNEW_STRING)
    coder.encodeInteger(self.timesWorn!, forKey: ITEM_TIMESWORN_STRING)
    coder.encodeObject(self.lastTimeWorn, forKey: ITEM_LASTTIMEWORN_STRING)


    //Optional
    coder.encodeObject(self.datePurchased, forKey: ITEM_DATEPURCHASERD_STRING)
    coder.encodeObject(self.color, forKey: ITEM_COLOR_STRING)
    coder.encodeObject(self.secondaryColor, forKey: ITEM_SECONDARYCOLOR_STRING)
    coder.encodeObject(self.thirdColor, forKey: ITEM_THIRDCOLOR_STRING)
    coder.encodeObject(self.dateReleased, forKey: ITEM_DATERELEASED_STRING)
    coder.encodeObject(self.itemDescription, forKey: ITEM_ITEMDESCRIPTION_STRING)
    coder.encodeObject(self.condition, forKey: ITEM_CONDITION_STRING)
    coder.encodeObject(self.primaryMaterial, forKey: ITEM_PRIMARYMATERIAL_STRING)
    coder.encodeObject(self.secondaryMaterial, forKey: ITEM_SECONDAY_MATERIAL_STRING)
    coder.encodeObject(self.retailPrice, forKey: ITEM_RETAILPRICE_STRING)
    coder.encodeObject(self.storeLocationURL, forKey: ITEM_STORELOCATION_STRING)
    

    coder.encodeObject(self.path, forKey: ITEM_LOCATIONPATH_STRING)
  }//Encodes data in class

  ///Creates blank Item
  override init(){
    super.init()
    //TODO: - Set all initilizars to just initialized no values store

    self.brand         = String()

    self.model        = String()

    self.category     = String()

    self.subCategory  = String()

    self.price        = NSNumber().doubleValue

    self.image        = UIImage(named: BLANK_IMAGE_STRING)

    self.favorited    = false

    self.isThisNew    = Bool()

    self.timesWorn    = NSNumber().integerValue

    self.lastTimeWorn = String()

    self.index        = NSNumber().integerValue

    //Optionals
    self.datePurchased = String()
    self.color        = String()
    self.secondaryColor = String()
    self.thirdColor = String()
    self.dateReleased = String()
    self.itemDescription = String()
    self.condition = String()
    self.primaryMaterial = String()
    self.secondaryColor = String()
    self.retailPrice = Double()
    self.storeLocationURL = String()

    self.path = [String: String]()
  }
  ///Creates custom item
  init(make: String?, model: String?, category: String?, subCategory: String?, price: Double?,
    Image: UIImage?, favorited: Bool, isThisNew: Bool?, timesWorn: Int?, lastTImeWorn: String?,
    index: Int?, datePurchased: String?, color: String?){

        super.init()
      self.brand        = make
      self.model        = model
      self.category     = category
      self.subCategory  = subCategory
      self.price        = price
      self.image      = Image
      self.favorited    = favorited
      self.isThisNew    = isThisNew
      self.timesWorn    = timesWorn
      self.lastTimeWorn = lastTImeWorn
      self.index        = index

      //Optionals
      self.datePurchased = datePurchased
      self.color         = color
        
        
  }
}


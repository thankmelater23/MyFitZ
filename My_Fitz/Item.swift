//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation



///Holds all the information to an item
class Item: NSObject, NSCoding, Printable{
  //MARK: - Category enum
  ///Enum for category
  //  enum category
  //  {
  //    case shoes
  //    case shirt
  //    case pants
  //    case accessories
  //    case jewelry
  //    case underclothes
  //    //TODO: - Set up system to deal with and use category enum__Also not encodod
  //  }


  ///MARK: - Item Required defined values
  //Item info
  var brand: String!, model: String!
  var category: String!, subCategory : String!, index : Int!
  var price: String!
  var imageName: String!
  var favorited: String!//Bool = false
  var isThisNew: String!//Bool!
  var timesWorn: Int!
  var lastTimeWorn: Int!


  //MARK: - Item Required defined values
  var datePurchased: Int!
  var color: String!
  //var dateReleased
  //var retailPrice
  //var condition
  //var material
  //var storeLocationOrSitePurchasedFrom
  //var arrayOfImages
  //var numberOfDifferentFitsWornWith
  ///Dictionary path to item
  var path: [String: String] = [String: String]()

  //MARK: - Dictionaries
  ///Holds the required information from the item that is meant to be passed on two other dictionaries
  var requiredDictionary = [String: String]()
  ///Holds the optional information from the item that is meant to be passed on two other dictionaries
  var optionalDictionary = [String: String]()

  //  override var description: String {
  //    //TODO: - When I get time implement this
  //    ///Holds required/optional dic info and other vars
  //    var dictionaryOfSets: [String: [String]]
  //    return "MyClassInstance.name"
  //  }

  //NSCoding methods
  required init(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
    super.init()
    //Required
    self.brand         = decoder.decodeObjectForKey(ITEM_BRAND_STRING) as! String!
    self.model        = decoder.decodeObjectForKey(ITEM_MODEL_STRING) as! String!
    self.category     = decoder.decodeObjectForKey(ITEM_CATEGORY_STRING) as! String!
    self.subCategory  = decoder.decodeObjectForKey(ITEM_SUBCATEGORY_STRING) as! String!
    self.index        = decoder.decodeIntegerForKey((ITEM_INDEX_STRING)) as Int!
    self.price        = decoder.decodeObjectForKey(ITEM_PRICE_STRING) as! String!
    self.imageName    = decoder.decodeObjectForKey(ITEM_IMAGENAME_STRING) as! String!
    self.favorited    = decoder.decodeObjectForKey(ITEM_FAVORITED_STRING) as! String!
    self.isThisNew    = decoder.decodeObjectForKey(ITEM_ISTHISNEW_STRING) as! String!
    self.timesWorn    = decoder.decodeIntegerForKey(ITEM_TIMESWORN_STRING) as Int!
    self.lastTimeWorn = decoder.decodeIntegerForKey(ITEM_LASTTIMEWORN_STRING) as Int!



    //Optional
    self.datePurchased = decoder.decodeIntegerForKey(ITEM_DATEPURCHASERD_STRING) as Int!
    self.color = decoder.decodeObjectForKey(ITEM_COLOR_STRING) as! String!


    self.path = decoder.decodeObjectForKey(ITEM_LOCATIONPATH_STRING) as! [String: String]!

    self.requiredDictionary = decoder.decodeObjectForKey(ITEM_REQUIREDDICTIONARY_STRING) as! [String: String]!
    self.optionalDictionary = decoder.decodeObjectForKey(ITEM_OPTIONALDICTIONARY_STRING) as! [String: String]!

  }//Decode data in class
  func encodeWithCoder(coder: NSCoder){

    //Required
    coder.encodeObject(self.brand, forKey: ITEM_BRAND_STRING)
    coder.encodeObject(self.model, forKey: ITEM_MODEL_STRING)
    coder.encodeObject(self.category, forKey: ITEM_CATEGORY_STRING)
    coder.encodeObject(self.subCategory, forKey: ITEM_SUBCATEGORY_STRING)
    coder.encodeInteger(self.index, forKey: ITEM_INDEX_STRING)
    coder.encodeObject(self.price, forKey: ITEM_PRICE_STRING)
    coder.encodeObject(self.imageName, forKey: ITEM_IMAGENAME_STRING)
    coder.encodeObject(self.favorited, forKey: ITEM_FAVORITED_STRING)
    coder.encodeObject(self.isThisNew, forKey: ITEM_ISTHISNEW_STRING)
    coder.encodeInteger(self.timesWorn, forKey: ITEM_TIMESWORN_STRING)
    coder.encodeInteger(self.lastTimeWorn, forKey: ITEM_LASTTIMEWORN_STRING)

    //Optional
    coder.encodeInteger(self.datePurchased, forKey: ITEM_DATEPURCHASERD_STRING)
    coder.encodeObject(self.color, forKey: ITEM_COLOR_STRING)

    coder.encodeObject(self.path, forKey: ITEM_LOCATIONPATH_STRING)

    coder.encodeObject(self.requiredDictionary, forKey: ITEM_REQUIREDDICTIONARY_STRING)
    coder.encodeObject(self.optionalDictionary, forKey: ITEM_OPTIONALDICTIONARY_STRING)



  }//Encodes data in class

  ///Creates blank Item
  override init(){
    super.init()

    self.brand         = " "

    self.model        = "  "

    self.category     = " "

    self.subCategory  = " "

    self.price        = " "

    self.imageName    = " "

    self.favorited    = "false"

    self.isThisNew    = "true"

    self.timesWorn    = 0

    self.lastTimeWorn = 0

    self.index        = 0

    //Optionals
    self.datePurchased = 0
    self.color        = "red"

    self.path = [String: String]()

    self.populateDictionariesToItemInstanceVariables()


  }
  ///Creates custom item
  init(make: String, model: String, category: String, subCategory: String, price: String,
    ImageName: String, favorited: String, isThisNew: String, timesWorn: Int, lastTImeWorn: Int,
    index: Int, datePurchased: Int, color: String){
      super.init()

      self.brand        = make
      self.model        = model
      self.category     = category
      self.subCategory  = subCategory
      self.price        = price
      self.imageName    = ImageName
      self.favorited    = favorited
      self.isThisNew    = isThisNew
      self.timesWorn    = timesWorn
      self.lastTimeWorn = lastTImeWorn
      self.index        = index

      //Optionals
      self.datePurchased = datePurchased
      self.color         = color

      self.populateDictionariesToItemInstanceVariables()


  }
}

extension Item{
  ///Takes a 2 dictionaries and assign those dictionary values to item's class variables to create a new item
  func setUpItemInfoThroughDictionaries(#requiredDic: [String: String], optionalDic: [String: String]?){

    //Required variables
    //Strings
    self.brand       = requiredDic[ITEM_BRAND_STRING]
    self.model       = requiredDic[ITEM_MODEL_STRING]
    self.category    = requiredDic[ITEM_CATEGORY_STRING]
    self.subCategory = requiredDic[ITEM_SUBCATEGORY_STRING]
    self.price       = requiredDic[ITEM_PRICE_STRING]
    self.imageName   = requiredDic[ITEM_IMAGENAME_STRING]

    //Bools
    self.favorited   = requiredDic[ITEM_FAVORITED_STRING]
    self.isThisNew   = requiredDic[ITEM_ISTHISNEW_STRING]
    //Ints/Doubles
    self.timesWorn    = NSNumberFormatter().numberFromString((requiredDic[ITEM_TIMESWORN_STRING])!)?.integerValue
    self.lastTimeWorn = NSNumberFormatter().numberFromString((requiredDic[ITEM_LASTTIMEWORN_STRING])!)?.integerValue
    self.index        = NSNumberFormatter().numberFromString((requiredDic[ITEM_INDEX_STRING])!)?.integerValue



    //Optional Variable
    self.datePurchased = NSNumberFormatter().numberFromString((optionalDic?[ITEM_DATEPURCHASERD_STRING])!)?.integerValue
    self.color         = requiredDictionary[ITEM_COLOR_STRING]
  }
  ///Assigns item variables values to required and optional dictionary keys
  func populateDictionariesToItemInstanceVariables(){
    //Required variables
    //Strings
    requiredDictionary["brand"]        = self.brand
    requiredDictionary["model"]        = self.model
    requiredDictionary["category"]     = self.category
    requiredDictionary["subCategory"]  = self.subCategory
    requiredDictionary["price"]        = self.price
    requiredDictionary["imageName"]    = self.imageName
    //Bools
    requiredDictionary["favorited"]    = self.favorited
    requiredDictionary["isThisNew"]    = self.isThisNew
    //Ints/Doubles
    requiredDictionary["timesWorn"]    = "\(self.timesWorn)"
    requiredDictionary["lastTimeWorn"] = "\(self.lastTimeWorn)"
    requiredDictionary["index"]        = "\(self.index)"



    //Optional Variables
    optionalDictionary["datePurchased"] = "\(self.datePurchased)"
    optionalDictionary["color"] = self.color

  }
  func setItem(#brand: String, model: String, category: String, subCategory: String, price: String,
    ImageName: String,  favorited: String, IsThisNew: String, timesWorn: Int,
    lastTimeWorn: Int, index: Int, datePurchased: Int, color: String){
      //Strings
      self.brand         = brand
      self.model         = model
      self.category      = category
      self.subCategory   = subCategory
      self.price         = price
      self.imageName     = ImageName
      //Bools
      self.favorited     = favorited
      self.isThisNew     = IsThisNew
      //Ints/Doubles
      self.timesWorn     = timesWorn
      self.lastTimeWorn  = lastTimeWorn
      self.index         = index
      
      
      //Optionals
      self.datePurchased = datePurchased
      self.color         = color
      
      self.populateDictionariesToItemInstanceVariables()
  }
  
}





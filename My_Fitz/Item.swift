//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation



///Holds all the information to an item
class Item{
  //MARK: - Category enum
  ///Enum for category
  enum category
  {
    case shoes
    case shirt
    case pants
    case accessories
    case jewelry
    case underclothes
    //TODO: - Set up system to deal with and use category enum
  }


  ///MARK: - Item Required defined values
  //Item info
  var make: String!, model: String!
  var category : String!, subCategory : String!, index : Int!
  var price: String!
  var favorited: Bool = false
  var imageName: String!
  var timesWorn: Int! = 0
  var lastTimeWorn: Double?
  var isThisNew: Bool!

  //MARK: - Item Required defined values
  var datePurchased: Int!
  //var colors
  //var dateReleased
  //var retailPrice
  //var condition
  //var material
  //var storeLocationOrSitePurchasedFrom
  //var arrayOfImages
  //var numberOfDifferentFitsWornWith

  //MARK: - Dictionaries
  ///Holds the required information from the item that is meant to be passed on two other dictionaries
  var requiredDictionary = [String: String]()
  ///Holds the optional information from the item that is meant to be passed on two other dictionaries
  var optionalDictionary = [String: String]()

  ///Creates blank Item
  init(){

    self.make = ""

    self.model = ""

    self.category = ""

    self.subCategory = ""

    self.price = ""

    self.imageName = ""

    self.timesWorn = 0

    self.favorited = false
    
  }
  ///Creates custom item
  init(make: String, model: String, price: String,  ImageName: String, category: String, subCategory: String){
    self.make = make
    self.model = model
    self.category = category
    self.subCategory = subCategory
    self.price = price
    self.imageName = ImageName
    self.timesWorn = 0
    self.favorited = false
  }
}

extension Item{
  //TODO: - Figure out how to convert Key String values as Bool's and Int's to assign to type
  ///Takes a 2 dictionaries and assign those dictionary values to item's class variables to create a new item
  func setUpItemInfoThroughDictionaries(#requiredDic: [String: String], optionalDic: [String: String]?){
    //Required variables
    self.make         = requiredDic["make"]
    self.category     = requiredDic["category"]
    self.subCategory  = requiredDic["subCategory"]
    self.index        = 0//Int(requiredDic["subCategory"])
    self.favorited    = true//"\(requiredDic["favorited"])"
    self.imageName    = requiredDic["imageName"]
    self.timesWorn    = 0//"/(requiredDic["timesWorn"])"
    self.lastTimeWorn = 0//"/(requiredDic["lastTimeWorn"])"
    self.isThisNew    = true//"/(requiredDic["isThisNew"])"

    //Optional Variable
    self.datePurchased = 0//(requiredDic["datePurchased"] as! NSNumber).integerValue
  }

  func setUpClassInfoDictionaries(){
    //Required variables
    requiredDictionary["make"]        = self.make
    requiredDictionary["category"]    = self.category
    requiredDictionary["subCategory"] = self.subCategory
    requiredDictionary["blank"]       = "\(self.index)"
    requiredDictionary["blank"]       = "\(self.favorited)"
    requiredDictionary["imageName"]   = "\(self.imageName)"
    requiredDictionary["blank"]       = "\(self.timesWorn)"
    requiredDictionary["blank"]       = "\(self.lastTimeWorn)"
    requiredDictionary["blank"]       = "\(self.isThisNew)"

    //Optional Variables
    optionalDictionary["datePurchased"] = "\(self.datePurchased)"
  }
  func makeItem(#make: String, model: String, price: String,  ImageName: String, category: String, subCategory: String){
    self.make = make
    self.model = model
    self.category = category
    self.subCategory = subCategory
    self.price = price
    self.imageName = ImageName
    self.timesWorn = 0
    self.favorited = false
    self.timesWorn = 0
    self.lastTimeWorn = 0
    self.isThisNew = true
  }
}

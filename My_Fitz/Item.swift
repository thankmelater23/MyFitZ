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
  var imageName: String!
  var favorited: String!//Bool = false
  var isThisNew: String!//Bool!
  var timesWorn: Int! = 0
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

  //MARK: - Dictionaries
  ///Holds the required information from the item that is meant to be passed on two other dictionaries
  var requiredDictionary = [String: String]()
  ///Holds the optional information from the item that is meant to be passed on two other dictionaries
  var optionalDictionary = [String: String]()

  ///Creates blank Item
  init(){

    self.make         = ""

    self.model        = ""

    self.category     = ""

    self.subCategory  = ""

    self.price        = " "

    self.imageName    = ""

    self.favorited    = "false"

    self.isThisNew    = "true"

    self.timesWorn    = 0

    self.lastTimeWorn = 0

    self.index        = 0

    //Optionals
    self.datePurchased = 0
    self.color        = "red"

  }
  ///Creates custom item
  init(make: String, model: String, price: String,  ImageName: String, category: String, subCategory: String){
    self.make = make
    self.model = model
    self.category = category
    self.subCategory = subCategory
    self.price = price
    self.imageName = ImageName
    self.favorited = "false"
    self.isThisNew = "true"
    self.timesWorn = 0
    self.lastTimeWorn = 0
    self.index = 0

    //Optionals
    self.datePurchased = 0
    self.color        = "red"

  }
}

extension Item{
  ///Takes a 2 dictionaries and assign those dictionary values to item's class variables to create a new item
  func setUpItemInfoThroughDictionaries(#requiredDic: [String: String], optionalDic: [String: String]?){
    //Required variables
    //Strings
    self.make        = requiredDic["make"]
    self.model       = requiredDic["model"]
    self.category    = requiredDic["category"]
    self.subCategory = requiredDic["subCategory"]
    self.price       = requiredDic["price"]
    self.imageName   = requiredDic["imageName"]

    //Bools
    self.favorited   = requiredDic["favorited"]
    self.isThisNew   = requiredDic["isThisNew"]
    //Ints/Doubles
    self.timesWorn    = NSNumberFormatter().numberFromString((requiredDic["timesWorn"])!)?.integerValue
    self.lastTimeWorn = NSNumberFormatter().numberFromString((requiredDic["lastTimeWorn"])!)?.integerValue
    self.index        = NSNumberFormatter().numberFromString((requiredDic["index"])!)?.integerValue



    //Optional Variable
    self.datePurchased = NSNumberFormatter().numberFromString((optionalDic?["datePurchased"])!)?.integerValue
    self.color         = requiredDictionary["color"]
  }
  ///Assigns item variables values to required and optional dictionary keys
  func setUpClassInfoDictionaries(){
    //Required variables
    //Strings
    requiredDictionary["make"]         = self.make
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
  func makeItem(#make: String, model: String, price: String,  ImageName: String, category: String, subCategory: String){
    //Strings
    self.make         = make
    self.model        = model
    self.category     = category
    self.subCategory  = subCategory
    self.price        = price
    self.imageName    = ImageName
    //Bools
    self.favorited    = "false"
    self.isThisNew    = "true"
    //Ints/Doubles
    self.timesWorn    = 0
    self.lastTimeWorn = 0
    self.index        = 0


    //Optionals
    self.datePurchased = 0
    self.color        = "red"
  }
}









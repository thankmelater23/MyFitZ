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
  var datePurchased: NSDate!
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
  var requiredDictionary = [String, String]()
  ///Holds the optional information from the item that is meant to be passed on two other dictionaries
  let optionalDictionary = [String, String]()


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
  //TODO: - Retruns self needs to be set up to create and make a new item
  func createItem(requiredDic: [String: String], optionalDic: [String: String]?) -> Item{
    return self
  }
  func makeItem(make: String, model: String, price: String,  ImageName: String, category: String, subCategory: String){
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

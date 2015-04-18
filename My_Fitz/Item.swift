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
  var make: String!
  var model: String!
  var category : String!
  var subCategory : String!
  var index : Int!
  var price: String!
  var favorited: Bool = false
  var imageName: String!
  var timesWorn: Int! = 0
  var lastTimeWorn: Double?
  var arrayOfItemImages : [AnyObject] = []//Suppose to be UIImages
  var isThisNew: Bool!

  ///MARK: - Item Required defined values
  var datePurchased: NSDate!
  //var colors
  //var dateReleased
  //var retailPrice
  //var condition
  //var material
  //var storeLocationOrSitePurchasedFrom
  //var arrayOfImages
  //var numberOfDifferentFitsWornWith


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

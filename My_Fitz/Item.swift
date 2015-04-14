//
//  Item.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation

class Item{
  //Item info
  var make: String!
  var model: String!
  var price: String!
  var imageName: String!
  var arrayOfItemImages : [AnyObject] = []//Suppose to be UIImages

  //Item Section
  var category : String!
  var subCategory : String!

  //Item interactions
  var timesWorn: Int! = 0
  var lastTimeWorn: Double?
  var datePurchased: NSDate!
  var favorited: Bool = false


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

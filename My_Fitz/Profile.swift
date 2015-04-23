//Profile
//  Profile.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

class Profile{
  var categoryDics: [String:  [String:  [Item]]] //=  [String,  [String, [Item]]]()

  var selectionStringPlaceHolder: String?
  var makeStringPlaceHolder: String?
  var modelArrayIndexHolder: Int?

  var shoesDic                  = [String: [Item]]()
  var shirtDic                  = [String: [Item]]()
  var pantssDic                 = [String: [Item]]()
  var underClothesDic           = [String: [Item]]()
  var accessoriesDic            = [String: [Item]]()
  var jewelsDic                 = [String: [Item]]()


  var shoesArray: [Item]        = []
  var nikeArray: [Item]         = []
  var slipperArray: [Item]      = []
  var shirtArray: [Item]        = []
  var pantsArray: [Item]        = []
  var underclothesArray: [Item] = []
  var accessoriesArray: [Item]  = []
  var jewelryArray: [Item]      = []

  init(){
    //Array initialization
    shoesArray.append     (Item(make: "Jordans" , model: "13's", category: "Shoes", subCategory: "Jordans", price: "200", ImageName: "13's",
                           favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    shoesArray.append     (Item(make: "Jordans" , model: "8's", category: "Shoes", subCategory: "Jordans", price: "200", ImageName: "8's",
                           favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    nikeArray.append       (Item (make: "Nike" , model: "Blue Nikes", category: "Shoes", subCategory: "Nike's", price: "80", ImageName: "13's",
                           favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    slipperArray.append    (Item(make: "Slippers" , model: "Red Slippers", category: "Shoes", subCategory: "Slippers", price: "40",
                            ImageName: "Nike BlueWhite", favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0,
                            datePurchased: 0, color: "No"))
    shirtArray.append      (Item(make: "Shirt" , model: "18's", category: "Shirts", subCategory: "T-Shirts", price: "20", ImageName: "Shirt",
                           favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    pantsArray.append      (Item(make: "Pants" , model: "18's",category: "Pants", subCategory: "Jeans", price: "60", ImageName: "Pants",
                           favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    underclothesArray.append(Item(make: "Socks" , model: "18's", category: "UnderClothes", subCategory: "Socks", price: "20", ImageName: "Socks",
                            favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    jewelryArray.append    (Item(make: "Gold" , model: "Rolly", category: "Jewelry", subCategory: "Gold", price: "600", ImageName: "Chain",
                            favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
    accessoriesArray.append (Item(make: "Star Earing" , model: "18's", category: "Accessories", subCategory: "EarRings", price: "20", ImageName: "Earrings",
                            favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))

    shoesDic                      = ["Jordans" : shoesArray, "Nike": nikeArray, "Slipper": slipperArray]
    shirtDic                      = ["Polo" : shirtArray]
    pantssDic                     = ["Sean John" : pantsArray]
    underClothesDic               = ["Socks" : underclothesArray]
    jewelsDic                     = ["Gold" : jewelryArray]
    accessoriesDic                = ["Rolex" : accessoriesArray]

    categoryDics = ["Shirt": shirtDic,  "Pants": pantssDic,  "Shoes": shoesDic,
    "Underclothes": underClothesDic, "Jewelry": jewelsDic,"Accessories": accessoriesDic] as Dictionary
  }

}


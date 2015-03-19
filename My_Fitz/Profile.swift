//Profile
//  Profile.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

class Profile
{
  var categoryDics: [String:  [String:  [Item]]] //=  [String,  [String, [Item]]]()

  var selectionStringPlaceHolder: String?
  var makeStringPlaceHolder: String?
  var modelArrayIndexHolder: Int?

  var shoesDic = [String: [Item]]()
  var shirtDic = [String: [Item]]()
  var pantssDic = [String: [Item]]()
  var underClothesDic = [String: [Item]]()
  var accessoriesDic = [String: [Item]]()
  var jewelsDic = [String: [Item]]()


  var shoesArray: [Item] = []
  var nikeArray: [Item] = []
  var slipperArray: [Item] = []
  var shirtArray: [Item] = []
  var pantsArray: [Item] = []
  var underclothesArray: [Item] = []
  var accessoriesArray: [Item] = []
  var jewelryArray: [Item] = []

  init()
  {


    //Array initialization
    shoesArray.append(Item(make: "Jordans" , model: "13's", price: "200", ImageName: "13's", category: "Shoes", subCategory: "Jordans"))
    shoesArray.append(Item(make: "Jordans" , model: "18's", price: "200", ImageName: "18's", category: "Shoes", subCategory: "Jordans"))
    nikeArray.append(Item(make: "Nike" , model: "Blue Nikes", price: "60", ImageName: "Nike BlueWhite", category: "Shoes", subCategory: "Nike's"))
    slipperArray.append(Item(make: "Slippers" , model: "Red Slippers", price: "40", ImageName: "Slippers", category: "Shoes", subCategory: "Slippers"))
    shirtArray.append(Item(make: "Shirt" , model: "18's", price: "200", ImageName: "Shirt", category: "Shirts", subCategory: "T-Shirts"))
    pantsArray.append(Item(make: "Pants" , model: "18's", price: "200", ImageName: "Pants", category: "Pants", subCategory: "Jeans"))
    underclothesArray.append(Item(make: "Socks" , model: "18's", price: "200", ImageName: "Socks", category: "UnderClothes", subCategory: "Socks"))
    accessoriesArray.append(Item(make: "Star Earing" , model: "18's", price: "200", ImageName: "Earrings", category: "Accessories", subCategory: "EarRings"))
    jewelryArray.append(Item(make: "Gold" , model: "Rolly", price: "600", ImageName: "Chain", category: "Jewelry", subCategory: "Gold"))

    shoesDic                    = ["Jordans" : shoesArray, "Nike": nikeArray, "Slipper": slipperArray]
    shirtDic                       = ["Polo" : shirtArray]
    pantssDic                   = ["Sean John" : pantsArray]
    underClothesDic     = ["Socks" : underclothesArray]
    accessoriesDic         = ["Rolex" : accessoriesArray]
    jewelsDic                    = ["Gold" : jewelryArray]


    categoryDics = ["Shirt": shirtDic,  "Pants": pantssDic,  "Shoes": shoesDic,  "Accessories": accessoriesDic,  "Underclothes": underClothesDic,  "Jewelry": jewelsDic] as Dictionary
  }

}


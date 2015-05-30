//Profile
//  Profile.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

//import Foundation
//import UIKit
//
//class Profile: NSObject, NSCoding, Printable{
//  ///Holds entire system items Dictionary-Dictionary-Araay of Items --Path To Root = String-String-Int
//  var categoryDics: [String:  [String:  [Item]]] = CLOSET_TYPE()
//
//  ///Dictionary path to item
//  var path: [String: String] = [String: String]()
//
//  var shoesDic        = [String: [Item]]()
//  var shirtDic        = [String: [Item]]()
//  var pantsDic        = [String: [Item]]()
//  var underClothesDic = [String: [Item]]()
//  var accessoriesDic  = [String: [Item]]()
//  var jewelsDic       = [String: [Item]]()
//
//
//  var shoesArray: [Item]        = []
//  var nikeArray: [Item]         = []
//  var slipperArray: [Item]      = []
//  var shirtArray: [Item]        = []
//  var pantsArray: [Item]        = []
//  var underclothesArray: [Item] = []
//  var accessoriesArray: [Item]  = []
//  var jewelryArray: [Item]      = []
//
//  override init(){
//    //Array initialization
//    shoesArray.append     (Item(make: "Jordans" , model: "13's", category: "Shoes", subCategory: "Jordans", price: "200", ImageName: "13's",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    shoesArray.append     (Item(make: "Jordans" , model: "8's", category: "Shoes", subCategory: "Jordans", price: "200", ImageName: "8's",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    nikeArray.append       (Item (make: "Nike" , model: "Blue Nikes", category: "Shoes", subCategory: "Nike's", price: "80", ImageName: "Nike Blue White",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    slipperArray.append    (Item(make: "Slippers" , model: "Red Slippers", category: "Shoes", subCategory: "Slippers", price: "40",
//      ImageName: "Slippers", favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0,
//      datePurchased: 0, color: "No"))
//    shirtArray.append      (Item(make: "Shirt" , model: "18's", category: "Shirts", subCategory: "T-Shirts", price: "20", ImageName: "Shirt",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    pantsArray.append      (Item(make: "Pants" , model: "18's",category: "Pants", subCategory: "Jeans", price: "60", ImageName: "Pants",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    underclothesArray.append(Item(make: "Socks" , model: "18's", category: "UnderClothes", subCategory: "Socks", price: "20", ImageName: "Socks",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    jewelryArray.append    (Item(make: "Gold" , model: "Rolly", category: "Jewelry", subCategory: "Gold", price: "600", ImageName: "Chain",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//    accessoriesArray.append (Item(make: "Star Earing" , model: "18's", category: "Accessories", subCategory: "EarRings", price: "20", ImageName: "Earrings",
//      favorited: "No", isThisNew: "No", timesWorn: 0, lastTImeWorn: 0, index: 0, datePurchased: 0, color: "No"))
//
//    shoesDic        = ["Jordans" : shoesArray, "Nike": nikeArray, "Slipper": slipperArray]
//    shirtDic        = ["Polo" : shirtArray]
//    pantsDic        = ["Sean John" : pantsArray]
//    underClothesDic = ["Socks" : underclothesArray]
//    jewelsDic       = ["Gold" : jewelryArray]
//    accessoriesDic  = ["Rolex" : accessoriesArray]
//
//    categoryDics = ["Shirt": shirtDic,  "Pants": pantsDic,  "Shoes": shoesDic,
//                    "Underclothes": underClothesDic, "Jewelry": jewelsDic,
//                    "Accessories": accessoriesDic] as Dictionary
//  }
//
//  //TODO: - Fix coder and decoder to take proper strings create constant holders for these coder and decoder objects
//  required init(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
//    self.categoryDics = decoder.decodeObjectForKey("1") as! [String:  [String:  [Item]]]
//
//    self.shoesDic        = decoder.decodeObjectForKey("5") as! [String: [Item]]
//    self.shirtDic        = decoder.decodeObjectForKey("6") as! [String: [Item]]
//    self.pantsDic        = decoder.decodeObjectForKey("7") as! [String: [Item]]
//    self.underClothesDic = decoder.decodeObjectForKey("8") as! [String: [Item]]
//    self.accessoriesDic  = decoder.decodeObjectForKey("9") as! [String: [Item]]
//    self.jewelsDic       = decoder.decodeObjectForKey("10") as! [String: [Item]]
//
//    self.shoesArray        = decoder.decodeObjectForKey("11") as! [Item]
//    self.nikeArray         = decoder.decodeObjectForKey("12") as! [Item]
//    self.slipperArray      = decoder.decodeObjectForKey("13") as! [Item]
//    self.shirtArray        = decoder.decodeObjectForKey("14") as! [Item]
//    self.pantsArray        = decoder.decodeObjectForKey("15") as! [Item]
//    self.underclothesArray = decoder.decodeObjectForKey("16") as! [Item]
//    self.accessoriesArray  = decoder.decodeObjectForKey("17") as! [Item]
//    self.jewelryArray      = decoder.decodeObjectForKey("18") as! [Item]
//
//
//  }//Decode data in class
//  func encodeWithCoder(coder: NSCoder){
//    //Required
//    coder.encodeObject(self.categoryDics, forKey: "1")
//
//    coder.encodeObject(self.shoesDic, forKey: "5")
//    coder.encodeObject(self.shirtDic, forKey: "6")
//    coder.encodeObject(self.pantsDic, forKey: "7")
//    coder.encodeObject(self.underClothesDic, forKey: "8")
//    coder.encodeObject(self.accessoriesDic, forKey: "9")
//    coder.encodeObject(self.jewelsDic, forKey: "10")
//
//    coder.encodeObject(self.shoesArray, forKey: "11")
//    coder.encodeObject(self.nikeArray, forKey: "12")
//    coder.encodeObject(self.slipperArray, forKey: "13")
//    coder.encodeObject(self.shirtArray, forKey: "14")
//    coder.encodeObject(self.pantsArray, forKey: "15")
//    coder.encodeObject(self.underclothesArray, forKey: "16")
//    coder.encodeObject(self.accessoriesArray, forKey: "17")
//    coder.encodeObject(self.jewelryArray, forKey: "18")
//
//  }//Encodes data in class
//
//}


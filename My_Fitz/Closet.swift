////
////  Closet.swift
////  My_Fitz
////
////  Created by Andre Villanueva on 4/18/15.
////  Copyright (c) 2015 BangBangStudios. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class Wardrobe:NSObject, NSCoding, Printable{
//  ///Holds entire system items Dictionary-Dictionary-Araay of Items --Path To Root = String-String-Int
//  var myCloset: CLOSET_TYPE = CLOSET_TYPE()
//  var myWantsCloset: CLOSET_TYPE = CLOSET_TYPE()
//  var selectedCloset: CLOSET_TYPE{
//    get{
//      if closetSelectionString == MY_CLOSET{
//        return myCloset
//      }else if closetSelectionString == MY_WANTS_CLOSET{
//        return myWantsCloset
//      }else{
//        return myCloset
//      }
//    }
//    set{
//      if closetSelectionString == MY_CLOSET{
//        myCloset = newValue
//      }else if closetSelectionString == MY_WANTS_CLOSET{
//        myWantsCloset = newValue
//      }else{
//        magic("ClosetSelectString was not initialized")
//      }
//    }
//  }
//  var closetSelectionString: String!
//    ///Dictionary path to item
//  var path: [String: String]! = [String: String]()
//  var allItems = [Item]()
//  var savedFits      = [Fit]()
//  var closetTotalPrice:Double!
//  var numberOfItemsWorn: Int!
//  var percentOfItemsWorn: Double!
//  var numberOfItems: Int!
//  var favoritedItems = [Item]()
//  var favoritedFits  = [Fit]()
//  var recentWornFits = [Fit]()
//
//  override var description: String {
//    return String()
//  }
//
//  required init(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
//  }//Decode data in class
//  func encodeWithCoder(coder: NSCoder){
//  }//Encodes data in class
//}
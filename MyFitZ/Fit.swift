//
//  Fit.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/18/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//



import Foundation


let SlotsMax = 8
//MARK: -Fit Class
class Fit: NSObject{
    var timesWorn: Int!
    var favorited: Bool!
    var lastTimeWOrn: String!
    var fitTotalPrice: Double!
    var mostExpensiveItem: [String: String]!
    var mostDiverseItem: [String: String]!
    var outFitIDNumber: Int!
    var paths = [String: String]()
    var items: [Item]?
    
    func fetchItems(){
        for path in paths{
            let item = Item()
            //Get item from path
            self.items?.append(item)
        }
    }
}

class Fits: NSObject{
    var favoritedslots: [Fit] = [] {
        didSet{
            if favoritedslots.count >= SlotsMax{
                //Call alert and prompt to delete an item first from out fit
                favoritedslots.popLast()
            }
        }
    }
    var recentlyWornslots: [Fit] = [] {
        didSet{
            if recentlyWornslots.count >= SlotsMax{
                //Call alert and prompt to delete an item first from out fit
                recentlyWornslots.popLast()
            }
        }
    }
    var deletedlots: [Fit] = [] {
        didSet{
            if deletedlots.count >= SlotsMax{
                //Call alert and prompt to delete an item first from out fit
                deletedlots.popLast()
            }
        }
    }
    
}


class FitAbstract: NSObject{
    //MARK: -Variables
    
    var itemsFromConvertedIDs = [Item]()
    
    ///MARK: -Methods
    
    override init(){
        super.init()
    }
}


class WatchFit: FitAbstract{
    
}



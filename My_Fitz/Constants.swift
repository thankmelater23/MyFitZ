//
//  Constants.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/18/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
///MARK: - Global
//var closet: Closet!
//Represents the type of Dictionary in Dictionary of Array of Items
typealias CLOSET_TYPE = [String: [String: [Item]]]
var gamesWardrobe: CLOSET_TYPE = CLOSET_TYPE()

//Picker options
let CATEGORY_PICKER_OPTIONS = ["Tops", "Bottoms", "Headware", "Footware", "Accessories", "Underclothing"]

let PATHTYPE_CATEGORY_STRING    = "category"
let PATHTYPE_SUBCATEGORY_STRING = "subCategory"
let PATHTYPE_INDEX_STRING       = "index"

//Closet
let MY_CLOSET = "my closet"
let MY_WANTS_CLOSET = "my wants closet"

//Segue identifiers
let SEGUE_MAIN_TO_SELECTION     = "mainToSelection"
let SEGUE_MAIN_TO_FITMAKER      = "mainToFitMaker"
let SEGUE_SELECTION_TO_MAKE     = "selectionToMake"
let SEGUE_SELECTION_TO_MAIN     = "selectionToMain"
let SEGUE_MAKE_TO_MODEL         = "makeToModel"
let SEGUE_MAKE_TO_SELECTION     = "makeToSelection"
let SEGUE_MAKE_TO_CREATION      = "makeToCreation"
let SEGUE_MODEL_TO_DETAIL       = "modelToDetailed"
let SEGUE_MODEL_TO_MAKE         = "modelToMake"
let SEGUE_MODEL_TO_CREATION     = "modelToCreation"
let SEGUE_DETAIL_TO_MODEL       = "detailedToModel"
let SEGUE_DETAIL_TO_CREATION    = "detailedToCreation"
let SEGUE_CREATION_TO_MAIN      = "creationToMain"
let SEGUE_CREATION_TO_SELECTION = "creationToDetail"
let SEGUE_CREATION_TO_MAKE      = "creationToMake"
let SEGUE_CREATION_TO_MODEL     = "creationToModel"
let SEGUE_CREATION_TO_DETAIL    = "creationToDetail"


let MAKE_CELL                   = "makeCell"
let MODEL_CELL                  = "modelCell"
let CREATION_CELL               = "creationCell"
let DOUBLE_LABEL_CELL           = "doubleLabel"
let TEXT_INPUT_CELL             = "textInputCell"

let MYFITZ_ARCHIVE_FILE_STRING  = "myFitz.archive"
let BLANK_IMAGE_STRING          = "blank image"





///MARK: - Item
//Required
let ITEM_BRAND_STRING        = "brand"
let ITEM_MODEL_STRING        = "model"
let ITEM_CATEGORY_STRING     = "category"
let ITEM_SUBCATEGORY_STRING  = "subCategory"
let ITEM_INDEX_STRING        = "index"
let ITEM_PRICE_STRING        = "price"
let ITEM_IMAGENAME_STRING    = "imageName"
let ITEM_FAVORITED_STRING    = "favorited"
let ITEM_ISTHISNEW_STRING    = "isThisNew"
let ITEM_TIMESWORN_STRING    = "timesWorn"
let ITEM_LASTTIMEWORN_STRING = "lastTimeWorn"
let ITEM_IMAGE_STRING        = "image"


//Optional
let ITEM_DATEPURCHASERD_STRING = "datePurchased"
let ITEM_COLOR_STRING          = "color"
let ITEM_LOCATIONPATH_STRING   = "locationPath"

let ITEM_REQUIREDDICTIONARY_STRING = "requiredDictionary"
let ITEM_OPTIONALDICTIONARY_STRING = "optionalDictionary"

let CELL_BACKGROUND_IMAGE_MODEL = "cellBlueBG"
let CELL_BACKGROUND_IMAGE_MAKE = "cellRedBG"

///MARK: - Profile













///MARK: - Closet














///MARK: - Fit














///MARK: - ViewController














///MARK: - SelectionViewController














///MARK: - MakeTableViewController














///MARK: - ModelTableViewController














///MARK: - DetailedViewController














///MARK: - CreationViewController




///GCD
var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}
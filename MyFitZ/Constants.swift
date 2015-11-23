//
//  Constants.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/18/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit
///MARK: - Global
//var closet: Closet!
//Represents the type of Dictionary in Dictionary of Array of Items
typealias CLOSET_TYPE = [String: [String: [Item]]]
var gamesWardrobe:Wardrobe = Wardrobe()

enum ItemError:ErrorType{
//    case MissingInfo
    case IncorrectSubCategory
    case missingModelString
    case addImage
//    case Missing(someInt: Int)
}


//Picker options
let CATEGORY_PICKER_OPTIONS = ["Tops", "Bottoms", "Headware", "Footware", "Accessories", "Underclothing"]
let YES_NO = ["Yes", "No"]
let ITEM_CONDITION = ["Unwearable", "Old/Damaged", "Worn Down", "Good", "Clean", "Prestine"]
let COLOR_TYPE = ["Red", "Blue", "Green", "Black", "White", "Yellow", "Orange", "Grey", "Pink", "Purple", "Brown"]
let MATERIAL_TYPE = ["Cotton", "Leather"]
let PATHTYPE_CATEGORY_STRING    = "Category"
let PATHTYPE_SUBCATEGORY_STRING = "SubCategory"
let PATHTYPE_INDEX_STRING       = "Index"

//Closet
let MY_CLOSET = "My Closet"
let MY_WANTS_CLOSET = "My Wants Closet"

//Segue identifiers
let SEGUE_MAIN_TO_SELECTION     = "mainToSelection"
let SEGUE_MAIN_TO_FITMAKER      = "mainToFitMaker"
let SEGUE_SELECTION_TO_MAKE     = "selectionToMake"
let SEGUE_SELECTION_TO_MAIN     = "selectionToMain"
let SEGUE_SELECTION_TO_CREATION = "selectionToCreation"
let SEGUE_MAKE_TO_MODEL         = "makeToModel"
let SEGUE_MAKE_TO_SELECTION     = "makeToSelection"
let SEGUE_MAKE_TO_CREATION      = "makeToCreation"
let SEGUE_MODEL_TO_DETAIL       = "modelToDetailed"
let SEGUE_MODEL_TO_MAKE         = "modelToMake"
let SEGUE_MODEL_TO_CREATION     = "modelToCreation"
let SEGUE_DETAIL_TO_MODEL       = "detailedToModel"
let SEGUE_DETAIL_TO_CREATION    = "detailedToCreation"
let SEGUE_CREATION_TO_MAIN      = "creationToMain"
let SEGUE_CREATION_TO_MAKE      = "creationToMake"
let SEGUE_CREATION_TO_MODEL     = "creationToModel"
let SEGUE_CREATION_TO_DETAIL    = "creationToDetail"
let SEGUE_CREATION_TO_SELECTION = "creationToSelection"
let SEGUE_DETAIL_TO_EDIT        = "detailToEdit"

//Cell identifiers
let MAKE_CELL                   = "makeCell"
let MODEL_CELL                  = "modelCell"
let CREATION_CELL               = "creationCell"
let DOUBLE_LABEL_CELL           = "doubleLabel"
let TEXT_INPUT_CELL             = "textInputCell"

let MYFITZ_ARCHIVE_FILE_STRING  = "myFitz.plist"
let BLANK_IMAGE_STRING          = "blank image"

//Colors
let MY_CLOSET_BAR_COLOR = UIColor.purpleColor()
let MY_WANTS_CLOSET_BAR_COLOR = UIColor.greenColor()



///MARK: - Item
//Required
let ITEM_BRAND_STRING        = "Brand"
let ITEM_MODEL_STRING        = "Model"
let ITEM_CATEGORY_STRING     = "Category"
let ITEM_SUBCATEGORY_STRING  = "Sub-Category"
let ITEM_INDEX_STRING        = "Index"
let ITEM_PRICE_STRING        = "Original Price"
let ITEM_IMAGENAME_STRING    = "Image Name"
let ITEM_FAVORITED_STRING    = "Favorited"
let ITEM_ISTHISNEW_STRING    = "New Item"
let ITEM_TIMESWORN_STRING    = "Times Worn"
let ITEM_LASTTIMEWORN_STRING = "Last Time Worn"
let ITEM_IMAGE_STRING        = "Image"


//Optional
let ITEM_DATEPURCHASERD_STRING = "Date Purchased"
let ITEM_COLOR_STRING          = "Color"
let ITEM_SECONDARYCOLOR_STRING = "Secondary Color"
let ITEM_THIRDCOLOR_STRING = "Third Color"
let ITEM_DATERELEASED_STRING = "DateReleased"
let ITEM_ITEMDESCRIPTION_STRING = "Item Description"
let ITEM_CONDITION_STRING = "Condition"
let ITEM_PRIMARYMATERIAL_STRING = "Primary Material"
let ITEM_SECONDAY_MATERIAL_STRING = "Secondary Material"
let ITEM_RETAILPRICE_STRING = "Payed Price"
let ITEM_STORELURL_STRING = "Store URL/Website"
let ITEM_STORELOCATION_STRING = "Store Location"
let ITEM_LOCATIONPATH_STRING   = "Location Path"

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
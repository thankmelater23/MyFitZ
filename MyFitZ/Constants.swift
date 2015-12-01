//
//  Constants.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/18/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
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
let CATEGORY_PICKER_OPTIONS = [TOPS, BOTTOMS, HEADWARE, FOOTWARE, ACCESSORIES, UNDERCLOTHING]
let TOPS = "Tops"
let BOTTOMS = "Bottoms"
let HEADWARE = "Headware"
let FOOTWARE =  "Footware"
let ACCESSORIES = "Accessories"
let UNDERCLOTHING = "Underclothing"

let YES_NO = ["Yes", "No"]
let ITEM_CONDITION = ["Unwearable", "Old/Damaged", "Worn Down", "Good", "Clean", "Prestine"]
let COLOR_TYPE = ["Red", "Blue", "Green", "Black", "White", "Yellow", "Orange", "Grey", "Pink", "Purple", "Brown"]
let MATERIAL_TYPE = ["Cotton", "Leather"]
let PATHTYPE_CATEGORY_STRING    = "Category"
let PATHTYPE_SUBCATEGORY_STRING = "SubCategory"
let PATHTYPE_INDEX_STRING       = "Index"

//Closet
let MY_CLOSET = "My Closet"
let MY_WANTS_CLOSET = "Wish List"

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
let MY_CLOSET_BAR_COLOR = UIColor.blackColor()
let MY_WANTS_CLOSET_BAR_COLOR = UIColor.darkGrayColor()



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

///MARK: - Audio
var audioPlayer: AVAudioPlayer! = AVAudioPlayer()

var clearSFX : SystemSoundID = 0
var saveSFX : SystemSoundID = 1
var deleteSFX : SystemSoundID = 2
var editSFX : SystemSoundID = 3
var addSFX : SystemSoundID = 4
var backSFX : SystemSoundID = 5
var closetSFX : SystemSoundID = 6
var wishlistSFX : SystemSoundID = 7
var wearSFX : SystemSoundID = 8
var categorySFX : SystemSoundID = 9
var subCategorySFX : SystemSoundID = 10
var itemSelectSFX : SystemSoundID = 11
var updateSFX : SystemSoundID = 12
var animationSFX : SystemSoundID = 13
var incorrectSFX : SystemSoundID = 14
var notificationSFX : SystemSoundID = 15


///GCD
var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}//First, the system provides you with a special serial queue known as the main queue. Like any serial queue, tasks in this queue execute one at a time. However, it’s guaranteed that all tasks will execute on the main thread, which is the only thread allowed to update your UI. This queue is the one to use for sending messages to UIView objects or posting notifications.

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}//QOS_CLASS_USER_INTERACTIVE: The user interactive class represents tasks that need to be done immediately in order to provide a nice user experience. Use it for UI updates, event handling and small workloads that require low latency. The total amount of work done in this class during the execution of your app should be small.

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}//QOS_CLASS_USER_INITIATED: The user initiated class represents tasks that are initiated from the UI and can be performed asynchronously. It should be used when the user is waiting for immediate results, and for tasks required to continue user interaction.

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}//QOS_CLASS_UTILITY: The utility class represents long-running tasks, typically with a user-visible progress indicator. Use it for computations, I/O, networking, continous data feeds and similar tasks. This class is designed to be energy efficient.

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}//QOS_CLASS_BACKGROUND: The background class represents tasks that the user is not directly aware of. Use it for prefetching, maintenance, and other tasks that don’t require user interaction and aren’t time-sensitive.
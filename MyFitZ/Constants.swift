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
<<<<<<< HEAD
import Async
=======
>>>>>>> MyFitZOld/master



///MARK: - Global Variables
//MARK: -App Variables
/// The app entire system
<<<<<<< HEAD
//var Users_Wardrobe:Wardrobe = Wardrobe()
///Defaults
let defaults = UserDefaults.standard
let APP_ID = "993217543"
let groupSync = AsyncGroup()

=======
var Users_Wardrobe:Wardrobe = Wardrobe()
///Defaults
let defaults = NSUserDefaults.standardUserDefaults()
let APP_ID = "993217543"
>>>>>>> MyFitZOld/master


//MARK: -App Arrays & Dictionary Constants
let CATEGORY_PICKER_OPTIONS = [CateogryType.TOPS, CateogryType.BOTTOMS, CateogryType.HEADWARE, CateogryType.FOOTWARE, CateogryType.ACCESSORIES, CateogryType.UNDERCLOTHING]

//MARK: -Picker Options
let YES_NO = ["Yes", "No"]
let ITEM_CONDITION = ["Too Big", "Too Small", "Unwearable", "Old/Damaged", "Worn Down", "Good", "Clean", "Prestine"]
<<<<<<< HEAD
let COLOR_TYPE : [AnyObject]! = ["Red" as AnyObject, "Blue" as AnyObject, "Green" as AnyObject, "Black" as AnyObject, "White" as AnyObject, "Yellow" as AnyObject, "Orange" as AnyObject, "Grey" as AnyObject, "Pink" as AnyObject, "Purple" as AnyObject, "Brown" as AnyObject]
=======
let COLOR_TYPE = ["Red", "Blue", "Green", "Black", "White", "Yellow", "Orange", "Grey", "Pink", "Purple", "Brown"]
>>>>>>> MyFitZOld/master
let MATERIAL_TYPE = ["Cotton", "Leather"]

//MARK: -Cloest Names
let MY_CLOSET = "My Closet"
let MY_WANTS_CLOSET = "Wish List"

//MARK: -App Integers
let RECENTLY_WORN_CONTAINER_MAX = 50
let FAVORITE_CONTAINER_MAX = 50

//MARK: -Wardrobe Settings
let ITEM_REQUIREDDICTIONARY_STRING = "requiredDictionary"
let ITEM_OPTIONALDICTIONARY_STRING = "optionalDictionary"

//MARK: -TableView
let DETAIL_TABLEVIEW_BASIC_SECTION_COUNT = 13
let DETAIL_TABLEVIEW_MISC_SECTION_COUNT = 13

///MARK: - Audio
//MARK: -Variable
var audioPlayer: AVAudioPlayer! = AVAudioPlayer()
//MARK: -SystemSoundID
//TODO: -Turn this into a struct
struct SystemSoundIDS{
    
}
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


//MARK: -Document Settings
let MYFITZ_ARCHIVE_FILE_STRING  = "myFitz.plist"//7-2015


//MARK: -Image Settings
//TODO: -Turn this into a struct
struct ImageStrings{
    
}
let ImageString = ImageStrings()

let BLANK_IMAGE_STRING          = "blank image"
let CELL_BACKGROUND_IMAGE_MODEL = "cellBlueBG"
let CELL_BACKGROUND_IMAGE_MAKE = "cellRedBG"
let LOGO_BORDER_IMAGE = "solidGradienBlueBorder"



<<<<<<< HEAD
let MY_CLOSET_BAR_COLOR = UIColor.black
let MY_WANTS_CLOSET_BAR_COLOR = UIColor.darkGray

//MARK: -GCD
//First, the system provides you with a special serial queue known as the main queue. Like any serial queue, tasks in this queue execute one at a time. However, it’s guaranteed that all tasks will execute on the main thread, which is the only thread allowed to update your UI. This queue is the one to use for sending messages to UIView objects or posting notifications.
let GlobalMainQueue = DispatchQueue.main
//QOS_CLASS_USER_INTERACTIVE: The user interactive class represents tasks that need to be done immediately in order to provide a nice user experience. Use it for UI updates, event handling and small workloads that require low latency. The total amount of work done in this class during the execution of your app should be small.
let GlobalUserInteractiveQueue = DispatchQueue(label: "com.userInteractive", qos: .userInteractive, attributes: DispatchQueue.Attributes.concurrent)
//QOS_CLASS_USER_INITIATED: The user initiated class represents tasks that are initiated from the UI and can be performed asynchronously. It should be used when the user is waiting for immediate results, and for tasks required to continue user interaction.
let GlobalUserInitiatedQueue = DispatchQueue(label: "com.userInitiated", qos: .userInitiated, attributes: .concurrent)
//QOS_CLASS_UTILITY: The utility class represents long-running tasks, typically with a user-visible progress indicator. Use it for computations, I/O, networking, continous data feeds and similar tasks. This class is designed to be energy efficient.
let GlobalUtilityQueue = DispatchQueue(label: "com.Utility", qos: .utility, attributes: .concurrent)
//QOS_CLASS_BACKGROUND: The background class represents tasks that the user is not directly aware of. Use it for prefetching, maintenance, and other tasks that don’t require user interaction and aren’t time-sensitive.
let GlobalBackgroundQueue = DispatchQueue(label: "com.background", qos: .background, attributes: .concurrent)

let GlobalMyFitZSerial = DispatchQueue(label: "com.MyFitZ.Serial.Global")
let GlobalMyFitZConcurrent = DispatchQueue(label: "com.MyFitZ.Concurrent.Global", attributes: .concurrent)
let GlobalWardrobeSerial = DispatchQueue(label: "com.Wardrobe.Serial.Global")
let GlobalWardrobeConcurrent = DispatchQueue(label: "com.Wardrobe.Concurrent.Global", attributes: .concurrent)


///MARK: -Anylitics Constants
///TODO: -Add anylitic constants from detail VC
=======
let MY_CLOSET_BAR_COLOR = UIColor.blackColor()
let MY_WANTS_CLOSET_BAR_COLOR = UIColor.darkGrayColor()

//MARK: -GCD
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
var GlobalMyFitZSerial: dispatch_queue_t {
    return dispatch_queue_create("com.MyFitZ.Serial.Global", DISPATCH_QUEUE_SERIAL)
}//Custom Created Serial Queue
var GlobalMyFitZConcurrent: dispatch_queue_t {
    return dispatch_queue_create("com.MyFitZ.Concurrent.Global", DISPATCH_QUEUE_CONCURRENT)
}//Custom Created Concurrent Queue
var GlobalWardrobeSerial: dispatch_queue_t {
    return dispatch_queue_create("com.Wardrobe.Serial.Global", DISPATCH_QUEUE_SERIAL)
}//Custom Created Serial Queue
var GlobalWardrobeConcurrent: dispatch_queue_t {
    return dispatch_queue_create("com.Wardrobe.Concurrent.Global", DISPATCH_QUEUE_CONCURRENT)
}//Custom Created Concurrent Queue
let qos = Int(QOS_CLASS_USER_INTERACTIVE.rawValue)
var GlobalWardrobeUserInteractiveQueue = dispatch_get_global_queue(qos, 0)

//MARK: -Anylitics Constants
//TODO: -Add anylitic constants from detail VC
>>>>>>> MyFitZOld/master

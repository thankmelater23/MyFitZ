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
import Async



///MARK: - Global Variables
//MARK: -App Variables
/// The app entire system
//var Users_Wardrobe:Wardrobe = Wardrobe()
///Defaults
let defaults = UserDefaults.standard
let APP_ID = "993217543"
let groupSync = AsyncGroup()


//MARK: -App Arrays & Dictionary Constants
let CATEGORY_PICKER_OPTIONS = [CateogryType.TOPS, CateogryType.BOTTOMS, CateogryType.HEADWARE, CateogryType.FOOTWARE, CateogryType.ACCESSORIES, CateogryType.UNDERCLOTHING]

//MARK: -Picker Options
let YES_NO = ["Yes", "No"]
let ITEM_CONDITION = ["Too Big", "Too Small", "Unwearable", "Old/Damaged", "Worn Down", "Good", "Clean", "Prestine"]
let COLOR_TYPE : [AnyObject]! = ["Red" as AnyObject, "Blue" as AnyObject, "Green" as AnyObject, "Black" as AnyObject, "White" as AnyObject, "Yellow" as AnyObject, "Orange" as AnyObject, "Grey" as AnyObject, "Pink" as AnyObject, "Purple" as AnyObject, "Brown" as AnyObject]
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



let MY_CLOSET_BAR_COLOR = UIColor.black
let MY_WANTS_CLOSET_BAR_COLOR = UIColor.darkGray
//MARK: -GCD
//var GlobalMainQueue: DispatchQueue {
//    return DispatchQueue.main
//}//First, the system provides you with a special serial queue known as the main queue. Like any serial queue, tasks in this queue execute one at a time. However, it’s guaranteed that all tasks will execute on the main thread, which is the only thread allowed to update your UI. This queue is the one to use for sending messages to UIView objects or posting notifications.
//
//
//
//var testVarj:DispatchQueue{
//    return DispatchQueue.main("MAINSOME", DISPATCH_QUEUE_PRIORITY_LOW)
//}
//
//var GlobalUserInteractiveQueue: DispatchQueue {
//    return DispatchQueue.global(priority: Int(DispatchQoS.QoSClass.userInteractive.rawValue))
//}//QOS_CLASS_USER_INTERACTIVE: The user interactive class represents tasks that need to be done immediately in order to provide a nice user experience. Use it for UI updates, event handling and small workloads that require low latency. The total amount of work done in this class during the execution of your app should be small.
//
//var GlobalUserInitiatedQueue: DispatchQueue {
//    return DispatchQueue.global(priority: Int(DispatchQoS.QoSClass.userInitiated.rawValue))
//}//QOS_CLASS_USER_INITIATED: The user initiated class represents tasks that are initiated from the UI and can be performed asynchronously. It should be used when the user is waiting for immediate results, and for tasks required to continue user interaction.
//
//var GlobalUtilityQueue: DispatchQueue {
//    return DispatchQueue.global(priority: Int(DispatchQoS.QoSClass.utility.rawValue))
//}//QOS_CLASS_UTILITY: The utility class represents long-running tasks, typically with a user-visible progress indicator. Use it for computations, I/O, networking, continous data feeds and similar tasks. This class is designed to be energy efficient.
//
//var GlobalBackgroundQueue: DispatchQueue {
//    return DispatchQueue.global(priority: Int(DispatchQoS.QoSClass.background.rawValue))
//}//QOS_CLASS_BACKGROUND: The background class represents tasks that the user is not directly aware of. Use it for prefetching, maintenance, and other tasks that don’t require user interaction and aren’t time-sensitive.
//var GlobalMyFitZSerial: DispatchQueue {
//    return DispatchQueue(label: "com.MyFitZ.Serial.Global", attributes: [])
//}//Custom Created Serial Queue
//var GlobalMyFitZConcurrent: DispatchQueue {
//    return DispatchQueue(label: "com.MyFitZ.Concurrent.Global", attributes: DispatchQueue.Attributes.concurrent)
//}//Custom Created Concurrent Queue
//var GlobalWardrobeSerial: DispatchQueue {
//    return DispatchQueue(label: "com.Wardrobe.Serial.Global", attributes: [])
//}//Custom Created Serial Queue
//var GlobalWardrobeConcurrent: DispatchQueue {
//    return DispatchQueue(label: "com.Wardrobe.Concurrent.Global", attributes: DispatchQueue.Attributes.concurrent)
//}//Custom Created Concurrent Queue
//let qos = Int(DispatchQoS.QoSClass.userInteractive.rawValue)
//var GlobalWardrobeUserInteractiveQueue = DispatchQueue.global(priority: qos)
//

var GlobalMyFitZSerial = DispatchQueue(label: "com.MyFitZ.Serial.Global", attributes: [.concurrent])
var GlobalMyFitZConcurrent = DispatchQueue(label: "com.MyFitZ.Concurrent.Global", attributes: [.concurrent])
var GlobalWardrobeSerial = DispatchQueue(label: "com.Wardrobe.Serial.Global", attributes: [.concurrent])
var GlobalWardrobeConcurrent = DispatchQueue(label: "com.Wardrobe.Concurrent.Global", attributes: [.concurrent])
//Custom Created Concurrent Queue
let qos = Int(DispatchQoS.QoSClass.userInteractive.hashValue)

//
//var GlobalWardrobeUserInteractiveQueue = DispatchQueue.global(priority: qos)
//
//    : DispatchQueue {
//    return DispatchQueue(label: "com.MyFitZ.Serial.Global", attributes: [])
//}//Custom Created Serial Queue
//
//    
//    : DispatchQueue {
//    return DispatchQueue(label: "com.MyFitZ.Concurrent.Global", attributes: DispatchQueue.Attributes.concurrent)
//}//Custom Created Concurrent Queue
//
//    
//    : DispatchQueue {
//    return DispatchQueue(label: "com.Wardrobe.Serial.Global", attributes: [])
//}//Custom Created Serial Queue
//
//    
//    : DispatchQueue {
//    return DispatchQueue(label: "com.Wardrobe.Concurrent.Global", attributes: DispatchQueue.Attributes.concurrent)
//

///MARK: -Anylitics Constants
///TODO: -Add anylitic constants from detail VC

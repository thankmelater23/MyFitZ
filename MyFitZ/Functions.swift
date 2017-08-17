//
//  Functions.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 11/22/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
<<<<<<< HEAD
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    } }


//MARK: -Global Methods

func calicuateDaysBetweenTwoDates(start: Date, end: Date) -> Int {
    
    let currentCalendar = Calendar.current
    guard let start = currentCalendar.ordinality(of: .day, in: .era, for: start) else {
        return 0
    }
    guard let end = currentCalendar.ordinality(of: .day, in: .era, for: end) else {
        return 0
    }
    return end - start
}

//MARK: -General
=======

//MARK: -Global Methods

//MARK: -General
/**
Creates original User ID that takes value from cloud source assign to new user, increment value and save back to cloud with new value for next user
*/
func createUserId(){
    //TODO: -Add create user id
    //standard defaults
    //Get value for bool isNew
    //If true get last id from system assign to self, increment system value, save back to system
    //set in stadard defaults the id
}

>>>>>>> MyFitZOld/master


//MARK: -Generators
/**
<<<<<<< HEAD
 Creates a String thats formated to go inside the views Title
 
 - parameter closet: Current closet String
 - parameter view:   Current view String
 
 - returns: Both paramaters added together and formated
 */
func grabTitle(_ closet:String, view: String)->String {
=======
Creates a String thats formated to go inside the views Title

- parameter closet: Current closet String
- parameter view:   Current view String

- returns: Both paramaters added together and formated
*/
func grabTitle(closet:String, view: String)->String{
>>>>>>> MyFitZOld/master
    var string: String = String()
    string = view + "-" + closet
    return string
}



//MARK: -Sound Methods
/**
<<<<<<< HEAD
 Plays sound effect from SystemSoundID number from param
 
 - parameter soundID: SystemSoundID that represents a sound effect
 */
func playSoundEffects(_ soundID: SystemSoundID) {
=======
Plays sound effect from SystemSoundID number from param

- parameter soundID: SystemSoundID that represents a sound effect
*/
func playSoundEffects(soundID: SystemSoundID) {
>>>>>>> MyFitZOld/master
    AudioServicesPlaySystemSound(soundID)
}
/**
 Initializes all SFX for game
 
 - returns: No return
 */
func initializeSounds() {
<<<<<<< HEAD
    log.debug("Sound effects are being loaded")
    GlobalUserInteractiveQueue.async(execute: {
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "clear0", withExtension: "wav")! as CFURL, &clearSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "save0", withExtension: "wav")! as CFURL, &saveSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "delete0", withExtension: "wav")! as CFURL, &deleteSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "edit0", withExtension: "wav")! as CFURL, &editSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "add0", withExtension: "wav")! as CFURL, &addSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "back0", withExtension: "wav")! as CFURL, &backSFX)
        
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "wear0", withExtension: "wav")! as CFURL, &wearSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "notification1", withExtension: "wav")! as CFURL, &categorySFX)
        //    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("path", withExtension: "wav")!, &subCategorySFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "cellselect0", withExtension: "wav")! as CFURL, &itemSelectSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "update0", withExtension: "wav")! as CFURL, &updateSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "animationPop0", withExtension: "wav")! as CFURL, &animationSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "alert0", withExtension: "wav")! as CFURL, &incorrectSFX)
        AudioServicesCreateSystemSoundID(Bundle.main.url(forResource: "notification0", withExtension: "wav")! as CFURL, &notificationSFX)
        log.debug("All sounds initialized")
=======
    log.info("Sound effects are being loaded")
    dispatch_async(GlobalUserInteractiveQueue, {
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("clear0", withExtension: "wav")!, &clearSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("save0", withExtension: "wav")!, &saveSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("delete0", withExtension: "wav")!, &deleteSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("edit0", withExtension: "wav")!, &editSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("add0", withExtension: "wav")!, &addSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("back0", withExtension: "wav")!, &backSFX)
        
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("wear0", withExtension: "wav")!, &wearSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("notification1", withExtension: "wav")!, &categorySFX)
        //    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("path", withExtension: "wav")!, &subCategorySFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("cellselect0", withExtension: "wav")!, &itemSelectSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("update0", withExtension: "wav")!, &updateSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("animationPop0", withExtension: "wav")!, &animationSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("alert0", withExtension: "wav")!, &incorrectSFX)
        AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("notification0", withExtension: "wav")!, &notificationSFX)
        log.info("All sounds initialized")
>>>>>>> MyFitZOld/master
    })
}



//MARK: -Animations
/**
<<<<<<< HEAD
 Animates app general buttons
 
 - parameter view: Button to animate
 */
func buttonAnimation(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.green.cgColor
=======
Animates app general buttons

- parameter view: Button to animate
*/
func buttonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.greenColor().CGColor
>>>>>>> MyFitZOld/master
    //    view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
}


//MARK: -UIGestureActions
<<<<<<< HEAD
func handleTap(_ sender: UITapGestureRecognizer) {
    switch(sender.state){
    case .began:
        buttonTouchBeganAnimation(sender.view!)
        
    case .cancelled:
        buttonTouchCancelledAnimation(sender.view!)
    case .ended:
        buttonTouchEndedAnimation(sender.view!)
    case .failed:
        buttonTouchCancelledAnimation(sender.view!)
    case .possible: break
    case .changed: break
    }
}
func buttonTouchBeganAnimation(_ button:UIView){
    button.animation.transformScale(3.0).animate(1.0)
}
func buttonTouchCancelledAnimation(_ button:UIView){
    button.animation.transformScale(1.0).animate(1.0)
}
func buttonTouchEndedAnimation(_ button:UIView){
=======
func handleTap(sender: UITapGestureRecognizer) {
    switch(sender.state){
    case .Began:
        buttonTouchBeganAnimation(sender.view!)
        
    case .Cancelled:
        buttonTouchCancelledAnimation(sender.view!)
    case .Ended:
        buttonTouchEndedAnimation(sender.view!)
    case .Failed:
        buttonTouchCancelledAnimation(sender.view!)
    case .Possible: break
    case .Changed: break
    }
}
func buttonTouchBeganAnimation(button:UIView){
    button.animation.transformScale(3.0).animate(1.0)
}
func buttonTouchCancelledAnimation(button:UIView){
    button.animation.transformScale(1.0).animate(1.0)
}
func buttonTouchEndedAnimation(button:UIView){
>>>>>>> MyFitZOld/master
    button.animation.transformScale(0.2).animate(1.0)
}


//MARK: -WARDROBE Reference System
/**
<<<<<<< HEAD
 Returns an item from the path give or nil if none exist at that place
 
 - parameter path: Dictionary of keys and values
 
 - returns: Item from path
 */
//func returnItem(_ path: [String: String])->Item?{
//
//    if validatePathAndItem(path){
//        //Setting all variable to values of path
//        let _:String! = path[PathType.PATHTYPE_CLOSET_STRING]
//        let category:String! = path[PathType.PATHTYPE_CATEGORY_STRING]
//        let subCategory:String! = path[PathType.PATHTYPE_SUBCATEGORY_STRING]
//        let id:Int! = Int(path[PathType.PATHTYPE_ID_STRING]!)
//        let index:Int! = Int(path[PathType.PATHTYPE_INDEX_STRING]!)
//
//        //Gets value from path of item
//        let array = Users_Wardrobe.returnArrayOfItems(category, funcSubCategory: subCategory)
//        let item = array[index]
//
//        //Returns item if path is 100% clear, if not it is searched in the array anf if not in array updating isnt working bad problem!!!!
//        if item.id == id{
//            //            log.info("Item id matched on return to item")
//            return item
//        }else{
//            defer{
//                Users_Wardrobe.clearAllContainersAndPopulate()
//            }
//
//            log.warning("Item id did not match on return to item, search initiated")
//
//            for searchItem in array{
//                //TODO: -Something isn't right for this to always be happening
//                if searchItem.id == id{
//                    log.info("Search success item found with in the array")
//                    log.warning("This is not the resault needed")
//                    return searchItem
//                }
//            }
//            GlobalUtilityQueue.sync(execute: {
//                Users_Wardrobe.clearAllContainersAndPopulate()
//                assertionFailure("Search Failed item not found with in the array or at id number BIG ERROR*TIP:ID")
//            })
//
//            return Item()
//        }
//    }else{
//        //        dispatch_async(GlobalMainQueue, {
//        GlobalUtilityQueue.sync(execute: {
//            Users_Wardrobe.clearAllContainersAndPopulate()
//            assertionFailure("Validation failed value is missing from path BIG FUCKING ERROR*TIP:ID IS NOT UPDATING WHEN ITS PATH IS CHANGED")
//        })
//        //            })
//        return Item()
//    }
//}
=======
Returns an item from the path give or nil if none exist at that place

- parameter path: Dictionary of keys and values

- returns: Item from path
*/
func returnItem(path: [String: String])->Item?{
    
    if validatePathAndItem(path){
        //Setting all variable to values of path
        let _:String! = path[PathType.PATHTYPE_CLOSET_STRING]
        let category:String! = path[PathType.PATHTYPE_CATEGORY_STRING]
        let subCategory:String! = path[PathType.PATHTYPE_SUBCATEGORY_STRING]
        let id:Int! = Int(path[PathType.PATHTYPE_ID_STRING]!)
        let index:Int! = Int(path[PathType.PATHTYPE_INDEX_STRING]!)
        
        //Gets value from path of item
        let array = Users_Wardrobe.returnArrayOfItems(category, funcSubCategory: subCategory)
        let item = array[index]
        
        //Returns item if path is 100% clear, if not it is searched in the array anf if not in array updating isnt working bad problem!!!!
        if item.id == id{
            //            log.info("Item id matched on return to item")
            return item
        }else{
            defer{
                Users_Wardrobe.clearAllContainersAndPopulate()
            }
            
            log.warning("Item id did not match on return to item, search initiated")
            
            for searchItem in array{
                //TODO: -Something isn't right for this to always be happening
                if searchItem.id == id{
                    log.info("Search success item found with in the array")
                    log.warning("This is not the resault needed")
                    return searchItem
                }
            }
            dispatch_sync(GlobalUtilityQueue, {
                Users_Wardrobe.clearAllContainersAndPopulate()
                assertionFailure("Search Failed item not found with in the array or at id number BIG ERROR*TIP:ID")
            })
            
            return Item()
        }
    }else{
        //        dispatch_async(GlobalMainQueue, {
        dispatch_sync(GlobalUtilityQueue, {
            Users_Wardrobe.clearAllContainersAndPopulate()
            assertionFailure("Validation failed value is missing from path BIG FUCKING ERROR*TIP:ID IS NOT UPDATING WHEN ITS PATH IS CHANGED")
        })
        //            })
        return Item()
    }
}
>>>>>>> MyFitZOld/master
/**
 -Takes a dictionary and look for specific values
 -If any are nil method returns bool all paths have to be clear
 - parameter path: Dictinary for path
 
 - returns: bool of true if all path values are not nil
 */
<<<<<<< HEAD
func validatePath(_ path: [String: String])->Bool{
=======
func validatePath(path: [String: String])->Bool{
>>>>>>> MyFitZOld/master
    //    log.verbose("-VALIDATIING PATH ARRAY")
    let closet:String? = path[PathType.PATHTYPE_CLOSET_STRING]
    let category:String? = path[PathType.PATHTYPE_CATEGORY_STRING]
    let subCategory:String? = path[PathType.PATHTYPE_SUBCATEGORY_STRING]
    let id:String? = path[PathType.PATHTYPE_ID_STRING]
    let index:String? = path[PathType.PATHTYPE_INDEX_STRING]
    
<<<<<<< HEAD
    guard let _ = Int((id)!),  let _ = Int((index)!) else{
=======
    guard let _ = Int((id)!),  _ = Int((index)!) else{
>>>>>>> MyFitZOld/master
        return false
    }
    
    if closet != nil && category != nil && subCategory != nil{
        //        log.verbose("-VALIDATIING PASSED ALL VALUES NON NIL")
        return true
    }else{
        log.warning("-VALIDATIING FAILED ONE OR ALL ARE NIL")
        return false
    }
}
/**
 Verifies if an item exists at the given path
 
 - parameter path: Dictionary of values needed
 
 - returns: <#return value description#>
 */
<<<<<<< HEAD
func validateItem(_ path: [String: String])-> Bool{
    //    let index = Int(path[PathType.PATHTYPE_INDEX_STRING]!) ?? 999999
    //    let array: [Item]? = Users_Wardrobe.returnArrayOfItems(path[PathType.PATHTYPE_CATEGORY_STRING]!, funcSubCategory: path[PathType.PATHTYPE_SUBCATEGORY_STRING]!) as [Item]?
    //
    //    if index < array?.count{
    //        if let _ = array?[index]{
    //            return true
    //        }else{
    //            return false
    //        }
    //    }else{
    return false
    //    }
    
=======
func validateItem(path: [String: String])-> Bool{
    let index = Int(path[PathType.PATHTYPE_INDEX_STRING]!) ?? 999999
    let array: [Item]? = Users_Wardrobe.returnArrayOfItems(path[PathType.PATHTYPE_CATEGORY_STRING]!, funcSubCategory: path[PathType.PATHTYPE_SUBCATEGORY_STRING]!) as [Item]?
    
    if index < array?.count{
        if let _ = array?[index]{
            return true
        }else{
            return false
        }
    }else{
        return false
    }
>>>>>>> MyFitZOld/master
}
/**
 Takes the path and needs validPath & validateItem to both be true to return true or the method returns false
 
 - parameter path: Dictionary path to verify
 
 - returns: Bool
 */
<<<<<<< HEAD
func validatePathAndItem(_ path: [String: String])->Bool{
    return (validatePath(path) && validateItem(path))
}
//func wardrobeItemsReset(_ varWardrobe: Wardrobe)->Wardrobe{
//Gives all Closet items a new ID number
//
//    var sum = 0
//
//    let newWardrobe = varWardrobe
//
//    let prevClosetSelection = varWardrobe.closetSelectionString
//
//    varWardrobe.closetSelectionString = MY_CLOSET
//
//    for (catKey, superValue) in varWardrobe.selectedCloset{
//        for (subCatKey, values) in superValue{
//            sum = 0
//            for (arrayIndex, value) in values.enumerated(){
//                value.path[PathType.PATHTYPE_CLOSET_STRING] = MY_CLOSET
//                value.path[PathType.PATHTYPE_CATEGORY_STRING] = value.category
//                value.path[PathType.PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
//                value.path[PathType.PATHTYPE_ID_STRING] = String(value.id)
//                value.path[PathType.PATHTYPE_INDEX_STRING] = String(arrayIndex)
//                sum += 1
//
//                newWardrobe.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
//            }
//        }
//    }
//
//    sum = 0
//
//    varWardrobe.closetSelectionString = MY_WANTS_CLOSET
//    //Gives all Wishlist items a new ID number
//    for (catKey, superValue) in varWardrobe.selectedCloset{
//        for (subCatKey, values) in superValue{
//            sum = 0
//            for (arrayIndex, value) in values.enumerated(){
//
//                value.path[PathType.PATHTYPE_CLOSET_STRING] = MY_WANTS_CLOSET
//                value.path[PathType.PATHTYPE_CATEGORY_STRING] = value.category
//                value.path[PathType.PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
//                value.path[PathType.PATHTYPE_ID_STRING] = String(value.id)
//                value.path[PathType.PATHTYPE_INDEX_STRING] = String(arrayIndex)
//                sum += 1
//
//                newWardrobe.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
//            }
//        }
//    }
//
//    //Sets back current closet we're in
//    newWardrobe.closetSelectionString = prevClosetSelection
//
//    return newWardrobe
//}
=======
func validatePathAndItem(path: [String: String])->Bool{
    return (validatePath(path) && validateItem(path))
}
func wardrobeItemsReset(varWardrobe: Wardrobe)->Wardrobe{
    //Gives all Closet items a new ID number
    
    var sum = 0
    
    let newWardrobe = varWardrobe
    
    let prevClosetSelection = varWardrobe.closetSelectionString
    
    varWardrobe.closetSelectionString = MY_CLOSET
    
    for (catKey, superValue) in varWardrobe.selectedCloset{
        for (subCatKey, values) in superValue{
            sum = 0
            for (arrayIndex, value) in values.enumerate(){
                value.path[PathType.PATHTYPE_CLOSET_STRING] = MY_CLOSET
                value.path[PathType.PATHTYPE_CATEGORY_STRING] = value.category
                value.path[PathType.PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
                value.path[PathType.PATHTYPE_ID_STRING] = String(value.id)
                value.path[PathType.PATHTYPE_INDEX_STRING] = String(arrayIndex)
                sum += 1
                
                newWardrobe.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
            }
        }
    }
    
    sum = 0
    
    varWardrobe.closetSelectionString = MY_WANTS_CLOSET
    //Gives all Wishlist items a new ID number
    for (catKey, superValue) in varWardrobe.selectedCloset{
        for (subCatKey, values) in superValue{
            sum = 0
            for (arrayIndex, value) in values.enumerate(){
                
                value.path[PathType.PATHTYPE_CLOSET_STRING] = MY_WANTS_CLOSET
                value.path[PathType.PATHTYPE_CATEGORY_STRING] = value.category
                value.path[PathType.PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
                value.path[PathType.PATHTYPE_ID_STRING] = String(value.id)
                value.path[PathType.PATHTYPE_INDEX_STRING] = String(arrayIndex)
                sum += 1
                
                newWardrobe.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
            }
        }
    }
    
    //Sets back current closet we're in
    newWardrobe.closetSelectionString = prevClosetSelection
    
    return newWardrobe
}
>>>>>>> MyFitZOld/master




//MARK: -View Customization methods
/**
<<<<<<< HEAD
 Sets selection Images to be customized
 
 - parameter view: UIImage to customize
 */
func secectionImagesDresser(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.cgColor
=======
Sets selection Images to be customized

- parameter view: UIImage to customize
*/
func secectionImagesDresser(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.CGColor
>>>>>>> MyFitZOld/master
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
<<<<<<< HEAD
func viewGeneralCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.cgColor
=======
func viewGeneralCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.CGColor
>>>>>>> MyFitZOld/master
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
<<<<<<< HEAD
func subViewGeneralCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.cgColor
    view.backgroundColor = Jean
}

func bannerViewCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.cgColor
=======
func subViewGeneralCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.CGColor
    view.backgroundColor = Jean
}

func bannerViewCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.CGColor
>>>>>>> MyFitZOld/master
    view.backgroundColor = PopulatedStarsTexture
    
}
/**
 Sets Logo to be customized
 
 - parameter view: Logo to customize
 */
<<<<<<< HEAD
func logoCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 7
    view.layer.borderColor = RawGoldTexture.cgColor
=======
func logoCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 7
    view.layer.borderColor = RawGoldTexture.CGColor
>>>>>>> MyFitZOld/master
}
/**
 Sets images to be customized
 
 - parameter view: Logo to customize
 */
<<<<<<< HEAD
func imageCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5
    view.layer.borderColor = UIColor.init(patternImage: UIImage(named: "coloredPatterns")!).cgColor
=======
func imageCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5
    view.layer.borderColor = UIColor.init(patternImage: UIImage(named: "coloredPatterns")!).CGColor
>>>>>>> MyFitZOld/master
}
/**
 Sets selection Labels to be customized
 
 - parameter view: UILabel to customize
 */
<<<<<<< HEAD
func nameLabelCustomizer(_ view: UIView){
    view.layer.borderWidth = 3.0
    view.layer.borderColor = Gold.cgColor
=======
func nameLabelCustomizer(view: UIView){
    view.layer.borderWidth = 3.0
    view.layer.borderColor = Gold.CGColor
>>>>>>> MyFitZOld/master
    view.backgroundColor = LeatherTexture
}
/**
 Sets Wear button to be customized
 
 - parameter view: UIButton to customize
 */
<<<<<<< HEAD
func wearButtonAnimation(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = RawGoldTexture.cgColor
=======
func wearButtonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = RawGoldTexture.CGColor
>>>>>>> MyFitZOld/master
    view.backgroundColor = StarCloudsTexture
    
}
/**
 Sets Label of number to be customized
 
 - parameter view: UILabel to customize
 */
<<<<<<< HEAD
func secectionNumberLabelDresser(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
=======
func secectionNumberLabelDresser(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
>>>>>>> MyFitZOld/master
    
    view.clipsToBounds = true
    view.layer.borderWidth = 0.5
    view.backgroundColor = HardSandTexture
<<<<<<< HEAD
    view.layer.borderColor = LeatherTexture.cgColor
=======
    view.layer.borderColor = LeatherTexture.CGColor
>>>>>>> MyFitZOld/master
}
/**
 Sets option buttons to be customized
 
 - parameter view: UIButton to customize
 */
<<<<<<< HEAD
func optionViewCustomized(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = DarkBlueJean.cgColor
=======
func optionViewCustomized(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = DarkBlueJean.CGColor
>>>>>>> MyFitZOld/master
    view.backgroundColor = LeatherTexture
}
/**
 Sets bar button to be customized
 
 - parameter view: UIBarButton to customize
 */
<<<<<<< HEAD
func barButtonAnimation(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3.0
    view.layer.borderColor = UIColor.black.cgColor
}
func featureButtons(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = GreenWool
}
func CellImagesButtons(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.cgColor
    view.backgroundColor = RedClothTexture
}
func CellButtons(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 1.5
    view.layer.borderColor = RawGoldTexture.cgColor
    view.backgroundColor = PopulatedStarsTexture
}
func leatherView(_ view: UIView){
    //    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = BrownLeatherStitching.cgColor
    view.backgroundColor = DarkBlueJean
}
func searchViewFloor(_ view: UIView){
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = BrownLeatherStitching.cgColor
    view.backgroundColor = DarkBlueJean
}
func navigationButtons(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = StarCloudsTexture
}
func optionButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 10
    view.layer.borderColor = RedBunchedUpSilkSheet.cgColor
}
func cloesetButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = DarkBlueJean.cgColor
    view.backgroundColor = BlurredGlass
}
func featureCellImageCustomization(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = PopulatedStarsTexture.cgColor
    view.backgroundColor = Gold
}
func categoryCellImageCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = DarkBlueJean.cgColor
    view.backgroundColor = LeatherTexture
}
func clearButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = YellowWool
}
func addButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = BlueWool
}
func deleteButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = RedWool
}
func updateButtonCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.cgColor
    view.backgroundColor = BlueWool
}

=======
func barButtonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3.0
    view.layer.borderColor = UIColor.blackColor().CGColor
}
func featureButtons(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = GreenWool
}
func CellImagesButtons(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.CGColor
    view.backgroundColor = RedClothTexture
}
func CellButtons(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 1.5
    view.layer.borderColor = RawGoldTexture.CGColor
    view.backgroundColor = PopulatedStarsTexture
}
func leatherView(view: UIView){
    //    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = BrownLeatherStitching.CGColor
    view.backgroundColor = DarkBlueJean
}
func searchViewFloor(view: UIView){
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 4
    view.layer.borderColor = BrownLeatherStitching.CGColor
    view.backgroundColor = DarkBlueJean
}
func navigationButtons(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = StarCloudsTexture
}
func optionButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 10
    view.layer.borderColor = RedBunchedUpSilkSheet.CGColor
}
func cloesetButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = DarkBlueJean.CGColor
    view.backgroundColor = BlurredGlass
}
func featureCellImageCustomization(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = PopulatedStarsTexture.CGColor
    view.backgroundColor = Gold
}
func categoryCellImageCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = DarkBlueJean.CGColor
    view.backgroundColor = LeatherTexture
}
func clearButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = YellowWool
}
func addButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = BlueWool
}
func deleteButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = RedWool
}
func updateButtonCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 6
    view.layer.borderColor = LeatherTexture.CGColor
    view.backgroundColor = BlueWool
}


>>>>>>> MyFitZOld/master
func vibrate(){
    //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations or sound if vibration not supported
    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations only
    
<<<<<<< HEAD
    
}

//MARK: - Path Methods
func pathSetup(userString: Int16 = 0, closetString: Int16 = 0, categoryString: String? = nil, subCategoryString: String? = nil, indexString: String? = nil, idString: String? = nil)->[String: String]{
    var path = [String: String]()
    
    path[PathType.PATHTYPE_USER_STRING] = String(userString)
    path[PathType.PATHTYPE_CLOSET_STRING] = String(closetString)
    path[PathType.PATHTYPE_CATEGORY_STRING] = categoryString
    path[PathType.PATHTYPE_SUBCATEGORY_STRING] = subCategoryString
    path[PathType.PATHTYPE_INDEX_STRING] = String(describing: indexString)
    path[PathType.PATHTYPE_ID_STRING] = idString
    
    
    return path
}
func clearPath()->[String: String]{
    return pathSetup()
=======
>>>>>>> MyFitZOld/master
}


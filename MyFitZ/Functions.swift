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


//MARK: -Generators
/**
 Creates a String thats formated to go inside the views Title
 
 - parameter closet: Current closet String
 - parameter view:   Current view String
 
 - returns: Both paramaters added together and formated
 */
func grabTitle(_ closet:String, view: String)->String {
    var string: String = String()
    string = view + "-" + closet
    return string
}



//MARK: -Sound Methods
/**
 Plays sound effect from SystemSoundID number from param
 
 - parameter soundID: SystemSoundID that represents a sound effect
 */
func playSoundEffects(_ soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
}
/**
 Initializes all SFX for game
 
 - returns: No return
 */
func initializeSounds() {
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
    })
}



//MARK: -Animations
/**
 Animates app general buttons
 
 - parameter view: Button to animate
 */
func buttonAnimation(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.green.cgColor
    //    view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
}


//MARK: -UIGestureActions
//func handleTap(_ sender: UITapGestureRecognizer) {
//    switch(sender.state){
//    case .began:
//        buttonTouchBeganAnimation(sender.view!)
//
//    case .cancelled:
//        buttonTouchCancelledAnimation(sender.view!)
//    case .ended:
//        buttonTouchEndedAnimation(sender.view!)
//    case .failed:
//        buttonTouchCancelledAnimation(sender.view!)
//    case .possible: break
//    case .changed: break
//    }
//}
//func buttonTouchBeganAnimation(_ button:UIView){
//    button.animation.transformScale(3.0).animate(1.0)
//}
//func buttonTouchCancelledAnimation(_ button:UIView){
//    button.animation.transformScale(1.0).animate(1.0)
//}
//func buttonTouchEndedAnimation(_ button:UIView){
//    button.animation.transformScale(0.2).animate(1.0)
//}


//MARK: -WARDROBE Reference System
/**
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
/**
 -Takes a dictionary and look for specific values
 -If any are nil method returns bool all paths have to be clear
 - parameter path: Dictinary for path
 
 - returns: bool of true if all path values are not nil
 */
func validatePath(_ path: [String: String])->Bool{
    //    log.verbose("-VALIDATIING PATH ARRAY")
    let closet:String? = path[PathType.PATHTYPE_CLOSET_STRING]
    let category:String? = path[PathType.PATHTYPE_CATEGORY_STRING]
    let subCategory:String? = path[PathType.PATHTYPE_SUBCATEGORY_STRING]
    let id:String? = path[PathType.PATHTYPE_ID_STRING]
    let index:String? = path[PathType.PATHTYPE_INDEX_STRING]
    
    guard let _ = Int((id)!),  let _ = Int((index)!) else{
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
    
}
/**
 Takes the path and needs validPath & validateItem to both be true to return true or the method returns false
 
 - parameter path: Dictionary path to verify
 
 - returns: Bool
 */
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




//MARK: -View Customization methods
/**
 Sets selection Images to be customized
 
 - parameter view: UIImage to customize
 */
func secectionImagesDresser(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.cgColor
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
func viewGeneralCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.cgColor
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
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
    view.backgroundColor = PopulatedStarsTexture
    
}
/**
 Sets Logo to be customized
 
 - parameter view: Logo to customize
 */
func logoCustomization(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 7
    view.layer.borderColor = RawGoldTexture.cgColor
}
/**
 Sets images to be customized
 
 - parameter view: Logo to customize
 */
func imageCustomization(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5
    view.layer.borderColor = UIColor.init(patternImage: UIImage(named: "coloredPatterns")!).cgColor
}
/**
 Sets selection Labels to be customized
 
 - parameter view: UILabel to customize
 */
func nameLabelCustomizer(_ view: UIView){
    view.layer.borderWidth = 3.0
    view.layer.borderColor = Gold.cgColor
    view.backgroundColor = LeatherTexture
}
/**
 Sets Wear button to be customized
 
 - parameter view: UIButton to customize
 */
func wearButtonAnimation(_ view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = RawGoldTexture.cgColor
    view.backgroundColor = StarCloudsTexture
    
}
/**
 Sets Label of number to be customized
 
 - parameter view: UILabel to customize
 */
func secectionNumberLabelDresser(_ view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 0.5
    view.backgroundColor = HardSandTexture
    view.layer.borderColor = LeatherTexture.cgColor
}
/**
 Sets option buttons to be customized
 
 - parameter view: UIButton to customize
 */
func optionViewCustomized(_ view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.scaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = DarkBlueJean.cgColor
    view.backgroundColor = LeatherTexture
}
/**
 Sets bar button to be customized
 
 - parameter view: UIBarButton to customize
 */
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

func vibrate(){
    //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations or sound if vibration not supported
    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations only
    
    
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
}


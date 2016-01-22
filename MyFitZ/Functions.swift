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



//MARK: -Generators
/**
Creates a String thats formated to go inside the views Title

- parameter closet: Current closet String
- parameter view:   Current view String

- returns: Both paramaters added together and formated
*/
func grabTitle(closet:String, view: String)->String{
    var string: String = String()
    string = view + "-" + closet
    return string
}



//MARK: -Sound Methods
/**
Plays sound effect from SystemSoundID number from param

- parameter soundID: SystemSoundID that represents a sound effect
*/
func playSoundEffects(soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
}
/**
 Initializes all SFX for game
 
 - returns: No return
 */
func initializeSounds() {
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
    })
}



//MARK: -Animations
/**
Animates app general buttons

- parameter view: Button to animate
*/
func buttonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.greenColor().CGColor
    //    view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
}


//MARK: -UIGestureActions
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
    button.animation.transformScale(0.2).animate(1.0)
}


//MARK: -WARDROBE Reference System
/**
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
/**
 -Takes a dictionary and look for specific values
 -If any are nil method returns bool all paths have to be clear
 - parameter path: Dictinary for path
 
 - returns: bool of true if all path values are not nil
 */
func validatePath(path: [String: String])->Bool{
    //    log.verbose("-VALIDATIING PATH ARRAY")
    let closet:String? = path[PathType.PATHTYPE_CLOSET_STRING]
    let category:String? = path[PathType.PATHTYPE_CATEGORY_STRING]
    let subCategory:String? = path[PathType.PATHTYPE_SUBCATEGORY_STRING]
    let id:String? = path[PathType.PATHTYPE_ID_STRING]
    let index:String? = path[PathType.PATHTYPE_INDEX_STRING]
    
    guard let _ = Int((id)!),  _ = Int((index)!) else{
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
}
/**
 Takes the path and needs validPath & validateItem to both be true to return true or the method returns false
 
 - parameter path: Dictionary path to verify
 
 - returns: Bool
 */
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
                sum++
                
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
                sum++
                
                newWardrobe.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
            }
        }
    }
    
    //Sets back current closet we're in
    newWardrobe.closetSelectionString = prevClosetSelection
    
    return newWardrobe
}




//MARK: -View Customization methods
/**
Sets selection Images to be customized

- parameter view: UIImage to customize
*/
func secectionImagesDresser(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = RawGoldTexture.CGColor
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
func viewGeneralCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2
    view.layer.borderColor = Stitching.CGColor
}
/**
 Sets Views to be customized
 
 - parameter view: Views to customize
 */
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
    view.backgroundColor = PopulatedStarsTexture
    
}
/**
 Sets Logo to be customized
 
 - parameter view: Logo to customize
 */
func logoCustomization(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 7
    view.layer.borderColor = RawGoldTexture.CGColor
}
/**
 Sets images to be customized
 
 - parameter view: Logo to customize
 */
func imageCustomization(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5
    view.layer.borderColor = UIColor.init(patternImage: UIImage(named: "coloredPatterns")!).CGColor
}
/**
 Sets selection Labels to be customized
 
 - parameter view: UILabel to customize
 */
func nameLabelCustomizer(view: UIView){
    view.layer.borderWidth = 3.0
    view.layer.borderColor = Gold.CGColor
    view.backgroundColor = LeatherTexture
}
/**
 Sets Wear button to be customized
 
 - parameter view: UIButton to customize
 */
func wearButtonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = RawGoldTexture.CGColor
    view.backgroundColor = StarCloudsTexture
    
}
/**
 Sets Label of number to be customized
 
 - parameter view: UILabel to customize
 */
func secectionNumberLabelDresser(view: UIView){
    //    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 0.5
    view.backgroundColor = HardSandTexture
    view.layer.borderColor = LeatherTexture.CGColor
}
/**
 Sets option buttons to be customized
 
 - parameter view: UIButton to customize
 */
func optionViewCustomized(view: UIView){
    view.layer.cornerRadius = 0.5 *  view.frame.size.width
    view.contentMode = UIViewContentMode.ScaleToFill
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3
    view.layer.borderColor = DarkBlueJean.CGColor
    view.backgroundColor = LeatherTexture
}
/**
 Sets bar button to be customized
 
 - parameter view: UIBarButton to customize
 */
func barButtonAnimation()(view: UIView){
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


func vibrate(){
    //AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations or sound if vibration not supported
    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))//Plays vibrations only
    
}


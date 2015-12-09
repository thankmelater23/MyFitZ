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
    string = closet + "-" + view
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
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("clear0", withExtension: "wav")!, &clearSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("save0", withExtension: "wav")!, &saveSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("delete0", withExtension: "wav")!, &deleteSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("edit0", withExtension: "wav")!, &editSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("add0", withExtension: "wav")!, &addSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("back0", withExtension: "wav")!, &backSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("mycloset0", withExtension: "wav")!, &closetSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("wishlist0", withExtension: "wav")!, &wishlistSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("wear0", withExtension: "wav")!, &wearSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("notification1", withExtension: "wav")!, &categorySFX)
    //    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("path", withExtension: "wav")!, &subCategorySFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("cellselect0", withExtension: "wav")!, &itemSelectSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("update0", withExtension: "wav")!, &updateSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("animationPop0", withExtension: "wav")!, &animationSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("alert0", withExtension: "wav")!, &incorrectSFX)
    AudioServicesCreateSystemSoundID(NSBundle.mainBundle().URLForResource("notification0", withExtension: "wav")!, &notificationSFX)
}

//MARK: -Animations
/**
Animates app general buttons

- parameter view: Button to animate
*/
func buttonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleAspectFit
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.greenColor().CGColor
//    view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
}
/**
 Sets selection Images to be customized
 
 - parameter view: UIImage to customize
 */
func secectionImagesDresser(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleAspectFit
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5
    view.layer.borderColor = UIColor.blueColor().CGColor
}
/**
 Sets selection Labels to be customized
 
 - parameter view: UILabel to customize
 */
func secectionImageLabelDresser(view: UIView){
    view.layer.borderWidth = 3.0
    view.layer.borderColor = UIColor.blackColor().CGColor
}
/**
 Sets Wear button to be customized
 
 - parameter view: UIButton to customize
 */
func wearButtonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleAspectFit
    
    view.clipsToBounds = true
    view.layer.borderWidth = 5.0
    view.layer.borderColor = UIColor.yellowColor().CGColor
}
/**
 Sets Label of number to be customized
 
 - parameter view: UILabel to customize
 */
func secectionNumberLabelDresser(view: UIView){
        view.layer.cornerRadius = view.frame.size.width / 10
        view.contentMode = UIViewContentMode.ScaleAspectFit
    
        view.clipsToBounds = true
    view.layer.borderWidth = 0.5
    view.layer.borderColor = UIColor.darkGrayColor().CGColor
}
/**
 Sets bar button to be customized
 
 - parameter view: UIBarButton to customize
 */
func barButtonAnimation()(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleAspectFit
    
    view.clipsToBounds = true
    view.layer.borderWidth = 3.0
    view.layer.borderColor = UIColor.blackColor().CGColor
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


//MARK: -WARDROBE
func returnItem(path: [String: String])->Item{
    //TODO:Set this method up to take data and get a item from wardrobe
    let validation = validatePath(path)//Validates that all values are available
    
    if validation == true{
        //Setting all variable to values of path
        let closet:String! = path[PATHTYPE_CLOSET_STRING]
        let category:String! = path[PATHTYPE_CATEGORY_STRING]
        let subCategory:String! = path[PATHTYPE_SUBCATEGORY_STRING]
        let id:Int! = Int(path[PATHTYPE_ID_STRING]!)
        let index:Int! = Int(path[PATHTYPE_INDEX_STRING]!)

        //Setting wardrobes correct closet
        /// TODO: -Set this back or you might end up in wrong closet
        let previousWardrobe = Users_Wardrobe.closetSelectionString
        //Gets value from path of item
        Users_Wardrobe.closetSelectionString = closet
        let array = Users_Wardrobe.returnArrayOfItems(category, funcSubCategory: subCategory)
        let item = array[index]
        
        //Sets back wardrobe to correct closet
        Users_Wardrobe.closetSelectionString = previousWardrobe
        
        //Returns item if path is 100% clear, if not it is searched in the array anf if not in array updating isnt working bad problem!!!!
        if item.id == id{
            print("Item id matched on return to item")
            return item
        }else{
            print("Item id did not match on return to item, search initiated")
            for searchItem in array{
                if searchItem.id == id{
                    print("Search success item found with in the array")
                    return searchItem
                }else{
                    assertionFailure("Search Failed item nout found with in the array or at id number BIG FUCKING ERROR*TIP:ID IS NOT UPDATING WHEN ITS PATH IS CHANGED")
                    return Item()
                }
            }
        }
    }else{
        assertionFailure("Validation failed value is missing from path BIG FUCKING ERROR*TIP:ID IS NOT UPDATING WHEN ITS PATH IS CHANGED")
        return Item()
    }
    //Looks for item at category/subcategory/index
    //Match id number with items id number
    //If numnber doesnt match search category/subcategory items
    //Check if id matches with any of the items in array
    //If doesn't exist return an error type
    return Item()
}

func updateItemIds(pathTuple: (closet: String, id: Int, category: String, subCategory: String, index: Int), secondPathTuple: (closet: String, id: Int, category: String, subCategory: String, index: Int)){
    //TODO:When path changes update places where id might be different
    //Checks places for items tuple id
    //Check favoritesItems
    //Check RecentlyWornItems
    //when found update with new tuple id number
    
}
/**
 -Takes a dictionary and look for specific values
 -If any are nil method returns bool all paths have to be clear
 - parameter path: Dictinary for path
 
 - returns: bool of true if all path values are not nil
 */
func validatePath(path: [String: String])->Bool{
    print("-VALIDATIING PATH ARRAY")
    let closet:String? = path[PATHTYPE_CLOSET_STRING]
    let category:String? = path[PATHTYPE_CATEGORY_STRING]
    let subCategory:String? = path[PATHTYPE_SUBCATEGORY_STRING]
    let id:Int? = Int(path[PATHTYPE_ID_STRING]!)
    let index:Int? = Int(path[PATHTYPE_INDEX_STRING]!)
    
    if closet != nil && category != nil && subCategory != nil && id != nil && index != nil{
        print("-VALIDATIING PASSED ALL VALUES NON NIL")
        return true
    }else{
        print("-VALIDATIING FAILED ONE OR ALL ARE NIL")
        return false
    }
}

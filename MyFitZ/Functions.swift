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

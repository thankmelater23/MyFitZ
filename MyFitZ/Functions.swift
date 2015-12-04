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
func createUserId(){
    //TODO: -Add create user id
    //standard defaults
    //Get value for bool isNew
    //If true get last id from system assign to self, increment system value, save back to system
    //set in stadard defaults the id
}



//MARK: -Generators
func grabTitle(closet:String, view: String)->String{
    var string: String = String()
    string = closet + "/" + view
    return string
}



//MARK: -Sound Methods
func playSoundEffects(soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
}
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
func buttonAnimation(view: UIView){
    view.layer.cornerRadius = view.frame.size.width / 10
    view.contentMode = UIViewContentMode.ScaleAspectFit
    
    view.clipsToBounds = true
    view.layer.borderWidth = 2.0
    view.layer.borderColor = UIColor.greenColor().CGColor
    
    
    //        self.searchButton.animation.makeScale(0.0).animate(0.0)
    view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
    
//    title = grabTitle(gamesWardrobe.closetSelectionString, view: "Selection")
//    if self.title == MY_CLOSET{
//        self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
//    }else if self.title == MY_WANTS_CLOSET{
//        self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
//    }
    
    func wearButtonAnimation(view: UIView){
        view.layer.cornerRadius = view.frame.size.width / 20
        view.contentMode = UIViewContentMode.ScaleAspectFit
        
        view.clipsToBounds = true
        view.layer.borderWidth = 2.5
        view.layer.borderColor = UIColor.blackColor().CGColor
        
        
        //        self.searchButton.animation.makeScale(0.0).animate(0.0)
        view.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScale(1.0).animate(0.3)
        
        //    title = grabTitle(gamesWardrobe.closetSelectionString, view: "Selection")
        //    if self.title == MY_CLOSET{
        //        self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        //    }else if self.title == MY_WANTS_CLOSET{
        //        self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        //    }
    }
}




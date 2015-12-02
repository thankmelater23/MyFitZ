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

func grabTitle(closet:String, view: String)->String{
    var string: String = String()
    string = closet + "/" + view
    return string
}

//func playSoundEffects(url:NSURL){
//    do{
//        let sound = try AVAudioPlayer(contentsOfURL: url)
//        audioPlayer = sound
//        audioPlayer.play()
//        print("Played SFX: " + url.path!)
//    }catch{
//        assertionFailure("Sound didn't play")
//    }
//    
//}
//
//func stopSoundEffects(){
//    if audioPlayer != nil{
//        audioPlayer.stop()
////        audioPlayer = nil
//    }
//}

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

func playSoundEffects(soundID: SystemSoundID) {
    AudioServicesPlaySystemSound(soundID)
}


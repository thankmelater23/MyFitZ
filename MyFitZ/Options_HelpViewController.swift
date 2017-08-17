//
//  Options_HelpViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
<<<<<<< HEAD
//import Crashlytics
=======
import Crashlytics
>>>>>>> MyFitZOld/master

class Options_HelpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
<<<<<<< HEAD
//        defaults.addAndSend("HELP_PAGE_COUNT")
=======
        defaults.addAndSend("HELP_PAGE_COUNT")
>>>>>>> MyFitZOld/master
        
    }
    
    
<<<<<<< HEAD
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
=======
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
>>>>>>> MyFitZOld/master
    }
    
    @IBAction func playInstruction() {
//        playSoundEffects(closetSFX)
        
<<<<<<< HEAD
        performSegue(withIdentifier: Segue.SEGUE_HELP_TO_INSTRUCTIONS, sender: self)
=======
        performSegueWithIdentifier(Segue.SEGUE_HELP_TO_INSTRUCTIONS, sender: self)
>>>>>>> MyFitZOld/master
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-Options_HelpViewController Exension
extension Options_HelpViewController{
    
}



//MARK: -Animations-Options_HelpViewController Extension
extension Options_HelpViewController{
<<<<<<< HEAD
    @objc func animateAllButtons(){
=======
    func animateAllButtons(){
>>>>>>> MyFitZOld/master
        //            self.animateFeatureButtons()
        //            self.animateLogo()
        //            self.animateOptionButtons()
        //
        
    }
<<<<<<< HEAD
    @objc func animateLogo(){
        //            logoCustomization(self.logoImage)
    }
    @objc func animateFeatureButtons(){
        //            cloesetButtonCustomization(self.closetButton)
        //            cloesetButtonCustomization(self.wishListButton)
    }
    @objc func animateOptionButtons(){
        //            optionViewCustomized(self.optionsButton)
    }
    @objc func setButtonsView(){
=======
    func animateLogo(){
        //            logoCustomization(self.logoImage)
    }
    func animateFeatureButtons(){
        //            cloesetButtonCustomization(self.closetButton)
        //            cloesetButtonCustomization(self.wishListButton)
    }
    func animateOptionButtons(){
        //            optionViewCustomized(self.optionsButton)
    }
    func setButtonsView(){
>>>>>>> MyFitZOld/master
        //            buttonAnimation(self.closetButton)
        //            buttonAnimation(self.wishListButton)
    }
}

//MARK: -Anylitics-Options_HelpViewController Extension
<<<<<<< HEAD
//extension Options_HelpViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("HELP_PAGE_COUNT")
//            
//            
//            
//            
//            Answers.logContentView(withName: "Help View Content View",
//                contentType: "Options Menu",
//                contentId: "MF17",
//                customAttributes: ["HELP_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}
=======
extension Options_HelpViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("HELP_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("Help View Content View",
                contentType: "Options Menu",
                contentId: "MF17",
                customAttributes: ["HELP_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
>>>>>>> MyFitZOld/master

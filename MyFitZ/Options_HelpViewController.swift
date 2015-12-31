//
//  Options_HelpViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import Crashlytics

class Options_HelpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(__FUNCTION__)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
        defaults.addAndSend("HELP_PAGE_COUNT")
        
    }
    
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
    
    @IBAction func playInstruction() {
//        playSoundEffects(closetSFX)
        
        performSegueWithIdentifier(SEGUE_HELP_TO_INSTRUCTIONS, sender: self)
    }
}



//MARK: - Animations-Options_HelpViewController Exension
extension Options_HelpViewController{
    
}



//MARK: -Animations-Options_HelpViewController Extension
extension Options_HelpViewController{
    func animateAllButtons(){
        //            self.animateFeatureButtons()
        //            self.animateLogo()
        //            self.animateOptionButtons()
        //
        
    }
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
        //            buttonAnimation(self.closetButton)
        //            buttonAnimation(self.wishListButton)
    }
}

//MARK: -Anylitics-Options_HelpViewController Extension
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
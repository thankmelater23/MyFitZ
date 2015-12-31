
//
//  OptionsViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import Crashlytics

class OptionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(__FUNCTION__)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        //let defaults = NSUserDefaults.standardUserDefaults()
        defaults.addAndSend("OPTIONS_PAGE_COUNT")
        
    }
    
    @IBAction func clickedHelp() {
        log.info("Help Selected")
        self.performSegueWithIdentifier(SEGUE_OPTIONS_TO_HELP, sender: self)
    }
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
}



//MARK: - Animations-OptionsViewController Exension
extension OptionsViewController{
    
}



//MARK: -Animations-OptionsViewController Extension
extension OptionsViewController{
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

//MARK: -Anylitics-OptionsViewController Extension
extension OptionsViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            //let defaults = NSUserDefaults.standardUserDefaults()
            
            let pageCount:Int? = defaults.returnIntValue("OPTIONS_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("Options View Content View",
                contentType: "Options Menu",
                contentId: "MF13",
                customAttributes: ["OPTIONS_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
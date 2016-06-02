//
//  Options-SettingsViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//



import UIKit
import Crashlytics

class Options_SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
        defaults.addAndSend("SETTINGS_PAGE_COUNT")
        
    }
    
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-Options_SettingsViewController Exension
extension Options_SettingsViewController{
    
}



//MARK: -Animations-Options_SettingsViewController Extension
extension Options_SettingsViewController{
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

//MARK: -Anylitics-Options_SettingsViewController Extension
extension Options_SettingsViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("SETTINGS_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("Settings View Content View",
                contentType: "Options Menu",
                contentId: "MF15",
                customAttributes: ["SETTINGS_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
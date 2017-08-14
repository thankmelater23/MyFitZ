//
//  Options-SettingsViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//



import UIKit
//import Crashlytics

class Options_SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
//        defaults.addAndSend("SETTINGS_PAGE_COUNT")
        
    }
    
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    deinit{
        //log.info(#function)
        
    }
}



//MARK: - Animations-Options_SettingsViewController Exension
extension Options_SettingsViewController{
    
}



//MARK: -Animations-Options_SettingsViewController Extension
extension Options_SettingsViewController{
    @objc func animateAllButtons(){
        //            self.animateFeatureButtons()
        //            self.animateLogo()
        //            self.animateOptionButtons()
        //
        
    }
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
        //            buttonAnimation(self.closetButton)
        //            buttonAnimation(self.wishListButton)
    }
}

//MARK: -Anylitics-Options_SettingsViewController Extension
//extension Options_SettingsViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("SETTINGS_PAGE_COUNT")
//            
//            
//            
//            
//            Answers.logContentView(withName: "Settings View Content View",
//                contentType: "Options Menu",
//                contentId: "MF15",
//                customAttributes: ["SETTINGS_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}

//
//  Options-SettingsViewController.swift
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

class Options_SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
<<<<<<< HEAD
//        defaults.addAndSend("SETTINGS_PAGE_COUNT")
=======
        defaults.addAndSend("SETTINGS_PAGE_COUNT")
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
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-Options_SettingsViewController Exension
extension Options_SettingsViewController{
    
}



//MARK: -Animations-Options_SettingsViewController Extension
extension Options_SettingsViewController{
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

//MARK: -Anylitics-Options_SettingsViewController Extension
<<<<<<< HEAD
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
=======
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
>>>>>>> MyFitZOld/master

//
//  Options-AboutViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//


import UIKit
import Crashlytics

class Options_AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info("ViewLoaded")
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        //let defaults = NSUserDefaults.standardUserDefaults()
        defaults.addAndSend("ABOUT_PAGE_COUNT")
        
    }
    
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
}



//MARK: - Animations-Options_AboutViewController Exension
extension Options_AboutViewController{
    
}



//MARK: -Animations-Options_AboutViewController Extension
extension Options_AboutViewController{
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

//MARK: -Anylitics-Options_AboutViewController Extension
extension Options_AboutViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            //let defaults = NSUserDefaults.standardUserDefaults()
            
            let pageCount:Int? = defaults.returnIntValue("ABOUT_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("About View Content View",
                contentType: "About Menu",
                contentId: "MF16",
                customAttributes: ["ABOUT_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
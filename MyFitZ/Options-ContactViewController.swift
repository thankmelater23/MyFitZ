//
//  Options-ContactViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//



import UIKit
import Crashlytics

class Options_ContactViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(__FUNCTION__)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
        defaults.addAndSend("CONTACT_PAGE_COUNT")
        
    }
    
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
}



//MARK: - Animations-Options_ContactViewController Exension
extension Options_ContactViewController{
    
}



//MARK: -Animations-Options_ContactViewController Extension
extension Options_ContactViewController{
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

//MARK: -Anylitics-Options_ContactViewController Extension
extension Options_ContactViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("CONTACT_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("Contact View Content View",
                contentType: "Options Menu",
                contentId: "MF14",
                customAttributes: ["CONTACT_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
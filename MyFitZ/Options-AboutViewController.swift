//
//  Options-AboutViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//


import UIKit
//import Crashlytics

class Options_AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
//        defaults.addAndSend("ABOUT_PAGE_COUNT")
        
    }
    
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-Options_AboutViewController Exension
extension Options_AboutViewController{
    
}



//MARK: -Animations-Options_AboutViewController Extension
extension Options_AboutViewController{
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

//MARK: -Anylitics-Options_AboutViewController Extension
//extension Options_AboutViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("ABOUT_PAGE_COUNT")
//            
//            Answers.logContentView(withName: "About View Content View",
//                contentType: "About Menu",
//                contentId: "MF16",
//                customAttributes: ["ABOUT_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}

//
//  Options-AboutViewController.swift
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

class Options_AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
<<<<<<< HEAD
//        defaults.addAndSend("ABOUT_PAGE_COUNT")
=======
        defaults.addAndSend("ABOUT_PAGE_COUNT")
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



//MARK: - Animations-Options_AboutViewController Exension
extension Options_AboutViewController{
    
}



//MARK: -Animations-Options_AboutViewController Extension
extension Options_AboutViewController{
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

//MARK: -Anylitics-Options_AboutViewController Extension
<<<<<<< HEAD
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
=======
extension Options_AboutViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("ABOUT_PAGE_COUNT")
            
            Answers.logContentViewWithName("About View Content View",
                contentType: "About Menu",
                contentId: "MF16",
                customAttributes: ["ABOUT_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
>>>>>>> MyFitZOld/master

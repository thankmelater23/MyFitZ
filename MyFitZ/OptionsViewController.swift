
//
//  OptionsViewController.swift
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

class OptionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
<<<<<<< HEAD
//        defaults.addAndSend("OPTIONS_PAGE_COUNT")
=======
        defaults.addAndSend("OPTIONS_PAGE_COUNT")
>>>>>>> MyFitZOld/master
        
    }
    
    @IBAction func clickedHelp() {
        log.info("Help Selected")
<<<<<<< HEAD
        self.performSegue(withIdentifier: Segue.SEGUE_OPTIONS_TO_HELP, sender: self)
    }
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
=======
        self.performSegueWithIdentifier(Segue.SEGUE_OPTIONS_TO_HELP, sender: self)
    }
    
    func setTitle(){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
>>>>>>> MyFitZOld/master
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-OptionsViewController Exension
extension OptionsViewController{
    
}



//MARK: -Animations-OptionsViewController Extension
extension OptionsViewController{
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

//MARK: -Anylitics-OptionsViewController Extension
<<<<<<< HEAD
//extension OptionsViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("OPTIONS_PAGE_COUNT")
//            
//            
//            
//            
//            Answers.logContentView(withName: "Options View Content View",
//                contentType: "Options Menu",
//                contentId: "MF13",
//                customAttributes: ["OPTIONS_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}
=======
extension OptionsViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("OPTIONS_PAGE_COUNT")
            
            
            
            
            Answers.logContentViewWithName("Options View Content View",
                contentType: "Options Menu",
                contentId: "MF13",
                customAttributes: ["OPTIONS_PAGE_COUNT": pageCount!
                ])
            }
        )}
}
>>>>>>> MyFitZOld/master

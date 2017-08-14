
//
//  OptionsViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
//import Crashlytics

class OptionsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
//        defaults.addAndSend("OPTIONS_PAGE_COUNT")
        
    }
    
    @IBAction func clickedHelp() {
        //log.info("Help Selected")
        self.performSegue(withIdentifier: Segue.SEGUE_OPTIONS_TO_HELP, sender: self)
    }
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    deinit{
        //log.info(#function)
        
    }
}



//MARK: - Animations-OptionsViewController Exension
extension OptionsViewController{
    
}



//MARK: -Animations-OptionsViewController Extension
extension OptionsViewController{
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

//MARK: -Anylitics-OptionsViewController Extension
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

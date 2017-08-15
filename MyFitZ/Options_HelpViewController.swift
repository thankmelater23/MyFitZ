//
//  Options_HelpViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
//import Crashlytics

class Options_HelpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        
//        defaults.addAndSend("HELP_PAGE_COUNT")
        
    }
    
    
    @objc func setTitle(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @IBAction func playInstruction() {
//        playSoundEffects(closetSFX)
        
        performSegue(withIdentifier: Segue.SEGUE_HELP_TO_INSTRUCTIONS, sender: self)
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Animations-Options_HelpViewController Exension
extension Options_HelpViewController{
    
}



//MARK: -Animations-Options_HelpViewController Extension
extension Options_HelpViewController{
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

//MARK: -Anylitics-Options_HelpViewController Extension
//extension Options_HelpViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("HELP_PAGE_COUNT")
//            
//            
//            
//            
//            Answers.logContentView(withName: "Help View Content View",
//                contentType: "Options Menu",
//                contentId: "MF17",
//                customAttributes: ["HELP_PAGE_COUNT": pageCount!
//                ])
//            }
//        )}
//}

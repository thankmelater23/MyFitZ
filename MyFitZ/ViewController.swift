
//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics



//MARK: -ViewController Class
class ViewController:  UIViewController{
    //MARK: -Outlets
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var optionsButton: UIButton!
    
    
    //MARK: -Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        initializeSounds()
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.addAndSend("MAIN_PAGE_COUNT")
        
        self.logPageView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTitle(){
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = false
        
        self.title = Users_Wardrobe.closetSelectionString
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
    }
}



//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset() {
        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_CLOSET
        playSoundEffects(closetSFX)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        self.logPageView()
        
        performSegueWithIdentifier(SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedWants() {
        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_WANTS_CLOSET
        playSoundEffects(wishlistSFX)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.addAndSend("WISHLIST_SELECTION_COUNT")
        
        self.logPageView()
        performSegueWithIdentifier(SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func crashButtonTapped(sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }
}


//MARK: - Animations-ViewController Exension
extension ViewController{
    func setButtonsView(){
        buttonAnimation(self.closetButton)
        buttonAnimation(self.wishListButton)
    }
}



//MARK: -Animations-ViewController Extension
extension ViewController{
    func animateAllButtons(){
        //        self.animateSearchButton()
        //        self.animateStarButton()
        //        self.animateHamperButton()
        //        self.animateSearchButton()
        //        self.animatePictureLabels()
        //        self.animatePictureImages()
        //        self.animateNumberLabels()
        //        self.animateTrashButton()
        self.animateLogo()
        self.animateOptionButtons()
        //        self.animateViews()
        
    }
    func animateLogo(){
        logoCustomization(self.logoImage)
    }
    func animateFeatureButtons(){
    }
    func animateOptionButtons(){
        optionViewCustomized(self.optionsButton)
    }
}

//MARK: -Anylitics-ViewController Extension
extension ViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let pageCount:Int? = defaults.returnIntValue("MAIN_PAGE_COUNT")
            
            let closetSelectionCount:Int? = defaults.returnIntValue("CLOSET_SELECTION_COUNT")
            
            let wishListSelectionCount:Int? = defaults.returnIntValue("WISHLIST_SELECTION_COUNT")
            
            
            
            Answers.logContentViewWithName("Main View Content View",
                contentType: "Main Menu",
                contentId: "MF1",
                customAttributes: ["MAIN_PAGE_COUNT": pageCount!,
                    "CLOSET_SELECTION_COUNT": closetSelectionCount!,
                    "WISHLIST_SELECTION_COUNT": wishListSelectionCount!
                ])
            }
        )}
}
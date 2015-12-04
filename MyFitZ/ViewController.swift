
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
    
    
    
    //MARK: -Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        initializeSounds()
        self.setButtonsView()
        
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = false
        
        self.title = gamesWardrobe.closetSelectionString
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //        let button = UIButton(type: UIButtonType.RoundedRect)
        //        button.frame = CGRectMake(100, 100, 200, 200)
        //        button.setTitle("Crash", forState: UIControlState.Normal)
        //        button.addTarget(self, action: "crashButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        //        view.addSubview(button)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("MAIN_PAGE_COUNT")
        
        self.logPageView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset() {
        gamesWardrobe = gamesWardrobe.loadAndCreateCloset()
        gamesWardrobe.closetSelectionString = MY_CLOSET
        playSoundEffects(closetSFX)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        self.logPageView()
        
        performSegueWithIdentifier(SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedWants() {
        gamesWardrobe = gamesWardrobe.loadAndCreateCloset()
        gamesWardrobe.closetSelectionString = MY_WANTS_CLOSET
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


    
//MARK: -Anylitics-ViewController Extension
extension ViewController{
    func logPageView(){
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
}
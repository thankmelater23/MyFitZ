
//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics
import Parse


//MARK: -ViewController Class
class ViewController:  UIViewController{
    //MARK: -Outlets
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var optionsButton: UIButton!
    
    //MARK: -Methods
    override func viewDidLoad(){
        log.info(__FUNCTION__)
        super.viewDidLoad()
        log.info(__FUNCTION__)
        self.setButtonsView()
        self.setTitle()
        self.animateAllButtons()
        self.view.backgroundColor = Cotton
        self.appSettings()
        
        defaults.addAndSend("MAIN_PAGE_COUNT")
        
        self.logPageView()
    }
    override func viewDidAppear(animated: Bool) {
        // 1
        let nav = self.navigationController?.navigationBar
        // 2
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = RawGoldTexture
        
        
        // 3
        //        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        //        imageView.contentMode = .ScaleAspectFit
        // 4
        //        let image = UIImage(named: "Apple_Swift_Logo")
        //        imageView.image = image
        // 5
        //        navigationItem.titleView = imageView
        
        //        navigationItem.rightBarButtonItem?.customView?.backgroundColor = LeatherTexture
        //        navigationItem.leftBarButtonItem?.customView?.backgroundColor = LeatherTexture
    }
    override func didReceiveMemoryWarning() {
        log.info(__FUNCTION__)
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
    }
    func setTitle(){
        log.info(__FUNCTION__)
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = false
        
        self.title = Users_Wardrobe.closetSelectionString
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
    }
    deinit{
        log.info(__FUNCTION__)
        
    }
}



//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset() {
        log.info(__FUNCTION__)
        //        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_CLOSET
        playSoundEffects(closetSFX)
        
        
        
        defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        self.logPageView()
        
        performSegueWithIdentifier(Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedWants() {
        log.info(__FUNCTION__)
        //        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_WANTS_CLOSET
        playSoundEffects(wishlistSFX)
        
        
        defaults.addAndSend("WISHLIST_SELECTION_COUNT")
        
        self.logPageView()
        performSegueWithIdentifier(Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedOptions() {
        log.info(__FUNCTION__)
        self.performSegueWithIdentifier(Segue.SEGUE_MAIN_TO_OPTIONS, sender: self)
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
        self.animateFeatureButtons()
        self.animateLogo()
        self.animateOptionButtons()
        
        
    }
    func animateLogo(){
        logoCustomization(self.logoImage)
    }
    func animateFeatureButtons(){
        cloesetButtonCustomization(self.closetButton)
        cloesetButtonCustomization(self.wishListButton)
    }
    func animateOptionButtons(){
        optionViewCustomized(self.optionsButton)
    }
}

//MARK: -Anylitics-ViewController Extension
extension ViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
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
    func appSettings(){
//        let userLovesUs = NSUserDefaults.standardUserDefaults().valueForKey("DoYouLoveUs") as! Bool?
//        var theLove = String()
//        
//        if userLovesUs != nil && userLovesUs != false{
//            theLove = "You love us and we love you"
//        }else{
//            theLove = "You dont love us, but we love you"
//        }
//        let alert = UIAlertController(title: "Do You Love Us?", message: theLove, preferredStyle: UIAlertControllerStyle.Alert)
//        
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        self.presentViewController(alert, animated: true, completion:nil)
        
    }
}
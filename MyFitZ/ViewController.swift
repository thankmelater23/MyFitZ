<<<<<<< HEAD
//
//  ViewController.swift
//  MyFitZ
//
//  Created by Andre V on 4/22/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import UIKit
import CoreData 

class ViewController: UIViewController {
    
=======

//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics
//import Parse
import CoreData

//MARK: -ViewController Class
class ViewController:  UIViewController{
>>>>>>> MyFitZOld/master
    //MARK: -Outlets
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var optionsButton: UIButton!
    
<<<<<<< HEAD
    //MARK: -Variables
    var user: User? = nil
    var userNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.clearDefaultsPath()
        self.setUser()
        self.loggerFix()
        self.setTitle()
        self.appSettings()
        
        
    }
    override func viewDidAppear(_ animated: Bool){
        self.navCustomized()
    }
    override func viewWillAppear(_ animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        
    }
    override func didReceiveMemoryWarning() {
        log.info(#function)
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
        
    }
    deinit{
        log.info(#function)
    }
    
    //MARK: - Core Data
    
    //MARK: - Custom Functions
    @objc func setUser(){
        //TODO: - Make a global define
        let lastUserLoggedIn = "lastUserLoggedIn"
        let number = closetTypeGlobal.closet
        userNumber = UserDefaults.standard.object(forKey: lastUserLoggedIn) as!  Int?
        
        if userNumber == nil{
            UserDefaults.standard.set(number, forKey: lastUserLoggedIn)
        }
        
        user = self.fetchUser(userNumber: Int(number))
        
        guard let _ = user else{
            User.createUsers()
            user = self.fetchUser(userNumber: Int(number))
            return
        }
    }
    
    @objc func clearDefaultsPath(){
        //Variables
        let lastUserLoggedIn = "lastUserLoggedIn"
        let categoryPath = "categoryPath"
        let subCategoryPath = "subCategoryPath"
        let itemIndexPath = "itemIndexPath"
        
        //Reset path
        defaults.set(nil, forKey: lastUserLoggedIn)
        defaults.set(nil, forKey: categoryPath)
        defaults.set(nil, forKey: subCategoryPath)
        defaults.set(nil, forKey: itemIndexPath)
    }
    
    @objc func loggerFix(){
        log.verbose("\n\n\n\n\n\n")
    }
    
    @objc func fetchUser(userNumber: Int)->User{
        do{
            var users = try DataBaseController.getContext().fetch(User.fetchRequest()) as [User]?
            
            if users?.count == 2{
                if userNumber == 0 {return users!.first!}else if userNumber == 1{return users!.last!}
                
            }
            else{
                User.createUsers()
                users = try DataBaseController.getContext().fetch(User.fetchRequest()) as [User]?
                if userNumber == 0 {return users!.first!}else if userNumber == 1{return users!.last!}
            }
        }catch{
            
            log.warning("Didn't fetch")
            User.createUsers()
            do{
                let users = try DataBaseController.getContext().fetch(User.fetchRequest()) as [User]?
                
                if users?.count == 2{
                    if userNumber == 0 {return users!.first!}else if userNumber == 1{return users!.last!}
                    
                }
                if userNumber == 0 {return users!.first!}else if userNumber == 1{return users!.last!}
            }catch{
                print("Why the fuck is this happening")
                return User()
            }
        }
        return User()
    }
    
    func setTitle(){
        log.info(#function)
        //        self.navigationController?.isNavigationBarHidden = true
        //        self.navigationController?.navigationBar.isTranslucent = false
        
        //        self.title = user?.name
        //        if self.title == MY_CLOSET{
        //            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        //        }else if self.title == MY_WANTS_CLOSET{
        //            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        //        }
    }
    
    //MARK Settings
    @objc func appSettings(){
        //        let userLovesUs = defaults.value(forKey: "DoYouLoveUs") as! Bool?
        //        var theLove = String()
        //
        //        if userLovesUs != nil && userLovesUs != false{
        //            theLove = "You love us and we love you"
        //        }else{
        //            theLove = "You dont love us, but we love you"
        //        }
        //        let alert = UIAlertController(title: "Do You Love Us?", message: theLove, preferredStyle: UIAlertControllerStyle.alert)
        //
        //        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: nil))
        //        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        //        self.present(alert, animated: true, completion:nil)
    }
    @objc func navCustomized(){
        //        // 1
        //        let nav = self.navigationController?.navigationBar
        //        // 2
        //        nav?.barStyle = UIBarStyle.black
        //        nav?.tintColor = RawGoldTexture
=======
    //MARK: -Methods
    override func viewDidLoad(){
        log.info(#function)
        super.viewDidLoad()
        log.info(#function)
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
>>>>>>> MyFitZOld/master
        
        
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
<<<<<<< HEAD
}

//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset(){
        log.info(#function)
        user?.closetType = closetTypeGlobal.closet
=======
    override func didReceiveMemoryWarning() {
        log.info(#function)
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
    }
    func setTitle(){
        log.info(#function)
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
        log.info(#function)
        self.view.layer
    }
}



//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset() {
        log.info(#function)
        //        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_CLOSET
>>>>>>> MyFitZOld/master
        playSoundEffects(closetSFX)
        
        
        
<<<<<<< HEAD
        //                defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        //                self.logPageView()
        
        performSegue(withIdentifier: Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedWants(){
        log.info(#function)
        user?.closetType = closetTypeGlobal.wishList
        playSoundEffects(wishlistSFX)
        
        
        //                defaults.addAndSend("WISHLIST_SELECTION_COUNT")
        
        //                self.logPageView()
        performSegue(withIdentifier: Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedOptions(){
        log.info(#function)
        self.performSegue(withIdentifier: Segue.SEGUE_MAIN_TO_OPTIONS, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        defer{
            log.verbose("Segue transfer: \(String(describing: segue.identifier))")
        }
        
        if segue.identifier == Segue.SEGUE_MAIN_TO_SELECTION{
            let selectionViewController: SelectionViewController! = segue.destination as! SelectionViewController
//            selectionViewController.wardrobe = user?.getWardrobe()
        }
    }
}

=======
        defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        self.logPageView()
        
        performSegueWithIdentifier(Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedWants() {
        log.info(#function)
        //        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        Users_Wardrobe.closetSelectionString = MY_WANTS_CLOSET
        playSoundEffects(wishlistSFX)
        
        
        defaults.addAndSend("WISHLIST_SELECTION_COUNT")
        
        self.logPageView()
        performSegueWithIdentifier(Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    @IBAction func selectedOptions() {
        log.info(#function)
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
>>>>>>> MyFitZOld/master

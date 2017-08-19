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
    
    //MARK: -Outlets
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var optionsButton: UIButton!
    
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
//    func createConfetti(){
//        let confettiView = SAConfettiView(frame: self.view.bounds)
//        self.view.addSubview(confettiView)
//        confettiView.type = .Star
//        confettiView.colors = [UIColor.redColor(), UIColor.whiteColor(), UIColor.blueColor()]
//        confettiView.intensity = 0.75
//        confettiView.startConfetti()
//        //confettiView.stopConfetti()
//        let confettiOn = confettiView.isActive() as! Bool
//        log.info("Is confetti running: \(confettiOn)")
//    }
}

//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset(){
        log.info(#function)
        user?.closetType = closetTypeGlobal.closet
        playSoundEffects(closetSFX)
        
        
        
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


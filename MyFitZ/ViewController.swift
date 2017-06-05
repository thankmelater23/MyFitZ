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
    func setUser(){
        //TODO: - Make a global define
        let lastUserLoggedIn = "lastUserLoggedIn"
        let number = "0"
        let userNumber = UserDefaults.standard.object(forKey: lastUserLoggedIn)
        
        if userNumber != nil{
            UserDefaults.standard.set(number, forKey: lastUserLoggedIn)
        }
        
        user = self.fetchUser(userNumber: Int(number)!)
        
    }
    
    func clearDefaultsPath(){
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
    
    func loggerFix(){
        log.verbose("\n\n\n\n\n\n")
    }
    
    func fetchUser(userNumber: Int)->User{
        do{
            
            let users = try DataBaseController.getContext().fetch(User.fetchRequest()) as [User]
            //TODO: - Fix this to take multiple users
            return users.first!
        }catch{
            
            log.warning("Didn't fetch")
         return User()
        }
        return User()
    }
    
}

//MARK: -Actions-ViewController Extension
extension ViewController{
    @IBAction func selectedCloset(){
        log.info(#function)
        user?.closetType = closetTypeGlobal.closet
        playSoundEffects(closetSFX)
        
        
        
        //                defaults.addAndSend("CLOSET_SELECTION_COUNT")
        
        //                self.logPageView()
        
//        performSegue(withIdentifier: Segue.SEGUE_MAIN_TO_SELECTION, sender: self)
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
    
    
}

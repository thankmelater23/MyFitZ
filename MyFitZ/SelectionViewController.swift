//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
import DKChainableAnimationKit
import Crashlytics

//MARK: - SelectionViewController
class SelectionViewController: UIViewController{
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var topCounter: UILabel!
    @IBOutlet weak var bottomCounter: UILabel!
    @IBOutlet weak var footwareCounter: UILabel!
    @IBOutlet weak var underClothesCounter: UILabel!
    @IBOutlet weak var headwareCounter: UILabel!
    @IBOutlet weak var accessoriesCounter: UILabel!
    var selectedUser: Int! = 0//Check on what this is
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    //View IBActions
    ///An action that takes the buttonn(sender).text and stores it into categoryString
    @IBAction func categoryIsButtonName(sender: UIButton) {
        path[PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!
        playSoundEffects(categorySFX)
//        self.performSegueWithIdentifier(SEGUE_SELECTION_TO_MAKE, sender: self)
    }
    @IBAction func backButton(sender: AnyObject) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_SELECTION_TO_MAIN, sender: self)
    }
    @IBAction func favoriteButton() {
        performSegueWithIdentifier(SEGUE_SELECTION_TO_FAVORITED, sender: self)
    }
    @IBAction func hamperButton() {
        performSegueWithIdentifier(SEGUE_SELECTION_TO_RECENT, sender: self)
    }
    
    //View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
            
        self.searchButton.animation.makeScale(2.5).makeScale(0.5).makeScale(1.0).animate(2.0)
        
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Selection")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            NSBackgroundColorAttributeName: UIColor.purpleColor(),
//            NSFontAttributeName: "Chalkduster",
////            NSBackgroundColorAttributeName: UIColor.whiteColor(),
////            NSBackgroundColorAttributeName: UIColor.whiteColor(),
//            NSTextEffectAttributeName: NSTextEffectLetterpressStyle
//            ]
        
        self.assignCategoriesItemCount()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("SELECTION_PAGE_COUNT")
        
        self.logPageView()
        
    }
    func logPageView(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("SELECTION_PAGE_COUNT")
        
        Answers.logContentViewWithName("Main View Content View",
            contentType: "Category Selection Menu",
            contentId: "MF2",
            customAttributes: ["SELECTION_PAGE_COUNT": pageCount!
            ])
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_SELECTION_TO_MAKE{
            let makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
            makeController.path = self.path
        }else if segue.identifier == SEGUE_SELECTION_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = SEGUE_CREATION_TO_SELECTION
        }
    }
    func assignCategoriesItemCount(){
        var catCountDic: [String: Int] = [String: Int]()
        
        //TODO: -Add a GCD to load it in background
        for category in CATEGORY_PICKER_OPTIONS{
            catCountDic[category] = gamesWardrobe.getCountOfAllItemsInCategory(category)
        }
        
        topCounter.text = String(catCountDic[TOPS]!)
        bottomCounter.text = String(catCountDic[BOTTOMS]!)
        footwareCounter.text = String(catCountDic[FOOTWARE]!)
        underClothesCounter.text = String(catCountDic[UNDERCLOTHING]!)
        accessoriesCounter.text = String(catCountDic[ACCESSORIES]!)
        headwareCounter.text = String(catCountDic[HEADWARE]!)

        
        
    }
}



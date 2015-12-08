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

//MARK: -SelectionViewController Class
class SelectionViewController: UIViewController{
    //MARK: -Outlets
    //MARK: -Feature Buttons
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recentlyWonrItem: UIButton!
    @IBOutlet weak var favortiedItems: UIButton!
//        {
//        didSet{
//            let recognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
//            favortiedItems.addGestureRecognizer(recognizer)
//        }
//    }
    
    //MARK: -Selection Image Buttons
    @IBOutlet weak var topImage: UIButton!
    @IBOutlet weak var bottomImage: UIButton!
    @IBOutlet weak var footwareImage: UIButton!
    @IBOutlet weak var accessoriesImage: UIButton!
    @IBOutlet weak var underClothesImage: UIButton!
    @IBOutlet weak var headWareImage: UIButton!
    
    //MARK: -Selection labels
    @IBOutlet weak var topsLabel: UILabel!
    @IBOutlet weak var footwareLabel: UILabel!
    @IBOutlet weak var underClothesLabel: UILabel!
    @IBOutlet weak var headwareLabel: UILabel!
    @IBOutlet weak var accessoriesLabel: UILabel!
    @IBOutlet weak var bottomsLabel: UILabel!
    
    //MARK: -Selection Counter
    @IBOutlet weak var topCounter: UILabel!
    @IBOutlet weak var bottomCounter: UILabel!
    @IBOutlet weak var footwareCounter: UILabel!
    @IBOutlet weak var underClothesCounter: UILabel!
    @IBOutlet weak var headwareCounter: UILabel!
    @IBOutlet weak var accessoriesCounter: UILabel!
    
    
    //MARK: -Variables
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    
    //View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        
        self.animateAllButtons()
        
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



//MARK: -Actions-SelectionViewController Extension
extension SelectionViewController{
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
    
}



//MARK: -General-SelectionViewController Extension
extension SelectionViewController{
}



//MARK: -Animations-SelectionViewController Extension
extension SelectionViewController{
    func animateAllButtons(){
        self.animateSearchButton()
        self.animateStarButton()
        self.animateHamperButton()
        self.animateSearchButton()
        self.animatePictureLabels()
        self.animatePictureImages()
        animateNumberLabels()
    }
    func animateSearchButton(){
        self.searchButton.layer.cornerRadius = self.searchButton.frame.size.width / 10
        self.searchButton.contentMode = UIViewContentMode.ScaleAspectFit
        
        self.searchButton.clipsToBounds = true
        self.searchButton.layer.borderWidth = 2.0
        self.searchButton.layer.borderColor = UIColor.greenColor().CGColor
        
        
        //        self.searchButton.animation.makeScale(0.0).animate(0.0)
        //        self.searchButton.animation.delay(1.0).animate(0.0).easeOutBounce.transformScale(2.5).animate(2.0).easeInElastic.transformScaleUIView(1.0).animate(0.3)
        
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Selection")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
    }
    func animateHamperButton(){
                buttonAnimation(recentlyWonrItem)
    }
    func animateStarButton(){
        buttonAnimation(favortiedItems)
    }
    func animatePictureImages(){
        secectionImagesDresser(self.topImage)
        secectionImagesDresser(self.bottomImage)
        secectionImagesDresser(self.footwareImage)
        secectionImagesDresser(self.accessoriesImage)
        secectionImagesDresser(self.headWareImage)
        secectionImagesDresser(self.underClothesImage)
    }
    func animatePictureLabels(){
        secectionImageLabelDresser(self.topsLabel)
        secectionImageLabelDresser(self.bottomsLabel)
        secectionImageLabelDresser(self.footwareLabel)
        secectionImageLabelDresser(self.accessoriesLabel)
        secectionImageLabelDresser(self.headwareLabel)
        secectionImageLabelDresser(self.underClothesLabel)
    }
    func animateNumberLabels(){
        secectionImageLabelDresser(self.topCounter)
        secectionImageLabelDresser(self.bottomCounter)
        secectionImageLabelDresser(self.footwareCounter)
        secectionImageLabelDresser(self.accessoriesCounter)
        secectionImageLabelDresser(self.headwareCounter)
        secectionImageLabelDresser(self.underClothesCounter)
    }
    
}


//MARK: -Anylitics-SelectionViewController Extension
extension SelectionViewController{
    func logPageView(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("SELECTION_PAGE_COUNT")
        
        Answers.logContentViewWithName("Main View Content View",
            contentType: "Category Selection Menu",
            contentId: "MF2",
            customAttributes: ["SELECTION_PAGE_COUNT": pageCount!
            ])
    }
}

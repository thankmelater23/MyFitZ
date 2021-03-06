//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
//import DKChainableAnimationKit
//import Crashlytics

//MARK: -SelectionViewController Class
class SelectionViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    //MARK: -Outlets
    //MARK: -Feature Buttons
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var recentlyWonrItem: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var favortiedItems: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var topBannerView: UIView!
    @IBOutlet weak var buttonHolderView: UIView!
    @IBOutlet weak var bottomCategoriesView: UIView!
    @IBOutlet weak var topCategoriesView: UIView!
    @IBOutlet weak var optionsHolderView: UIView!
    @IBOutlet weak var percentageButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    //MARK: -Selection Image Buttons
    @IBOutlet weak var topImage: UIButton!
    @IBOutlet weak var bottomImage: UIButton!
    @IBOutlet weak var footwareImage: UIButton!
    @IBOutlet weak var accessoriesImage: UIButton!
    @IBOutlet weak var underClothesImage: UIButton!
    @IBOutlet weak var headWareImage: UIButton!
    
    //MARK: -Selection labels
//    @IBOutlet weak var topsLabel: UILabel!
//    @IBOutlet weak var footwareLabel: UILabel!
//    @IBOutlet weak var underClothesLabel: UILabel!
//    @IBOutlet weak var headwareLabel: UILabel!
//    @IBOutlet weak var accessoriesLabel: UILabel!
//    @IBOutlet weak var bottomsLabel: UILabel!
    
    //MARK: -Selection Counter
    @IBOutlet weak var topCounter: UILabel!
    @IBOutlet weak var bottomCounter: UILabel!
    @IBOutlet weak var footwareCounter: UILabel!
    @IBOutlet weak var underClothesCounter: UILabel!
    @IBOutlet weak var headwareCounter: UILabel!
    @IBOutlet weak var accessoriesCounter: UILabel!
    
    
    //MARK: -Variables
    @objc var wardrobe: Wardrobe? = nil
    ///Dictionary path to item
    @objc var path: [String: String]! = [String: String]()
    
    //Category Outlets
    @IBAction func accessoriesSegue(_ sender: UIButton) {
        log.verbose(#function)
        self.segueWithCateogry(cateogory: CateogryType.ACCESSORIES)
    }
    @IBAction func underclothesSegue(_ sender: UIButton) {
        log.verbose(#function)
        self.segueWithCateogry(cateogory: CateogryType.UNDERCLOTHING)
    }
    @IBAction func headwareSegue(_ sender: UIButton) {
        log.verbose(#function)
        self.segueWithCateogry(cateogory: CateogryType.HEADWARE)
    }
    
    @IBAction func bottomsSegue(_ sender: UIButton) {
        log.verbose(#function)
        self.segueWithCateogry(cateogory: CateogryType.BOTTOMS)
    }
    @IBAction func topsSegue(_ sender: UIButton) {
        self.segueWithCateogry(cateogory: CateogryType.TOPS)
    }
    @IBAction func footwareSegue(_ sender: UIButton) {
        log.verbose(#function)
        self.segueWithCateogry(cateogory: CateogryType.FOOTWARE)
    }
    @objc func segueWithCateogry(cateogory:String){
        log.verbose(#function)
//        path = pathSetup(userString: (self.wardrobe!.user?.position)!, closetString: (self.wardrobe?.user?.closetType)!, categoryString: cateogory, subCategoryString: nil, indexString: nil, idString: nil) 
        performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_MAKE, sender: nil)
    }
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.verbose(#function)
        self.navigationController?.isNavigationBarHidden = false
        
        //        self.animateAllButtons()
        //        self.view.backgroundColor = Cotton
        //        self.setBarButtonsView()
        
        //        self.navigationController?.navigationBar.titleTextAttributes = [
        //            NSBackgroundColorAttributeName: UIColor.purpleColor(),
        //            NSFontAttributeName: "Chalkduster",
        ////            NSBackgroundColorAttributeName: UIColor.whiteColor(),
        ////            NSBackgroundColorAttributeName: UIColor.whiteColor(),
        //            NSTextEffectAttributeName: NSTextEffectLetterpressStyle
        //            ]
        
        //        self.assignCategoriesItemCount()
        
        
        
        //        defaults.addAndSend("SELECTION_PAGE_COUNT")
        
        //        self.logPageView()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        log.verbose(#function)
        defer{
            log.verbose("Segue transfer: \(String(describing: segue.identifier))")
        }
        
        if segue.identifier == Segue.SEGUE_SELECTION_TO_MAKE{
            let makeController: MakeTableViewController! = segue.destination as! MakeTableViewController
            makeController.path = self.path
            makeController.wardrobe = self.wardrobe
        }else if segue.identifier == Segue.SEGUE_SELECTION_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destination as! CreateItemViewController
            createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_SELECTION
        }else if segue.identifier == Segue.SEGUE_SELECTION_TO_PERCENTAGE{
            let percentagesTableViewController: PercentagesTableViewController! = segue.destination as! PercentagesTableViewController
            
            let popOver = percentagesTableViewController.popoverPresentationController
            
            
            if popOver != nil{
                popOver?.delegate = self
                popOver?.sourceView = self.view
                popOver?.sourceRect = buttonHolderView.frame
                //                popOver?.preferredContentSize = CGSize(width: 500, height: 500)
            }
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            //Return Fullscreen for model and none for popover
            log.verbose(#function)
            return UIModalPresentationStyle.formSheet
            
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        log.verbose(#function)
        //TODO: Set these up to do some house work
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        return true
    }
    
    
}
//func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
//    let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
//    let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(SelectionViewController.dismiss))
//    navigationController.topViewController?.navigationItem.rightBarButtonItem = btnDone
//    return navigationController
//}
//func dismiss(){
//        self.dismiss(animated: true, completion: nil)
//}
//func assignCategoriesItemCount(){
//        var catCountDic: [String: Int] = [String: Int]()

//        GlobalWardrobeSerial.async(execute: {
//            for category in CATEGORY_PICKER_OPTIONS{
//                catCountDic[category] = Users_Wardrobe.getCountOfAllItemsInCategory(category)
//            }

//            GlobalMainQueue.async(execute: {[unowned self] in
//                self.topCounter.text = String(catCountDic[CateogryType.TOPS]!)
//                self.bottomCounter.text = String(catCountDic[CateogryType.BOTTOMS]!)
//                self.footwareCounter.text = String(catCountDic[CateogryType.FOOTWARE]!)
//                self.underClothesCounter.text = String(catCountDic[CateogryType.UNDERCLOTHING]!)
//                self.accessoriesCounter.text = String(catCountDic[CateogryType.ACCESSORIES]!)
//                self.headwareCounter.text = String(catCountDic[CateogryType.HEADWARE]!)
//                })
//        })
//}
//    deinit{
//        log.verbose(#function)
//    }
//    deinit{
//        log.verbose(#function)
//
//    }
//}




//MARK: -Actions-SelectionViewController Extension
extension SelectionViewController{
    ///An action that takes the buttonn(sender).text and stores it into categoryString
    @IBAction func categoryIsButtonName(_ sender: UIButton) {
        log.verbose(#function)
        path[PathType.PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!
        //        playSoundEffects(categorySFX)
    }
    @IBAction func backButton(_ sender: AnyObject) {
        //        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_MAIN, sender: self)
    }
    @IBAction func favoriteButton() {
        performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_FAVORITED, sender: self)
    }
    @IBAction func hamperButton() {
        performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_RECENT, sender: self)
    }
    @IBAction func trashButtonPressed() {
        performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_TRASH, sender: self)
    }
    
    @IBAction func percentageButtonPressed() {
        self.performSegue(withIdentifier: Segue.SEGUE_SELECTION_TO_PERCENTAGE, sender: self)
    }
    @IBAction func titleBarPressed(){
        self.viewHint()
    }
    
    @IBAction func share(){
        log.verbose(#function)
        //let textToShare = "Swift is awesome!  Check out this website about it!"
        
        if let myWebsite = URL(string: "http://MyFitZApp.com/")
        {
            let objectsToShare = [myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //New Excluded Activities Code
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            //
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    @objc func viewHint(){
    }
    
    
}



//MARK: -General-SelectionViewController Extension
//extension SelectionViewController{

//    func setBarButtonsView(){
//        self.navigationController?.navigationBar.isTranslucent = false
//
//        if Users_Wardrobe.closetSelectionString == MY_CLOSET{
//            self.navigationController?.navigationBar.barTintColor = RedClothTexture
//        }else{
//            self.navigationController?.navigationBar.barTintColor = Polyester
//        }


//        self.navigationItem.rightBarButtonItem?.customView?.layer.borderWidth = 2
//        self.navigationItem.rightBarButtonItem?.customView?.layer.borderColor = Gold.CGColor
//
//        self.navigationItem.leftBarButtonItem?.customView?.layer.borderWidth = 2
//        self.navigationItem.leftBarButtonItem?.customView?.layer.borderColor = Gold.CGColor
//
//        self.navigationController?.navigationBar.topItem?.rightBarButtonItem?.customView?.layer.borderColor = Gold.CGColor



//                let banner = UIImage(named: "leatherDoubleDoubleStitchingTexture")
//                let imageView = UIImageView(image:banner)
//
//                let bannerWidth = navigationController?.navigationBar.frame.size.width
//                let bannerHeight = navigationController?.navigationBar.frame.size.height
//                let bannerx = bannerWidth! / 2 - banner!.size.width / 2
//                let bannery = bannerHeight! / 2 - banner!.size.height / 2
//
//                imageView.frame = CGRect(x: bannerx, y: bannery, width: bannerWidth!, height: bannerHeight!)
//                imageView.contentMode = UIViewContentMode.ScaleAspectFit
//
//                self.navigationController?.navigationBar.topItem?.leftBarButtonItem?.image = imageView.image
//
//                self.navigationItem.titleView = imageView
//    }
//}



//MARK: -Animations-SelectionViewController Extension
//extension SelectionViewController{
//    func animateAllButtons(){
//        self.animateSearchButton()
//        self.animatePictureLabels()
//        self.animatePictureImages()
//        self.animateNumberLabels()
//        self.animateLogo()
//        self.animateOptionButtons()
//        self.animateFeaturesButtons()
//        self.animateViews()
//        self.topBannerCustomization()
//        self.animateSubViews()

//    }
//    func animateLogo(){
//        logoCustomization(self.logoImage)
//    }
//    func animateViews(){
//
//        //viewGeneralCustomization(self.optionsHolderView)
//    }
//    func topBannerCustomization(){
//        bannerViewCustomization(self.topBannerView)
//    }
//    func animateSubViews(){
//        subViewGeneralCustomization(self.bottomCategoriesView)
//        subViewGeneralCustomization(self.topCategoriesView)
//        subViewGeneralCustomization(self.optionsHolderView)
//    }
//    func animateSearchButton(){
//        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Selection")
//        if self.title == MY_CLOSET{
//            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
//        }else if self.title == MY_WANTS_CLOSET{
//            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
//        }
//    }
//    func animateOptionButtons(){
//        optionViewCustomized(self.percentageButton)
//        optionViewCustomized(self.shareButton)
//    }
//    func animateFeaturesButtons(){
//        featureButtons(self.searchButton)
//        featureButtons(self.trashButton)
//        featureButtons(self.recentlyWonrItem)
//        featureButtons(self.favortiedItems)
//    }
//    func animatePictureImages(){
//        secectionImagesDresser(self.topImage)
//        secectionImagesDresser(self.bottomImage)
//        secectionImagesDresser(self.footwareImage)
//        secectionImagesDresser(self.accessoriesImage)
//        secectionImagesDresser(self.headWareImage)
//        secectionImagesDresser(self.underClothesImage)
//    }
//    func animatePictureLabels(){
//        nameLabelCustomizer(self.topsLabel)
//        nameLabelCustomizer(self.bottomsLabel)
//        nameLabelCustomizer(self.footwareLabel)
//        nameLabelCustomizer(self.accessoriesLabel)
//        nameLabelCustomizer(self.headwareLabel)
//        nameLabelCustomizer(self.underClothesLabel)
//    }
//    func animateNumberLabels(){
//        nameLabelCustomizer(self.topCounter)
//        nameLabelCustomizer(self.bottomCounter)
//        nameLabelCustomizer(self.footwareCounter)
//        nameLabelCustomizer(self.accessoriesCounter)
//        nameLabelCustomizer(self.headwareCounter)
//        nameLabelCustomizer(self.underClothesCounter)
//    }

//}


//MARK: -Anylitics-SelectionViewController Extension
//extension SelectionViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//
//
//            let pageCount:Int? = defaults.returnIntValue("SELECTION_PAGE_COUNT")
//
//            Answers.logContentView(withName: "Main View Content View",
//                contentType: "Category Selection Menu",
//                contentId: "MF2",
//                customAttributes: ["SELECTION_PAGE_COUNT": pageCount!
//                ])
//        })
//    }
//}




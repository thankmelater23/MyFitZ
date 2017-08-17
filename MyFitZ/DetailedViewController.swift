
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
<<<<<<< HEAD
import CRToast
import DKChainableAnimationKit
//import Crashlytics
=======
//import CRToast
import DKChainableAnimationKit
import Crashlytics
>>>>>>> MyFitZOld/master



//MARK: - DetailedViewController Class
class DetailedViewController: UIViewController{
    //MARK: -Outlets
    @IBOutlet var tableView: UITableView!
    ///Views main image of the Item being presented
    @IBOutlet  weak var itemImage: UIImageView!
    @IBOutlet weak var wearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    //MARK: -Variables
<<<<<<< HEAD
    @objc var item: Item = Item()
    ///Dictionary path to item
    @objc var path: [String: String]! = [String: String]()
    
    //Core Data
    @objc let context = DataBaseController.getContext()
=======
    var itemOfObject: Item! = Item()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
>>>>>>> MyFitZOld/master
    
    
    
    //MARK: -View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setUp()
        self.view.backgroundColor = Cotton
<<<<<<< HEAD
        log.debug(self.item)
=======
        log.verbose(self.itemOfObject)
>>>>>>> MyFitZOld/master
        
        // Do view setup here.
        
        
<<<<<<< HEAD
        //        defaults.addAndSend("DETAIL_PAGE_COUNT")
        
        //        self.logPageView()
        //        Users_Wardrobe.clearAllContainersAndPopulate()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //        defer{
        //            log.verbose("Segue transfer: \(segue.identifier)")
        //        }
        //
        //        if segue.identifier == Segue.SEGUE_DETAIL_TO_MODEL
        //        {
        //            let modelTableViewController = segue.destination as! ModelTableViewController
        //
        //            modelTableViewController.path = self.path
        //        }else if segue.identifier == Segue.SEGUE_DETAIL_TO_EDIT{
        //            let editItemViewController = segue.destination as! EditItemViewController
        //            editItemViewController.path = self.path
        //            editItemViewController.viewItem = self.itemOfObject
        //            editItemViewController.previousItem = self.itemOfObject
        //        }else if segue.identifier == Segue.SEGUE_DETAIL_TO_CREATION{
        //            let createItemViewController: CreateItemViewController! = segue.destination as! CreateItemViewController
        //            createItemViewController.lastVCSegue = Segue.SEGUE_DETAIL_TO_CREATION
        //        }else if segue.identifier == Segue.SEGUE_DETAILED_TO_IMAGE{
        //            let imageViewController: ImageViewController! = segue.destination as! ImageViewController
        //
        //            imageViewController.path = self.path
        //
        //            imageViewController.itemName = self.itemOfObject.model
        //            imageViewController.itemBrand = self.itemOfObject.brand
        //            imageViewController.item = itemOfObject
        //
        //            if item.image != nil{
        //                imageViewController.imageHolder = itemOfObject.image
        //            }else{
        //                imageViewController.imageHolder = UIImage(named: BLANK_IMAGE_STRING)!
        //            }
        //        }
=======
        defaults.addAndSend("DETAIL_PAGE_COUNT")
        
        self.logPageView()
        //        Users_Wardrobe.clearAllContainersAndPopulate()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == Segue.SEGUE_DETAIL_TO_MODEL
        {
            let modelTableViewController = segue.destinationViewController as! ModelTableViewController
            
            modelTableViewController.path = self.path
        }else if segue.identifier == Segue.SEGUE_DETAIL_TO_EDIT{
            let editItemViewController = segue.destinationViewController as! EditItemViewController
            editItemViewController.path = self.path
            editItemViewController.viewItem = self.itemOfObject
            editItemViewController.previousItem = self.itemOfObject
        }else if segue.identifier == Segue.SEGUE_DETAIL_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = Segue.SEGUE_DETAIL_TO_CREATION
        }else if segue.identifier == Segue.SEGUE_DETAILED_TO_IMAGE{
            let imageViewController: ImageViewController! = segue.destinationViewController as! ImageViewController
            
            imageViewController.path = self.path
            
            imageViewController.itemName = self.itemOfObject.model
            imageViewController.itemBrand = self.itemOfObject.brand
            imageViewController.item = itemOfObject
            
            if itemOfObject.image != nil{
                imageViewController.imageHolder = itemOfObject.image
            }else{
                imageViewController.imageHolder = UIImage(named: BLANK_IMAGE_STRING)!
            }
        }
>>>>>>> MyFitZOld/master
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: -Actions-DetailedViewController Extension
extension DetailedViewController{
    @IBAction func editButtonPressed(){
        playSoundEffects(editSFX)
        
        defaults.addAndSend("EDIT_BUTTON_BUTTON_PRESSED")
        
<<<<<<< HEAD
        performSegue(withIdentifier: Segue.SEGUE_DETAIL_TO_EDIT, sender: self)
    }
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_DETAIL_TO_MODEL, sender: self)
    }
    @IBAction func deleteItem() {
        //        let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .alert)
        //        let act = UIAlertAction(title: "cancel", style: .default){_ in}
        //        let action = UIAlertAction(title: "Delete", style: .destructive) { _ in
        //
        //            Users_Wardrobe.deleteItem(self.itemOfObject.category, funcSubCategory: self.itemOfObject.subCategory, item: self.itemOfObject)
        //
        //            self.performSegue(withIdentifier: Segue.SEGUE_DETAIL_TO_SELECTION, sender: nil)
        //        }
        //
        //        alert.addAction(action)
        //        alert.addAction(act)
        //        self.present(alert, animated: true, completion:nil)
=======
        performSegueWithIdentifier(Segue.SEGUE_DETAIL_TO_EDIT, sender: self)
    }
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(Segue.SEGUE_DETAIL_TO_MODEL, sender: self)
    }
    @IBAction func deleteItem() {
        let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
        let act = UIAlertAction(title: "cancel", style: .Default){_ in}
        let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
            
            Users_Wardrobe.deleteItem(self.itemOfObject.category, funcSubCategory: self.itemOfObject.subCategory, item: self.itemOfObject)
            
            self.performSegueWithIdentifier(Segue.SEGUE_DETAIL_TO_SELECTION, sender: nil)
        }
        
        alert.addAction(action)
        alert.addAction(act)
        self.presentViewController(alert, animated: true, completion:nil)
>>>>>>> MyFitZOld/master
    }
    @IBAction func wear() {
        
        if true{
            self.wearActivate()
        }else{
            self.sendItemToMyCloset()
        }
        
<<<<<<< HEAD
        self.performSegue(withIdentifier: Segue.SEGUE_DETAIL_TO_RECENT, sender: self)
    }
    
    //MARK: -Action sum Methods
    @objc func wearActivate(){
        playSoundEffects(wearSFX)
        //
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateStyle = .short
        //        let newDate = dateFormatter.string(from: (Date()))
        //
        //
        //        let dicOfOptions = [
        //            kCRToastTextKey: "Wear date UPDATED-From: " + self.item.lastTimeWorn + "-To : " + newDate,
        //            kCRToastTextAlignmentKey : "NSTextAlignmentCenter",
        //            kCRToastBackgroundColorKey : UIColor.blue,
        //            kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
        //            kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
        //            kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
        //            kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"] as [String : Any]
        //
        //        CRToastManager.showNotification(options: dicOfOptions, completionBlock: {[unowned self] in
        //            self.itemOfObject.lastTimeWorn = newDate
        //
        //            self.itemOfObject.incrementTimesWorn()
        //
        //            self.itemOfObject.populatePath(Users_Wardrobe.closetSelectionString)
        //
        //            Users_Wardrobe.updateRecentWornCollectiion(self.itemOfObject.path)
        //
        //            self.wearButtonAvailable()
        //
        //            Users_Wardrobe.quickSave()
        //            })
        //
        //
        //        defaults.addAndSend("WEAR_PRESSED_COUNT")
    }
    @objc func hideWearButton(){
        wearButton.alpha = 0.5
        //        wearButton.backgroundColor = UIColor.grayColor()
        wearButton.isUserInteractionEnabled = false
    }
    @objc func showWearButton(){
        wearButton.alpha = 1.0
        //        wearButton.backgroundColor = UIColor.clearColor()
        wearButton.isUserInteractionEnabled = true
    }
    @IBAction func showImage(){
        self.performSegue(withIdentifier: Segue.SEGUE_DETAILED_TO_IMAGE, sender: self)
=======
        self.performSegueWithIdentifier(Segue.SEGUE_DETAIL_TO_RECENT, sender: self)
    }
    
    //MARK: -Action sum Methods
    func wearActivate(){
        playSoundEffects(wearSFX)
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = .ShortStyle
//        let newDate = dateFormatter.stringFromDate((NSDate()))
//        
//        
//        let dicOfOptions = [
//            kCRToastTextKey: "Wear date UPDATED-From: " + self.itemOfObject.lastTimeWorn + "-To : " + newDate,
//            kCRToastTextAlignmentKey : "NSTextAlignmentCenter",
//            kCRToastBackgroundColorKey : UIColor.blueColor(),
//            kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
//            kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
//            kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
//            kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"]
//        
//        CRToastManager.showNotificationWithOptions(dicOfOptions, completionBlock: {[unowned self] in
//            self.itemOfObject.lastTimeWorn = newDate
//            
//            self.itemOfObject.incrementTimesWorn()
//            
//            self.itemOfObject.populatePath(Users_Wardrobe.closetSelectionString)
//            
//            Users_Wardrobe.updateRecentWornCollectiion(self.itemOfObject.path)
//            
//            self.wearButtonAvailable()
//            
//            Users_Wardrobe.quickSave()
//            })
//        
//        
//        defaults.addAndSend("WEAR_PRESSED_COUNT")
    }
    func hideWearButton(){
        wearButton.alpha = 0.5
        //        wearButton.backgroundColor = UIColor.grayColor()
        wearButton.userInteractionEnabled = false
    }
    func showWearButton(){
        wearButton.alpha = 1.0
        //        wearButton.backgroundColor = UIColor.clearColor()
        wearButton.userInteractionEnabled = true
    }
    @IBAction func showImage(){
        self.performSegueWithIdentifier(Segue.SEGUE_DETAILED_TO_IMAGE, sender: self)
>>>>>>> MyFitZOld/master
    }
}




//MARK: - TableView Methods
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
<<<<<<< HEAD
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//Create constant
    }// Return the number of sections.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if (section == 0){
        //            return DETAIL_TABLEVIEW_BASIC_SECTION_COUNT
        //        }
        //
        //        else if (section == 1){
        //            return DETAIL_TABLEVIEW_MISC_SECTION_COUNT
        //        }
        //
        //        else{
        //            log.warning("Incorect section")
        //            return 0
        //        }
        return 11
    }// Return the number of rows in the section.
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 11{ return 500}else{return 250}
//    }//Random number returned to fix xcode bug
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 10{ return 200}else{return 50}
    }//Random number returned to fix xcode bug
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return createCellFromRequiredDictionary(row: indexPath.row) as DoubleLabelTableViewCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //FIXME: - Fix when item atributes are ready
        if (section == 0){
            return String()//"Basic: " + String(describing: self.item.model) + "-" + String(describing: self.item.brand)
        }else{
            return String()// "Misc: " + String(describing: self.item.model) + "-" + String(describing: self.item.brand)
        }
    }//Puts a text label in the header of the specified section
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
=======
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2//Create constant
    }// Return the number of sections.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return DETAIL_TABLEVIEW_BASIC_SECTION_COUNT
        }
            
        else if (section == 1){
            return DETAIL_TABLEVIEW_MISC_SECTION_COUNT
        }
            
        else{
            log.warning("Incorect section")
            return 0
        }
    }// Return the number of rows in the section.
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Random number returned to fix xcode bug
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            return createCellFromRequiredDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }else{
            return createCellFromOptionalDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Basic: " + String(self.itemOfObject.model) + "-" + String(self.itemOfObject.brand)
        }else{
            return "Misc: " + String(self.itemOfObject.model) + "-" + String(self.itemOfObject.brand)
        }
    }//Puts a text label in the header of the specified section
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
>>>>>>> MyFitZOld/master
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = RawGoldTexture
    }
<<<<<<< HEAD
    @objc func createCellFromRequiredDictionary(row: Int) -> DoubleLabelTableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let cal = Calendar.current
=======
    func createCellFromRequiredDictionary(row row: Int) -> DoubleLabelTableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        let cal = NSCalendar.currentCalendar()
>>>>>>> MyFitZOld/master
        
        switch row {
        case 0 :
            keyAndValue = ItemAttributeName.ITEM_MODEL_STRING
<<<<<<< HEAD
            if let value = self.item.model{
=======
            if let value = self.itemOfObject.model{
>>>>>>> MyFitZOld/master
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 1 :
            keyAndValue = ItemAttributeName.ITEM_BRAND_STRING
<<<<<<< HEAD
            if let value = self.item.brand{
=======
            if let value = self.itemOfObject.brand{
>>>>>>> MyFitZOld/master
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 2 :
            keyAndValue = ItemAttributeName.ITEM_CATEGORY_STRING
<<<<<<< HEAD
            if let value = self.item.category{
=======
            if let value = self.itemOfObject.category{
>>>>>>> MyFitZOld/master
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 3 :
            keyAndValue = ItemAttributeName.ITEM_SUBCATEGORY_STRING
<<<<<<< HEAD
            cell.configure(name: keyAndValue, infoString: item.subCategory!)
            
        case 4 :
            keyAndValue = ItemAttributeName.ITEM_PRICE_STRING
            
            cell.configure(name: keyAndValue, infoString: (item.price.description))
            
        case 5 :
            keyAndValue = ItemAttributeName.ITEM_FAVORITED_STRING
            let fav = self.item.isFavorite
                cell.configure(name: keyAndValue, infoString: (fav.description))
        
        
            //        case 6 :
            //            keyAndValue = ItemAttributeName.ITEM_ISTHISNEW_STRING
            //            let bool = self.item.isThisNew
            //            var value = "No"
            //            if bool == true{
            //                value = "YES"
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: value)
        //            }
        case 6:
            keyAndValue = ItemAttributeName.ITEM_TIMESWORN_STRING
            cell.configure(name: keyAndValue, infoString: item.timesWorn.description)
        case 7:
            keyAndValue = ItemAttributeName.ITEM_LASTTIMEWORN_STRING
            
            if let lastDate = self.item.lastTimeWorn{
                let today = Date()
                
                let unitDay:NSCalendar.Unit = .day
                let unitMonth:NSCalendar.Unit = .month
                let unitYear:NSCalendar.Unit = .year
                
                let components = (cal as NSCalendar).components(unitDay, from: lastDate as Date, to: today, options: .wrapComponents)
                
                if let value = self.item.lastTimeWorn{
                    
                    switch(components.day!){
                    case 1:
                        cell.configure(name: keyAndValue, infoString:value.description + "Not Worn")
                    case 0...500:
                        cell.configure(name: keyAndValue, infoString:value.description + "-" + String(describing: (components.day)) + " Days ago")
                    case 500...1000:
                        let components = (cal as NSCalendar).components(unitMonth, from: lastDate as Date, to: today, options: .wrapComponents)
                        cell.configure(name: keyAndValue, infoString:value.description + "-" + (components.month?.description)! + " Mnths ago")
                    case 1000...Int.max:
                        let components = (cal as NSCalendar).components(unitYear, from: lastDate as Date, to: today, options: .wrapComponents)
                        cell.configure(name: keyAndValue, infoString:value.description + "-" + String(describing: (components.year)) + " Years ago")
=======
            if let value = self.itemOfObject.subCategory{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 4 :
            keyAndValue = ItemAttributeName.ITEM_PRICE_STRING
            if let value = itemOfObject.payedPrice where value != UNSET_DOUBLE_VALUE{
                cell.configure(name: keyAndValue, infoString: String(value))
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 5 :
            keyAndValue = ItemAttributeName.ITEM_FAVORITED_STRING
            let bool = self.itemOfObject.favorited
            var value = "No"
            if bool == true{
                value = "YES"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: value)
            }
        case 6 :
            keyAndValue = ItemAttributeName.ITEM_ISTHISNEW_STRING
            let bool = self.itemOfObject.isThisNew
            var value = "No"
            if bool == true{
                value = "YES"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: value)
            }
        case 7 :
            keyAndValue = ItemAttributeName.ITEM_TIMESWORN_STRING
            if let value = itemOfObject.timesWorn where value != UNSET_INT_VALUE{
                cell.configure(name: keyAndValue, infoString: String(value) as String!)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 8 :
            keyAndValue = ItemAttributeName.ITEM_LASTTIMEWORN_STRING
            
            let lastDate = dateFormatter.dateFromString(self.itemOfObject.lastTimeWorn)
            if(lastDate != nil){
                let today = NSDate()
                
                let unitDay:NSCalendarUnit = .Day
                let unitMonth:NSCalendarUnit = .Month
                let unitYear:NSCalendarUnit = .Year
                
                let components = cal.components(unitDay, fromDate: lastDate!, toDate: today, options: .WrapComponents)
                if let value = self.itemOfObject.lastTimeWorn{
                    switch(components.day){
                    case -1:
                        cell.configure(name: keyAndValue, infoString:value + "Not Worn")
                    case 0...500:
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.day)) + " Days ago")
                    case 500...1000:
                        let components = cal.components(unitMonth, fromDate: lastDate!, toDate: today, options: .WrapComponents)
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.month)) + " Mnths ago")
                    case 1000...Int.max:
                        let components = cal.components(unitYear, fromDate: lastDate!, toDate: today, options: .WrapComponents)
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.year)) + " Years ago")
>>>>>>> MyFitZOld/master
                    default:
                        assertionFailure("This shouldint happen")
                    }
                }
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
<<<<<<< HEAD
            //        case 9 :
            //            keyAndValue = ItemAttributeName.ITEM_KIND_STRING
            //            if let value = self.item.kind{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 10 :
            //            keyAndValue = ItemAttributeName.ITEM_SIZE_STRING
            //            if let value = self.item.size{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
        //            }
        case 8 :
            keyAndValue = ItemAttributeName.ITEM_INDEX_STRING
            let number = self.item.index
            cell.configure(name: keyAndValue, infoString: number.description)
        case 9 :
            keyAndValue = ItemAttributeName.ITEM_ID_STRING
            let number = self.item.id
            cell.configure(name: keyAndValue, infoString: number.description)
            //TODO: - Put id maker here
            
            //        case 10 :
            //            keyAndValue = ItemAttributeName.ITEM_DATEPURCHASERD_STRING
            //            if let value = self.item.datePurchased{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 1 :
            //            keyAndValue = ItemAttributeName.ITEM_COLOR_STRING
            //            if let value = self.item.color{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 2 :
            //            keyAndValue = ItemAttributeName.ITEM_SECONDARYCOLOR_STRING
            //            if let value = self.item.secondaryColor{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //
            //        case 3 :
            //            keyAndValue = ItemAttributeName.ITEM_THIRDCOLOR_STRING
            //            if let value = self.item.thirdColor{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            
        case 10 :
            keyAndValue = ItemAttributeName.ITEM_ITEMNOTES_STRING
            if let value = self.item.itemNotes{
=======
        case 9 :
            keyAndValue = ItemAttributeName.ITEM_KIND_STRING
            if let value = self.itemOfObject.kind{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 10 :
            keyAndValue = ItemAttributeName.ITEM_SIZE_STRING
            if let value = self.itemOfObject.size{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 11 :
            keyAndValue = ItemAttributeName.ITEM_INDEX_STRING
            let number = self.itemOfObject.index
            if number != nil{
                let value = "\(number)"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                log.warning("This should have a value")
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 12 :
            keyAndValue = ItemAttributeName.ITEM_ID_STRING
            let number = self.itemOfObject.id
            if number != nil{
                let value = "\(number)"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                //TODO: - Put id maker here
                log.warning("This should have a value")
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        default:
            assertionFailure("Row does not exist to create cell of required type. ROW: \(row)")
        }
        
        return cell as DoubleLabelTableViewCell
    }
    ///Returns cell of Optional dictionary
    func createCellFromOptionalDictionary(row row: Int) -> DoubleLabelTableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        switch row {
        case 0 :
            keyAndValue = ItemAttributeName.ITEM_DATEPURCHASERD_STRING
            if let value = self.itemOfObject.datePurchased{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 1 :
            keyAndValue = ItemAttributeName.ITEM_COLOR_STRING
            if let value = self.itemOfObject.color{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 2 :
            keyAndValue = ItemAttributeName.ITEM_SECONDARYCOLOR_STRING
            if let value = self.itemOfObject.secondaryColor{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 3 :
            keyAndValue = ItemAttributeName.ITEM_THIRDCOLOR_STRING
            if let value = self.itemOfObject.thirdColor{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 4 :
            keyAndValue = ItemAttributeName.ITEM_ITEMNOTES_STRING
            if let value = self.itemOfObject.itemNotes{
>>>>>>> MyFitZOld/master
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
<<<<<<< HEAD
            //        case 5 :
            //            keyAndValue = ItemAttributeName.ITEM_DATERELEASED_STRING
            //            if let value = self.item.dateReleased{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            
            //        case 11 :
            //            keyAndValue = ItemAttributeName.ITEM_RETAILPRICE_STRING
            //            if let value = self.item.retailPrice, value != UNSET_DOUBLE_VALUE{
            //                cell.configure(name: keyAndValue, infoString: value.description)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //
            //        case 7 :
            //            keyAndValue = ItemAttributeName.ITEM_CONDITION_STRING
            //            if let value = self.item.condition{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //
            //        case 8 :
            //            keyAndValue = ItemAttributeName.ITEM_PRIMARYMATERIAL_STRING
            //            if let value = self.item.primaryMaterial{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 9:
            //            keyAndValue = ItemAttributeName.ITEM_SECONDAY_MATERIAL_STRING
            //            if let value = self.item.secondaryMaterial{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 10:
            //            keyAndValue = ItemAttributeName.ITEM_STORELURL_STRING
            //            if let value = self.item.sellerURL{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 11 :
            //            keyAndValue = ItemAttributeName.ITEM_STORELOCATION_STRING
            //            if let value = self.item.storeLocation{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 12 :
            //            keyAndValue = ItemAttributeName.ITEM_SELLERNAME_STRING
            //            if let value = self.item.sellerName{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 0 :
            //            keyAndValue = ItemAttributeName.ITEM_DATEPURCHASERD_STRING
            //            if let value = self.item.datePurchased{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 1 :
            //            keyAndValue = ItemAttributeName.ITEM_COLOR_STRING
            //            if let value = self.item.color{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //        case 2 :
            //            keyAndValue = ItemAttributeName.ITEM_SECONDARYCOLOR_STRING
            //            if let value = self.item.secondaryColor{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
            //            }
            //
            //        case 3 :
            //            keyAndValue = ItemAttributeName.ITEM_THIRDCOLOR_STRING
            //            if let value = self.item.thirdColor{
            //                cell.configure(name: keyAndValue, infoString: value)
            //            }else{
            //                cell.configure(name: keyAndValue, infoString: "N/A")
        //            }
        default:
            assertionFailure("Row does not exist to create cell of required type. ROW: \(row)")
        }
        
        return cell as DoubleLabelTableViewCell
    }
    ///Returns cell of Optional dictionary
    
}


//MARK: - Initializer Created Methods
extension DetailedViewController{
    @objc func setUp(){
=======
        case 5 :
            keyAndValue = ItemAttributeName.ITEM_DATERELEASED_STRING
            if let value = self.itemOfObject.dateReleased{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 6 :
            keyAndValue = ItemAttributeName.ITEM_RETAILPRICE_STRING
            if let value = self.itemOfObject.retailPrice where value != UNSET_DOUBLE_VALUE{
                cell.configure(name: keyAndValue, infoString: value.description)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 7 :
            keyAndValue = ItemAttributeName.ITEM_CONDITION_STRING
            if let value = self.itemOfObject.condition{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 8 :
            keyAndValue = ItemAttributeName.ITEM_PRIMARYMATERIAL_STRING
            if let value = self.itemOfObject.primaryMaterial{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 9:
            keyAndValue = ItemAttributeName.ITEM_SECONDAY_MATERIAL_STRING
            if let value = self.itemOfObject.secondaryMaterial{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 10:
            keyAndValue = ItemAttributeName.ITEM_STORELURL_STRING
            if let value = self.itemOfObject.sellerURL{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 11 :
            keyAndValue = ItemAttributeName.ITEM_STORELOCATION_STRING
            if let value = self.itemOfObject.storeLocation{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 12 :
            keyAndValue = ItemAttributeName.ITEM_SELLERNAME_STRING
            if let value = self.itemOfObject.sellerName{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        default:
            assertionFailure("Row does not exist to create cell of optional type. ROW: \(row)")
        }
//        
//        cell.layer.shadowColor = UIColor.blackColor().CGColor
//        cell.layer.shadowRadius = 10
        
        return cell as DoubleLabelTableViewCell
    }
}



//MARK: - Initializer Created Methods
extension DetailedViewController{
    func setUp(){
>>>>>>> MyFitZOld/master
        
        self.animateAllButtons()
        
        self.buttonIsWearOrGot()
        
        self.setTitle()
        
        
<<<<<<< HEAD
        
=======
        itemImage.image = itemOfObject.image
>>>>>>> MyFitZOld/master
        
        self.customizeTableView()
        self.wearButtonAvailable()
        
<<<<<<< HEAD
        self.setItem()
        
=======
>>>>>>> MyFitZOld/master
        
        //self.wearButton.animation.makeScale(0.0).moveX(-20).moveY(-20).makeBorderWidth(5.0).makeBorderColor(UIColor.blackColor()).animate(1.5)
        //self.wearButton.animation.makeScale(1.0).animate(0.5).moveX(20).moveY(20).makeBorderColor(UIColor.whiteColor()).animate(3.0)
        //self.wearButton.animation.makeScale(1.0).animateWithCompletion(1.0, {
        //self.wearButtonAvailable()
        //})
        
        
    }//Sets up view
<<<<<<< HEAD
    @objc func customizeTableView(){
=======
    func customizeTableView(){
>>>>>>> MyFitZOld/master
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = SiliverSilkSheet
        self.tableView?.tintColor = LeatherTexture
        self.tableView.reloadData()
        
    }
<<<<<<< HEAD
    @objc func setTitle(){
        //        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Detail")
=======
    func setTitle(){
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Detail")
>>>>>>> MyFitZOld/master
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
<<<<<<< HEAD
        self.navigationController?.navigationBar.isTranslucent = false
    }
    @objc func setItem(){
        //        let entity =   Item(context: context)
        itemImage.image = #imageLiteral(resourceName: "blank image")
        
        do{
            let items = try context.fetch(Item.fetchRequest())
            if items.count > 0{
                item = items.first as! Item
                log.verbose("Count: \(items.count)")
            }else{
                log.warning("No results found")
                
                log.debug("Creating new data base")
            }
        }catch{
            log.error("Fetching Failed")
        }
        
        
=======
        self.navigationController?.navigationBar.translucent = false
>>>>>>> MyFitZOld/master
    }
}



//MARK: - General Methods-DetailedViewController Exension
extension DetailedViewController{
<<<<<<< HEAD
    @objc func sendItemToMyCloset(){
=======
    func sendItemToMyCloset(){
>>>>>>> MyFitZOld/master
        //Put code here to send to closet
    }
}



//MARK: - Animations-DetailedViewController Exension
extension DetailedViewController{
<<<<<<< HEAD
    @objc func wearButtonAvailable(){
        //        let daysLastWorn:Int = item.lastTimeWorn.returnDaysInDate()
        //
        //        if daysLastWorn < 1{
        //            hideWearButton()
        //        }else{
        //            showWearButton()
        //        }
    }
    @objc func buttonIsWearOrGot(){
        //        let closet = Users_Wardrobe.closetSelectionString
        //
        //        if closet == MY_CLOSET{
        //            wearButton.titleLabel?.text = "WEAR"
        //        }else if closet == MY_WANTS_CLOSET{
        //            wearButton.titleLabel?.text = "GOT"
        //        }
=======
    func wearButtonAvailable(){
        let daysLastWorn:Int = itemOfObject.lastTimeWorn.returnDaysInDate()
        
        if daysLastWorn < 1{
            hideWearButton()
        }else{
            showWearButton()
        }
    }
    func buttonIsWearOrGot(){
        let closet = Users_Wardrobe.closetSelectionString
        
        if closet == MY_CLOSET{
            wearButton.titleLabel?.text = "WEAR"
        }else if closet == MY_WANTS_CLOSET{
            wearButton.titleLabel?.text = "GOT"
        }
>>>>>>> MyFitZOld/master
    }
}



//MARK: - UI-DetailedViewController Extension
extension DetailedViewController{
<<<<<<< HEAD
    @objc func animateAllButtons(){
        self.animateImage()
        self.animateButtons()
    }
    @objc func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
    @objc func animateImage(){
        imageCustomization(self.itemImage)
    }
    @objc func animateButtons(){
=======
    func animateAllButtons(){
        self.animateImage()
        self.animateButtons()
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
    func animateImage(){
        imageCustomization(self.itemImage)
    }
    func animateButtons(){
>>>>>>> MyFitZOld/master
        clearButtonCustomization(self.editButton)
        deleteButtonCustomization(self.deleteButton)
        wearButtonAnimation(self.wearButton)
    }
}



//MARK: -Anylitics-MakeTableViewController Extension
<<<<<<< HEAD
//extension DetailedViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//
//
//            let pageCount:Int? = defaults.returnIntValue("DETAIL_PAGE_COUNT")
//            let wearPressedCount:Int? = defaults.returnIntValue("WEAR_PRESSED_COUNT")
//            let editButtonPressed:Int? = defaults.returnIntValue("EDIT_BUTTON_BUTTON_PRESSED")
//
//            Answers.logContentView(withName: "Detail Content View",
//                contentType: "Detail View",
//                contentId: "MF5",
//                customAttributes: ["DETAIL_PAGE_COUNT": pageCount!,
//                    "WEAR_PRESSED_COUNT": wearPressedCount!,
//                    "EDIT_BUTTON_BUTTON_PRESSED": editButtonPressed!
//                ])
//        })
//    }
//}
=======
extension DetailedViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("DETAIL_PAGE_COUNT")
            let wearPressedCount:Int? = defaults.returnIntValue("WEAR_PRESSED_COUNT")
            let editButtonPressed:Int? = defaults.returnIntValue("EDIT_BUTTON_BUTTON_PRESSED")
            
            Answers.logContentViewWithName("Detail Content View",
                contentType: "Detail View",
                contentId: "MF5",
                customAttributes: ["DETAIL_PAGE_COUNT": pageCount!,
                    "WEAR_PRESSED_COUNT": wearPressedCount!,
                    "EDIT_BUTTON_BUTTON_PRESSED": editButtonPressed!
                ])
        })
    }
}
>>>>>>> MyFitZOld/master




//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
import CRToast
import DKChainableAnimationKit
//import Crashlytics



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
    var item: Item = Item()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    //Core Data
    let context = DataBaseController.getContext()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setUp()
        self.view.backgroundColor = Cotton
        log.verbose(self.item)
        
        // Do view setup here.
        
        
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
    }
    @IBAction func wear() {
        
        if true{
            self.wearActivate()
        }else{
            self.sendItemToMyCloset()
        }
        
        self.performSegue(withIdentifier: Segue.SEGUE_DETAIL_TO_RECENT, sender: self)
    }
    
    //MARK: -Action sum Methods
    func wearActivate(){
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
    func hideWearButton(){
        wearButton.alpha = 0.5
        //        wearButton.backgroundColor = UIColor.grayColor()
        wearButton.isUserInteractionEnabled = false
    }
    func showWearButton(){
        wearButton.alpha = 1.0
        //        wearButton.backgroundColor = UIColor.clearColor()
        wearButton.isUserInteractionEnabled = true
    }
    @IBAction func showImage(){
        self.performSegue(withIdentifier: Segue.SEGUE_DETAILED_TO_IMAGE, sender: self)
    }
}




//MARK: - TableView Methods
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2//Create constant
    }// Return the number of sections.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }//Random number returned to fix xcode bug
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            return createCellFromRequiredDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }else{
            return createCellFromOptionalDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return String()//"Basic: " + String(describing: self.item.model) + "-" + String(describing: self.item.brand)
        }else{
            return String()// "Misc: " + String(describing: self.item.model) + "-" + String(describing: self.item.brand)
        }
    }//Puts a text label in the header of the specified section
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = RawGoldTexture
    }
    func createCellFromRequiredDictionary(row: Int) -> DoubleLabelTableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let cal = Calendar.current
        
        switch row {
        case 0 :
            keyAndValue = ItemAttributeName.ITEM_MODEL_STRING
            if let value = self.item.model{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 1 :
            keyAndValue = ItemAttributeName.ITEM_BRAND_STRING
            if let value = self.item.brand{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 2 :
            keyAndValue = ItemAttributeName.ITEM_CATEGORY_STRING
            if let value = self.item.category{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 3 :
            keyAndValue = ItemAttributeName.ITEM_SUBCATEGORY_STRING
            if let value = self.item.subCategory{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
//        case 4 :
//            keyAndValue = ItemAttributeName.ITEM_PRICE_STRING
//            if let value = item.payedPrice, value != UNSET_DOUBLE_VALUE{
//                cell.configure(name: keyAndValue, infoString: String(value))
//            }else{
//                cell.configure(name: keyAndValue, infoString: "N/A")
//            }
//        case 5 :
//            keyAndValue = ItemAttributeName.ITEM_FAVORITED_STRING
//            let bool = self.item.favorited
//            var value = "No"
//            if bool == true{
//                value = "YES"
//                cell.configure(name: keyAndValue, infoString: value)
//            }else{
//                cell.configure(name: keyAndValue, infoString: value)
//            }
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
//        case 7 :
//            keyAndValue = ItemAttributeName.ITEM_TIMESWORN_STRING
//            if let value = item.timesWorn, value != UNSET_INT_VALUE{
//                cell.configure(name: keyAndValue, infoString: String(value) as String!)
//            }else{
//                cell.configure(name: keyAndValue, infoString: "N/A")
//            }
//        case 8 :
//            keyAndValue = ItemAttributeName.ITEM_LASTTIMEWORN_STRING
//            
//            let lastDate = dateFormatter.date(from: self.item.lastTimeWorn)
//            if(lastDate != nil){
//                let today = Date()
//                
//                let unitDay:NSCalendar.Unit = .day
//                let unitMonth:NSCalendar.Unit = .month
//                let unitYear:NSCalendar.Unit = .year
//                
//                let components = (cal as NSCalendar).components(unitDay, from: lastDate!, to: today, options: .wrapComponents)
//                if let value = self.item.lastTimeWorn{
//                    switch(components.day){
//                    case 1:
//                        cell.configure(name: keyAndValue, infoString:value + "Not Worn")
//                    case 0...500:
//                        cell.configure(name: keyAndValue, infoString:value + "-" + String(describing: (components.day)) + " Days ago")
//                    case 500...1000:
//                        let components = (cal as NSCalendar).components(unitMonth, from: lastDate!, to: today, options: .wrapComponents)
//                        cell.configure(name: keyAndValue, infoString:value + "-" + String(describing: (components.month)) + " Mnths ago")
//                    case 1000...Int.max:
//                        let components = (cal as NSCalendar).components(unitYear, from: lastDate!, to: today, options: .wrapComponents)
//                        cell.configure(name: keyAndValue, infoString:value + "-" + String(describing: (components.year)) + " Years ago")
//                    default:
//                        assertionFailure("This shouldint happen")
//                    }
//                }
//            }else{
//                cell.configure(name: keyAndValue, infoString: "N/A")
//            }
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
        case 11 :
            keyAndValue = ItemAttributeName.ITEM_INDEX_STRING
            let number = self.item.index
            if number != nil{
                let value = "\(number)"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                log.warning("This should have a value")
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 12 :
            keyAndValue = ItemAttributeName.ITEM_ID_STRING
            let number = self.item.id
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
    func createCellFromOptionalDictionary(row: Int) -> DoubleLabelTableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        switch row {
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
            
        case 4 :
            keyAndValue = ItemAttributeName.ITEM_ITEMNOTES_STRING
            if let value = self.item.itemNotes{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
//        case 5 :
//            keyAndValue = ItemAttributeName.ITEM_DATERELEASED_STRING
//            if let value = self.item.dateReleased{
//                cell.configure(name: keyAndValue, infoString: value)
//            }else{
//                cell.configure(name: keyAndValue, infoString: "N/A")
//            }
//            
//        case 6 :
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
        
        self.animateAllButtons()
        
        self.buttonIsWearOrGot()
        
        self.setTitle()
        
        
        itemImage.image = #imageLiteral(resourceName: "blank image")
        
        self.customizeTableView()
        self.wearButtonAvailable()
        
        self.setItem()
        
        
        //self.wearButton.animation.makeScale(0.0).moveX(-20).moveY(-20).makeBorderWidth(5.0).makeBorderColor(UIColor.blackColor()).animate(1.5)
        //self.wearButton.animation.makeScale(1.0).animate(0.5).moveX(20).moveY(20).makeBorderColor(UIColor.whiteColor()).animate(3.0)
        //self.wearButton.animation.makeScale(1.0).animateWithCompletion(1.0, {
        //self.wearButtonAvailable()
        //})
        
        
    }//Sets up view
    func customizeTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = SiliverSilkSheet
        self.tableView?.tintColor = LeatherTexture
        self.tableView.reloadData()
        
    }
    func setTitle(){
//        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Detail")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.isTranslucent = false
    }
    func setItem(){
//        let entity =   Item(context: context)
        
        do{
            let items = try context.fetch(Item.fetchRequest())
            if items.count > 0{
                item = items.first as! Item
                log.verbose("Count: \(items.count)")
            }else{
                print("No results found")
                
                print("Creating new data base")
            }
        }catch{
            log.error("Fetching Failed")
        }
        
        
    }
}



//MARK: - General Methods-DetailedViewController Exension
extension DetailedViewController{
    func sendItemToMyCloset(){
        //Put code here to send to closet
    }
}



//MARK: - Animations-DetailedViewController Exension
extension DetailedViewController{
    func wearButtonAvailable(){
//        let daysLastWorn:Int = item.lastTimeWorn.returnDaysInDate()
//        
//        if daysLastWorn < 1{
//            hideWearButton()
//        }else{
//            showWearButton()
//        }
    }
    func buttonIsWearOrGot(){
//        let closet = Users_Wardrobe.closetSelectionString
//        
//        if closet == MY_CLOSET{
//            wearButton.titleLabel?.text = "WEAR"
//        }else if closet == MY_WANTS_CLOSET{
//            wearButton.titleLabel?.text = "GOT"
//        }
    }
}



//MARK: - UI-DetailedViewController Extension
extension DetailedViewController{
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
        clearButtonCustomization(self.editButton)
        deleteButtonCustomization(self.deleteButton)
        wearButtonAnimation(self.wearButton)
    }
}



//MARK: -Anylitics-MakeTableViewController Extension
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



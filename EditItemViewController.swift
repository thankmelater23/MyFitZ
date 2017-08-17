//
//  EditItemViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 11/18/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import MobileCoreServices
import UIKit
import DKChainableAnimationKit
import RETableViewManager
import Crashlytics



//MARK: -EditItemViewController Class
class EditItemViewController: UIViewController, RETableViewManagerDelegate{
    //MARK: -Outlets
    @IBOutlet weak  var tableView: UITableView!
    @IBOutlet weak  var categoryInputTextField: UITextField!
    @IBOutlet weak  var subCategoryInputTextField: UITextField!
    @IBOutlet weak  var pictureForSelectedItemImage: UIImageView!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var subCategoryLabel: UILabel!
    
    //MARK: Variables
    var categoryPickerView = UIPickerView()
    var subCategoryPickerView = UIPickerView()
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    
    
    //MARK: RETableVIewManager Vars
    var manager:RETableViewManager?
    
    var basicSection:RETableViewSection?
    var miscSection:RETableViewSection?
    
    var model:RETextItem?
    var brands:RETableViewPickerCell?
    var brand:RETextItem?
    var favorited:REBoolItem?
    var payedPrice:RENumberItem?
    var timesWorn:RENumberItem?
    var lastTimeWorn:REDateTimeItem?
    var kind:RETextItem?
    var size:RETextItem?
    var datePurchased:REDateTimeItem?
    //    var color:REPickerItem?
    var color:RETextItem?
    //    var secondaryColor:REPickerItem?
    var secondaryColor:RETextItem?
    //    var thirdColor:REPickerItem?
    var thirdColor:RETextItem?
    var itemNotes: RELongTextItem?
    var dateReleased:REDateTimeItem?
    var retailPrice:RENumberItem?
    //    var condition:REPickerItem?
    var condition:RETextItem?
    //    var primaryMaterial:REPickerItem?
    var primaryMaterial:RETextItem?
    //    var secondaryMaterial:REPickerItem?
    var secondaryMaterial:RETextItem?
    var sellerURL:RETextItem?
    var storeLocation:RETextItem?
    var sellerName:RETextItem?
    //    var arrayOfImages:R?
    var isThisNew:REBoolItem?//{willSet:
    //        if timesWorn > 0{
    //            self =
    //        }
    //    }
    var viewItem: Item! = Item()
    var previousItem: Item! = Item()
    var currentIndex = 0
    ///Dictionary path to item
    var path: [String: String] = [String: String]()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(#function)
        self.setUp()
        self.view.backgroundColor = Cotton
        self.setButtonsView()
        
        
        defaults.addAndSend("EDIT_PAGE_COUNT")
        
        self.logPageView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
        // Dispose of any resources that can be recreated.
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == Segue.SEGUE_CREATION_TO_SELECTION{
            
        }
        if segue.identifier == Segue.SEGUE_CREATION_TO_MAKE{
            
        }
        if segue.identifier == Segue.SEGUE_CREATION_TO_MODEL{
            let array = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]![path[PathType.PATHTYPE_SUBCATEGORY_STRING]!]
            
            let modelController = segue.destinationViewController as! ModelTableViewController
            modelController.arrayOfItems = array
            modelController.path = self.path
        }
        if segue.identifier == Segue.SEGUE_CREATION_TO_DETAIL{
            
        }
        
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: -Actions
extension EditItemViewController{
    @IBAction func updateItem() {
        do{
            self.saveItemVars()
            
            //!!: -Temp swap function
            playSoundEffects(updateSFX)
            
            Users_Wardrobe.deleteItemWithNoSave(self.previousItem.category, funcSubCategory: self.previousItem.subCategory, item: self.previousItem)
            
            Users_Wardrobe.removeLastTrashedItem()
            
            try Users_Wardrobe.save(categorySelected, funcSubCategory: subCategorySelected, item: viewItem)
            
            
            
            //TODO: -Convert this to work
            //            try Users_Wardrobe.swapItem(self.viewItem.subCategory, funcSubCategory: self.viewItem.subCategory, prevFuncCategory: self.previousItem.category, prevFuncSubCategory: self.previousItem.subCategory, item: self.viewItem)
            
            super.viewDidLoad()
            log.info(#function)
        }
            
            
        catch ItemError.IncorrectSubCategory{
            let alert = UIAlertController(title: "SubCategory Missing", message: "Enter in correct subcateogry", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion:nil)
        }catch ItemError.missingModelString{
            let alert = UIAlertController(title: "Model String Missing", message: "Enter in correct Model String", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion:nil)
            
        }catch ItemError.addImage{
            let alert = UIAlertController(title: "Image not selected", message: "Selctect image", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion:nil)
        }catch{
            assertionFailure("Unknow error type thrown")
        }
        
        subCategoryPickerView.reloadAllComponents()
        subCategoryPickerView.reloadInputViews()
        
        performSegueWithIdentifier(Segue.SEGUE_EDIT_TO_SELECTION, sender: self)
    }
    @IBAction func setItemImage(sender: UIButton) {
        self.setImagePicker()
    }
    
    @IBAction func deleteItem() {
        let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
        let act = UIAlertAction(title: "cancel", style: .Default){_ in}
        let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
            
            Users_Wardrobe.deleteItem(self.viewItem.category, funcSubCategory: self.viewItem.subCategory, item: self.viewItem)
            
            self.performSegueWithIdentifier(Segue.SEGUE_EDIT_TO_SELECTION, sender: nil)
        }
        
        alert.addAction(action)
        alert.addAction(act)
        self.presentViewController(alert, animated: true, completion:nil)
    }
    //MARK: -Action sum functions
    func saveItemVars(){
        //Initialized Date Formatter
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        //Setup Picker textfields
        self.categorySelected = viewItem.category
        self.subCategorySelected = viewItem.subCategory
        
        self.categoryInputTextField.text = categorySelected
        self.subCategoryInputTextField.text = subCategorySelected
        
        //Initialized Date Strings
        var tempDateReleased:String?
        var templastTimeWorn:String?
        var tempdatePurchased:String?
        var tempdateDeleted:String?
        
        //Setting temp vars to dates of Strings?
        if (dateReleased?.value != nil){
            tempDateReleased = dateFormatter.stringFromDate(self.dateReleased!.value)
        }else{tempDateReleased = nil}
        
        if (lastTimeWorn?.value != nil){
            templastTimeWorn = dateFormatter.stringFromDate(self.lastTimeWorn!.value)
        }else{templastTimeWorn = nil}
        
        if (datePurchased?.value != nil){
            tempdatePurchased = dateFormatter.stringFromDate(self.datePurchased!.value)
        }else{tempdatePurchased = nil}
        
        //Set item variables to there values or default values eg:"N/A"
        if(model!.value != ""){viewItem.model = model!.value}else{viewItem.model = "N/A"}
        
        if(brand!.value != ""){viewItem.brand = brand!.value}else{viewItem.brand = "N/A"}
        
        viewItem.favorited = favorited!.value  ?? false
        
        viewItem.payedPrice = Double((payedPrice!.value)!)  ?? 0.0
        
        viewItem.timesWorn = Int((timesWorn!.value)!)  ?? 0
        
        if(templastTimeWorn != ""  && templastTimeWorn != nil){viewItem.lastTimeWorn = templastTimeWorn}else{viewItem.dateReleased = "N/A"}
        
        if(kind!.value != ""){viewItem.kind = kind!.value}else{viewItem.kind = "N/A"}
        
        if(size!.value != ""){viewItem.size = size!.value}else{viewItem.size = "N/A"}
        
        if(tempdatePurchased != ""  && tempdatePurchased != nil){viewItem.datePurchased = tempdatePurchased}else{viewItem.dateReleased = "N/A"}
        
        if(color!.value != ""){viewItem.color = color!.value}else{viewItem.color = "N/A"}
        
        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        
        if(thirdColor!.value != ""){viewItem.thirdColor = thirdColor!.value}else{viewItem.thirdColor = "N/A"}
        
        if(itemNotes!.value != ""){viewItem.itemNotes = itemNotes!.value}else{viewItem.itemNotes = "N/A"}
        
        if(tempDateReleased != ""  && tempDateReleased != nil){viewItem.dateReleased = tempDateReleased}else{viewItem.dateReleased = "N/A"}
        
        viewItem.retailPrice = Double((retailPrice!.value)!)  ?? 0.0
        
        if(condition!.value != ""){viewItem.condition = condition!.value}else{viewItem.condition = "N/A"}
        
        if(primaryMaterial!.value != ""){viewItem.primaryMaterial = primaryMaterial!.value}else{viewItem.primaryMaterial = "N/A"}
        //        viewItem.secondaryColor = String(secondaryColor!.value)  ?? "N/A"
        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        //        viewItem.sellerURL = sellerURL!.value  ?? "N/A"
        if(sellerURL!.value != ""){viewItem.sellerURL = sellerURL!.value}else{viewItem.sellerURL = "N/A"}
        
        if(storeLocation!.value != ""){viewItem.storeLocation = storeLocation!.value}else{viewItem.storeLocation = "N/A"}
        
        if(sellerName!.value != ""){viewItem.sellerName = sellerName!.value}else{viewItem.sellerName = "N/A"}
        
        self.viewItem.populatePath(Users_Wardrobe.closetSelectionString)
        
        if(tempdateDeleted != ""  && tempdateDeleted != nil){viewItem.dateDeleted = tempdateDeleted}else{viewItem.dateDeleted = "N/A"}
        
        //Sets up Tableview UI
        self.manager?.style.setBackgroundImage(UIImage(named: "cellBlackPatternImage"), forCellType: RETableViewCellType.Single)
        //        self.manager!.tableView?.sectionIndexColor = UIColor.greenColor()
        self.manager!.tableView?.tintColor = UIColor.greenColor()
        //        self.manager!.tableView?.sectionIndexBackgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.manager!.tableView?.backgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorColor = UIColor.blueColor()
    }
}



//MARK: -Initializers
extension EditItemViewController{
    func setUp(){
        self.setUI()
        self.setPickerInfo()
        self.initializeRETableView()
        self.setUpTableView()
        self.previousItem = self.viewItem
        self.animateAllButtons()
    }//Sets up data
    func createBasicCells(){
        
    }
    func createMiscCells(){
        
    }
    func setTitle(){
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Edit")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
    }
    func setUI(){
        self.setTitle()
    }
    func initializeRETableView(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        var tempDateReleased:NSDate?
        var templastTimeWorn:NSDate?
        var tempdatePurchased:NSDate?
        
        if (self.viewItem.dateReleased != nil){
            tempDateReleased = dateFormatter.dateFromString(self.viewItem.dateReleased!)
        }else{self.dateReleased?.value = nil}
        
        if (self.viewItem.lastTimeWorn != nil){
            templastTimeWorn = dateFormatter.dateFromString(self.viewItem.lastTimeWorn)
        }else{self.dateReleased?.value = nil}
        
        if (self.viewItem.datePurchased != nil){
            tempdatePurchased = dateFormatter.dateFromString(self.viewItem.datePurchased)
        }else{self.dateReleased?.value = nil}
        
        //        var radio = RERadioItem(title: "Test Radio", value: "Radio", selectionHandler: nil)
        
        self.model = RETextItem(title: "Name", value: self.viewItem.model, placeholder: "Enter Item Name")
        
        //        self.brand = REPickerItem(title: "Brand", value: ["--:--"], placeholder: "--:--", options: ["1"])
        self.brand = RETextItem(title: "Brand", value: self.viewItem.brand, placeholder: "Enter Item brand")
        
        self.favorited = REBoolItem(title: "Favorite", value: self.viewItem.favorited)
        
        self.payedPrice = RENumberItem(title: "Original Price", value: String(self.viewItem.payedPrice), placeholder: "Enter Value for The Item")
        
        self.timesWorn = RENumberItem(title: "Times Worn/Used", value: String(self.viewItem.timesWorn), placeholder: "Enter Value for times worn")
        
        self.lastTimeWorn = REDateTimeItem(title: "Last Time Worn", value: templastTimeWorn, placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        
        
        self.kind = RETextItem(title: "Kind", value: self.viewItem.kind, placeholder: "Enter Item kind")
        
        self.size = RETextItem(title: "Size", value: self.viewItem.size, placeholder: "Enter Item size")
        
        self.datePurchased = REDateTimeItem(title: "Date Purchased", value: tempdatePurchased , placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        
        //        self.color = REPickerItem(title: "Color", value: COLOR_TYPE, placeholder: "Color", options: [])
        self.color = RETextItem(title: "Color", value: self.viewItem.color, placeholder: "Enter Item color")
        //        self.secondaryColor = REPickerItem(title: "Secondary Color", value: COLOR_TYPE, placeholder: nil, options: [])
        
        self.secondaryColor = RETextItem(title: "Secondary Color", value: self.viewItem.secondaryColor, placeholder: "Enter Item secondaryColor")
        //        self.thirdColor = REPickerItem(title: "Third Color", value: COLOR_TYPE, placeholder: nil, options: [])
        
        self.thirdColor = RETextItem(title: "Third Color", value: self.viewItem.thirdColor, placeholder: "Enter Item thirdColor")
        
        self.itemNotes = RELongTextItem(title: "Item Notes", value: self.viewItem.itemNotes, placeholder: nil)
        
        self.isThisNew = REBoolItem(title: "New Item", value: self.viewItem.isThisNew)
        
        self.dateReleased = REDateTimeItem(title: "Release Date", value: tempDateReleased, placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        
        self.retailPrice = RENumberItem(title: "Paid Price", value: self.viewItem.retailPrice.description, placeholder: "Enter Value for The Item")
        
        //        self.condition = REPickerItem(title: "Item Condition", value: ItemAttributeName.ITEM_CONDITION, placeholder: "Item Condition", options:[])
        self.condition = RETextItem(title: "Condition", value: self.viewItem.condition, placeholder: "Enter Item condition")
        
        //        self.primaryMaterial = REPickerItem(title: "Primary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        self.primaryMaterial = RETextItem(title: "Primary Material", value: self.viewItem.primaryMaterial, placeholder: "Enter Item Primary Material")
        
        //        self.secondaryMaterial = REPickerItem(title: "Secondary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        self.secondaryMaterial = RETextItem(title: "Secondary Material", value: self.viewItem.secondaryColor, placeholder: "Enter Secondary Material Name")
        
        self.sellerURL = RETextItem(title: "Store Website/URL", value: self.viewItem.sellerURL, placeholder: "Enter Location")
        self.storeLocation = RETextItem(title: "Store Location", value: self.viewItem.storeLocation, placeholder: "Enter Item storeLocation")
        
        self.sellerName = RETextItem(title: "Seller Name", value: self.viewItem.sellerName, placeholder: "Enter Item Seller Name")
    }
    func setUpTableView(){
        manager = RETableViewManager.init(tableView: self.tableView, delegate: self)
        
        self.basicSection = RETableViewSection(headerTitle: "Basic Section")
        self.miscSection = RETableViewSection(headerTitle: "Misc Section")
        
        
        self.manager?.style.setBackgroundImage(UIImage(named: "cellBlackPatternImage"), forCellType: RETableViewCellType.Single)
        //        self.manager!.tableView?.sectionIndexColor = UIColor.greenColor()
        self.manager!.tableView?.tintColor = UIColor.purpleColor()
        //        self.manager!.tableView?.sectionIndexBackgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.manager!.tableView?.backgroundColor = UIColor.darkGrayColor()
        self.manager!.tableView?.separatorColor = UIColor.whiteColor()
        
        
        self.manager!.addSection(basicSection)
        self.manager!.addSection(miscSection)
        
        
        self.basicSection?.addItem(favorited)
        self.basicSection?.addItem(model)
        self.basicSection?.addItem(brand)
        self.basicSection?.addItem(payedPrice)
        self.basicSection?.addItem(timesWorn)
        self.basicSection?.addItem(lastTimeWorn)
        self.basicSection?.addItem(kind)
        self.basicSection?.addItem(size)
        
        self.miscSection?.addItem(datePurchased)
        self.miscSection?.addItem(color)
        self.miscSection?.addItem(secondaryColor)
        self.miscSection?.addItem(thirdColor)
        self.miscSection?.addItem(isThisNew)
        self.miscSection?.addItem(dateReleased)
        self.miscSection?.addItem(retailPrice)
        self.miscSection?.addItem(condition)
        self.miscSection?.addItem(primaryMaterial)
        self.miscSection?.addItem(secondaryMaterial)
        self.miscSection?.addItem(sellerURL)
        self.miscSection?.addItem(storeLocation)
        self.miscSection?.addItem(sellerName)
        self.miscSection?.addItem(itemNotes)
    }
}



//MARK: -Animations-EditItemViewController Extension
extension EditItemViewController{
    func setButtonsView(){
        //        buttonAnimation(categoryInputTextField)
        //        buttonAnimation(subCategoryInputTextField)
        //        buttonAnimation(pictureForSelectedItemImage)
        //        buttonAnimation(pictureButton)
        buttonAnimation(updateButton)
        buttonAnimation(deleteButton)
        
    }
}



//MARK: - PickerView Methods
extension EditItemViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return categoryPickerOptions.count
        }else if pickerView == subCategoryPickerView{
            let pickerRowsPlusAddFieldOption = subCategoryPickerOptions.count + 1
            
            
            return pickerRowsPlusAddFieldOption
            //        }else if pickerView == cellBrandPickerView{
            //            let brandArrayPlus1 = Users_Wardrobe.brandCollection.count + 1
            //
            //
            //            return brandArrayPlus1
            //
        }
        assertionFailure("This shouldn't be happening")
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView{
            return categoryPickerOptions[row]
        }else if pickerView == subCategoryPickerView{
            if row == (subCategoryPickerOptions.count){
                
                return "Add New Sub-Category"
            }else{
                return subCategoryPickerOptions[row]
            }
            //        }else if pickerView == cellBrandPickerView{//if pickerView == cellPickerView{
            //            if row == (Users_Wardrobe.brandCollection.count){
            //                return "Add New Sub-Category"
            //            }else{
            //                return Users_Wardrobe.brandCollection[row]
        }
        assertionFailure("This shouldn't be happening")
        return String()
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView{
            subCategoryInputTextField.inputView = subCategoryPickerView
            subCategoryPickerView.delegate = self
            categorySelected = categoryPickerOptions[row]
            categoryInputTextField.text = categorySelected
            subCategoryInputTextField.enabled = true
            //            self.tableView.hidden = true
            subCategoryPickerOptions.removeAll(keepCapacity: false)
            
            
            let loadedArchived = Users_Wardrobe.selectedCloset
            let keysOfCategory = (loadedArchived[categorySelected]! as Dictionary).keys
            
            for key in keysOfCategory{
                subCategoryPickerOptions.append(key)
            }
            
            subCategoryInputTextField.text = String()
            
        }else if pickerView == subCategoryPickerView{
            defer{
                //                self.tableView.dataSource = self
                //                self.tableView.delegate = self
                //                self.tableView.reloadData()
                //                self.tableView.hidden = false
            }
            if row == (subCategoryPickerOptions.count){
                subCategoryInputTextField.inputView = nil
                subCategoryInputTextField.reloadInputViews()
                subCategoryInputTextField.delegate = self
                subCategoryInputTextField.text = String()
            }else{
                subCategorySelected = subCategoryPickerOptions[row]
                subCategoryInputTextField.text = subCategorySelected
            }
            
        }
    }
}



//MARK: - ImagePickerView
extension EditItemViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImagePicker(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //var video = info[UIImagePickerControllerMediaURL] as? NSURL
        let picture = info[UIImagePickerControllerOriginalImage] as? UIImage
        pictureForSelectedItemImage.image = picture
        viewItem.image = picture
        
        //pictureButtonForSelectedItemImage.setImage(picture, forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: -Picker Sub Methods
    func setPickerInfo(){
        dispatch_async(GlobalBackgroundQueue, {
            //Category
            self.categoryPickerView.delegate = self
            self.categoryInputTextField.inputView = self.categoryPickerView
            
            
            //Sub-Category
            self.subCategoryPickerView.delegate = self
            self.subCategoryInputTextField.inputView = self.subCategoryPickerView
            
            self.categoryInputTextField.text = self.viewItem.category
            self.subCategoryInputTextField.text = self.viewItem.subCategory
            self.pictureForSelectedItemImage.image = self.viewItem.image
        })
    }
}



//MARK: -Text Field
extension EditItemViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
        
        textField.isFirstResponder()
        return true
        
    }// return NO to disallow editing.
    func textFieldDidBeginEditing(textField: UITextField){
        textField.becomeFirstResponder()
    } // became first responder
    func textFieldShouldEndEditing(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    } // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    func textFieldDidEndEditing(textField: UITextField){
        if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
        }
        
        textField.resignFirstResponder()
        
    } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldShouldClear(textField: UITextField) -> Bool{
        log.warning("Not yet implemented")
        return true
    } // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Next as return button, for other fields
        if textField == categoryInputTextField{
            categorySelected = categoryInputTextField.text
            subCategoryInputTextField.delegate = self
            subCategoryInputTextField.becomeFirstResponder()
        }else if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
            subCategoryPickerOptions.append(subCategorySelected)
            subCategoryPickerView.removeFromSuperview()
            
            //            self.tableView.dataSource = self
            //            self.tableView.delegate = self
            //            self.tableView.reloadData()
            //            self.tableView.hidden =
        }
        return true
    }
}



//MARK: - UI-ModelTableViewController Extension
extension EditItemViewController{
    func animateAllButtons(){
        self.animateButtons()
        self.animateImage()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
    func animateImage(){
        imageCustomization(self.image)
    }
    func animateButtons(){
        deleteButtonCustomization(self.deleteButton)
        addButtonCustomization(self.updateButton)
        nameLabelCustomizer(self.categoryLabel)
                nameLabelCustomizer(self.subCategoryLabel)
    }
}



//MARK: -Anylitics-EditItemViewController Extension
extension EditItemViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("EDIT_PAGE_COUNT")
            //        let editButtonPressed:Int? = defaults.returnIntValue("EDIT_BUTTON_BUTTON_PRESSED")
            
            Answers.logContentViewWithName("Edit Content View",
                contentType: "Edit View",
                contentId: "MF6",
                customAttributes: ["EDIT_PAGE_COUNT": pageCount!
                    
                    //                "EDIT_BUTTON_BUTTON_PRESSED": editButtonPressed!
                ])
        })
    }
}



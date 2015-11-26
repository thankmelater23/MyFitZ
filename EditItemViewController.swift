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

class EditItemViewController: UIViewController, RETableViewManagerDelegate{
    @IBOutlet var tableView: UITableView!
    @IBOutlet var categoryInputTextField: UITextField!
    @IBOutlet var subCategoryInputTextField: UITextField!
    var categoryPickerView = UIPickerView()
    var subCategoryPickerView = UIPickerView()
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    
    var manager:RETableViewManager?
    
    var basicSection:RETableViewSection?
    var miscSection:RETableViewSection?
    
    var model:RETextItem?
    var brands:RETableViewPickerCell?
    var brand:RETextItem?
    var favorited:REBoolItem?
    var price:RENumberItem?
    var timesWorn:RENumberItem?
    var lastTimeWorn:REDateTimeItem?
    var datePurchased:REDateTimeItem?
    //    var color:REPickerItem?
    var color:RETextItem?
    //    var secondaryColor:REPickerItem?
    var secondaryColor:RETextItem?
    //    var thirdColor:REPickerItem?
    var thirdColor:RETextItem?
    var itemDescription: RELongTextItem?
    var dateReleased:REDateTimeItem?
    var retailPrice:RENumberItem?
    //    var condition:REPickerItem?
    var condition:RETextItem?
    //    var primaryMaterial:REPickerItem?
    var primaryMaterial:RETextItem?
    //    var secondaryMaterial:REPickerItem?
    var secondaryMaterial:RETextItem?
    var storeLocationURL:RETextItem?
    //    var arrayOfImages:R?
    var isThisNew:REBoolItem?//{willSet:
    //        if timesWorn > 0{
    //            self =
    //        }
    //    }
    
    @IBOutlet var pictureForSelectedItemImage: UIImageView!
    //CreateItemViewController Item to be created and modified to be saved
    var viewItem: Item! = Item()
    var previousItem: Item! = Item()
    var currentIndex = 0
    ///Dictionary path to item
    var path: [String: String] = [String: String]()
    @IBAction func updateItem() {
        do{
            playSoundEffects(updateSFX)
            saveItemVars()
            //gamesWardrobe.swapItem(viewItem.category, funcSubCategory: viewItem.subCategory, prevFuncCategory: previousItem.category, prevFuncSubCategory: previousItem.subCategory, item: viewItem)
            gamesWardrobe.deleteItem(previousItem.category, funcSubCategory: previousItem.subCategory, item: previousItem)
            try gamesWardrobe.save(categorySelected, funcSubCategory: subCategorySelected, item: viewItem)
            
            super.viewDidLoad()
        }
            
            
        catch ItemError.IncorrectSubCategory{
            let alert = UIAlertController(title: "SubCategory Missing", message: "Enter in correct subcateogry", preferredStyle: UIAlertControllerStyle.Alert)
        }catch ItemError.missingModelString{
            let alert = UIAlertController(title: "Model String Missing", message: "Enter in correct Model String", preferredStyle: UIAlertControllerStyle.Alert)
            //             alert.show()
        }catch ItemError.addImage{
            let alert = UIAlertController(title: "Image not selected", message: "Selctect image", preferredStyle: UIAlertControllerStyle.Alert)
        }catch{
            assertionFailure("Unknow error type thrown")
        }
        
        subCategoryPickerView.reloadAllComponents()
        subCategoryPickerView.reloadInputViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    func saveItemVars(){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        var tempDateReleased:String?
        var templastTimeWorn:String?
        var tempdatePurchased:String?
        
        
        if (dateReleased?.value != nil){
            tempDateReleased = dateFormatter.stringFromDate(self.dateReleased!.value)
            tempDateReleased = tempDateReleased!.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        }else{tempDateReleased = nil}
        //         templastTimeWorn = String([dateFormatter .stringFromDate((self.lastTimeWorn?.value)!)])
        if (lastTimeWorn?.value != nil){
            templastTimeWorn = dateFormatter.stringFromDate(self.lastTimeWorn!.value)
            templastTimeWorn = templastTimeWorn!.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        }else{templastTimeWorn = nil}
        //         tempdatePurchased = String([dateFormatter .stringFromDate((self.datePurchased?.value)!)])
        if (datePurchased?.value != nil){
            tempdatePurchased = dateFormatter.stringFromDate(self.datePurchased!.value)
            tempdatePurchased = tempdatePurchased!.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        }else{tempdatePurchased = nil}
        
        //        dateReleased.filter({$0 != "["})
        //        viewItem.model = model!.value  ?? "N/A"
        if(model!.value != ""){viewItem.model = model!.value}else{viewItem.model = "N/A"}
        //        viewItem.brand = brand!.value  ?? "N/A"
        if(brand!.value != ""){viewItem.brand = brand!.value}else{viewItem.brand = "N/A"}
        viewItem.favorited = favorited!.value  ?? false
        viewItem.price = Double((price!.value)!)  ?? 0.0
        viewItem.timesWorn = Int((timesWorn!.value)!)  ?? 0
        //        viewItem.lastTimeWorn = templastTimeWorn//String(lastTimeWorn!.value)  ?? "N/A"
        //        if(lastTimeWorn!.value != ""){viewItem.lastTimeWorn = templastTimeWorn}else{viewItem.lastTimeWorn = "N/A"}
        if(templastTimeWorn != ""  && templastTimeWorn != nil){viewItem.lastTimeWorn = templastTimeWorn}else{viewItem.dateReleased = "N/A"}
        //        viewItem.datePurchased = tempdatePurchased//String(datePurchased!.value)  ?? "N/A"
        //        if(datePurchased!.value != ""){viewItem.datePurchased = tempdatePurchased}else{viewItem.datePurchased = "N/A"}
        if(tempdatePurchased != ""  && tempdatePurchased != nil){viewItem.datePurchased = tempdatePurchased}else{viewItem.dateReleased = "N/A"}
        //        viewItem.color = String(color!.value)  ?? "N/A"
        if(color!.value != ""){viewItem.color = color!.value}else{viewItem.color = "N/A"}
        //        viewItem.secondaryColor = String(secondaryColor!.value)  ?? "N/A"
        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        //        viewItem.thirdColor = String(thirdColor!.value)  ?? "N/A"
        if(thirdColor!.value != ""){viewItem.thirdColor = thirdColor!.value}else{viewItem.thirdColor = "N/A"}
        //        viewItem.itemDescription = itemDescription!.value ?? "N/A"
        if(itemDescription!.value != ""){viewItem.itemDescription = itemDescription!.value}else{viewItem.itemDescription = "N/A"}
        //        viewItem.dateReleased = tempDateReleased//String(dateReleased!.value)  ?? "N/A"
        if(tempDateReleased != ""  && tempDateReleased != nil){viewItem.dateReleased = tempDateReleased}else{viewItem.dateReleased = "N/A"}
        viewItem.retailPrice = Double((retailPrice!.value)!)  ?? 0.0
        //        viewItem.condition = String(condition!.value)  ?? "N/A"
        if(condition!.value != ""){viewItem.condition = condition!.value}else{viewItem.condition = "N/A"}
        //        viewItem.primaryMaterial = String(primaryMaterial!.value)  ?? "N/A"
        if(primaryMaterial!.value != ""){viewItem.primaryMaterial = primaryMaterial!.value}else{viewItem.primaryMaterial = "N/A"}
        //        viewItem.secondaryColor = String(secondaryColor!.value)  ?? "N/A"
        if(secondaryColor!.value != ""){viewItem.secondaryColor = secondaryColor!.value}else{viewItem.secondaryColor = "N/A"}
        //        viewItem.storeLocationURL = storeLocationURL!.value  ?? "N/A"
        if(storeLocationURL!.value != ""){viewItem.storeLocationURL = storeLocationURL!.value}else{viewItem.storeLocationURL = "N/A"}
        
        self.manager?.style.setBackgroundImage(UIImage(named: "cellBlackPatternImage"), forCellType: RETableViewCellType.Single)
        //        self.manager!.tableView?.sectionIndexColor = UIColor.greenColor()
        self.manager!.tableView?.tintColor = UIColor.greenColor()
        //        self.manager!.tableView?.sectionIndexBackgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.manager!.tableView?.backgroundColor = UIColor.greenColor()
        self.manager!.tableView?.separatorColor = UIColor.blueColor()
    }
    
    @IBAction func setItemImage(sender: UIButton) {
        self.setImagePicker()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_CREATION_TO_SELECTION{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MAKE{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MODEL{
            let array = gamesWardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]
            
            let modelController = segue.destinationViewController as! ModelTableViewController
            modelController.arrayOfItems = array
            modelController.path = self.path
            
            
            
        }
        if segue.identifier == SEGUE_CREATION_TO_DETAIL{
            
        }
        
    }
}

//MARK: - Developer Created Methods
extension EditItemViewController{
    func setUp(){
        
        
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Edit")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        let tempLastTimeWorn = dateFormatter.dateFromString(viewItem.lastTimeWorn)
        let tempDatePurchased = dateFormatter.dateFromString(viewItem.datePurchased)
        let tempDateReleased = dateFormatter.dateFromString(viewItem.dateReleased)
        
        
        //Category
        categoryPickerView.delegate = self
        categoryInputTextField.inputView = categoryPickerView
        
        
        //Sub-Category
        subCategoryPickerView.delegate = self
        subCategoryInputTextField.inputView = subCategoryPickerView
    
        
        manager = RETableViewManager.init(tableView: self.tableView, delegate: self)
        
        self.basicSection = RETableViewSection(headerTitle: "Basic Section")
        self.miscSection = RETableViewSection(headerTitle: "Misc Section")
        
        //        self.manager!.tableView?.scrollEnabled = false
        self.manager!.tableView?.layer.shadowOpacity = 1
        self.manager!.tableView?.layer.shadowRadius = 10
        self.manager!.tableView?.layer.shadowOffset = CGSizeMake(0, 0)
        self.manager!.tableView?.layer.shadowColor = UIColor.grayColor().CGColor
        self.manager!.tableView?.clipsToBounds = false
//        self.manager!.tableView?.separatorColor
//        self.manager!.tableView?.separatorStyle
//        self.manager!.tableView?.backgroundColor
//        self.manager!.tableView?.
        //        self.manager!.style.cellHeight = 100
        
        self.categoryInputTextField.text = viewItem.category
        self.subCategoryInputTextField.text = viewItem.subCategory
        self.pictureForSelectedItemImage.image = viewItem.image
        
        //        var radio = RERadioItem(title: "Test Radio", value: "Radio", selectionHandler: nil)
        self.model = RETextItem(title: "Model", value: self.viewItem.model, placeholder: "Enter Item Name")
        //        self.brand = REPickerItem(title: "Brand", value: ["--:--"], placeholder: "--:--", options: ["1"])
        self.brand = RETextItem(title: "Brand", value: self.viewItem.brand, placeholder: "Enter Item brand")
        self.favorited = REBoolItem(title: "Favorite", value: self.viewItem.favorited)
        self.price = RENumberItem(title: "Original Price", value: String(self.viewItem.price), placeholder: "Enter Value for The Item")
        self.timesWorn = RENumberItem(title: "Times Worn/Used", value: String(self.viewItem.timesWorn), placeholder: "Enter Value for times worn")
        self.lastTimeWorn = REDateTimeItem(title: "Last Time Worn", value: tempLastTimeWorn, placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        self.datePurchased = REDateTimeItem(title: "Date Purchased", value: tempDatePurchased , placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        //        self.color = REPickerItem(title: "Color", value: COLOR_TYPE, placeholder: "Color", options: [])
        self.color = RETextItem(title: "Color", value: self.viewItem.color, placeholder: "Enter Item color")
        //        self.secondaryColor = REPickerItem(title: "Secondary Color", value: COLOR_TYPE, placeholder: nil, options: [])
        self.secondaryColor = RETextItem(title: "Secondary Color", value: self.viewItem.secondaryColor, placeholder: "Enter Item secondaryColor")
        //        self.thirdColor = REPickerItem(title: "Third Color", value: COLOR_TYPE, placeholder: nil, options: [])
        self.thirdColor = RETextItem(title: "Third Color", value: self.viewItem.thirdColor, placeholder: "Enter Item thirdColor")
        self.itemDescription = RELongTextItem(title: "Item Notes", value: self.viewItem.itemDescription, placeholder: nil)
        self.isThisNew = REBoolItem(title: "New Item", value: self.viewItem.isThisNew)
        self.dateReleased = REDateTimeItem(title: "Release Date", value: tempDateReleased, placeholder: nil, format: "MM/dd/yyyy", datePickerMode: UIDatePickerMode.Date)
        self.retailPrice = RENumberItem(title: "Paid Price", value: self.viewItem.retailPrice.description, placeholder: "Enter Value for The Item")
        //        self.condition = REPickerItem(title: "Item Condition", value: ITEM_CONDITION, placeholder: "Item Condition", options:[])
        self.condition = RETextItem(title: "Condition", value: self.viewItem.condition, placeholder: "Enter Item condition")
        //        self.primaryMaterial = REPickerItem(title: "Primary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        self.primaryMaterial = RETextItem(title: "Primary Material", value: self.viewItem.primaryMaterial, placeholder: "Enter Item Primary Material")
        //        self.secondaryMaterial = REPickerItem(title: "Secondary Material", value: MATERIAL_TYPE, placeholder: "Material Type", options: [])
        self.secondaryMaterial = RETextItem(title: "Secondary Material", value: self.viewItem.secondaryColor, placeholder: "Enter Secondary Material Name")
        self.storeLocationURL = RETextItem(title: "Store Website/URL", value: self.viewItem.storeLocationURL, placeholder: "Enter Location")
        
        
        self.manager!.addSection(basicSection)
        self.manager!.addSection(miscSection)
        
        //        self.basicSection?.addItem(radio)
        self.basicSection?.addItem(favorited)
        self.basicSection?.addItem(model)
        self.basicSection?.addItem(brand)
        self.basicSection?.addItem(price)
        self.basicSection?.addItem(timesWorn)
        self.basicSection?.addItem(lastTimeWorn)
        
        
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
        self.miscSection?.addItem(storeLocationURL)
        self.miscSection?.addItem(itemDescription)
    }//Sets up data
    func createBasicCells(){
        
    }
    func createMiscCells(){
        
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
            //            let brandArrayPlus1 = gamesWardrobe.brandCollection.count + 1
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
            //            if row == (gamesWardrobe.brandCollection.count){
            //                return "Add New Sub-Category"
            //            }else{
            //                return gamesWardrobe.brandCollection[row]
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
            
            
            let loadedArchived = gamesWardrobe.selectedCloset
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

//MARK: - ImagePickerView Methods
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
}


//Text Field methods
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
        print("textFieldShouldClear:" + textField.text! + " cleared")
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
/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one


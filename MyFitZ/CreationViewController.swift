///
//  CreationViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import MobileCoreServices



//MARK: - CreationViewController class
class CreationViewController: UIViewController{
    @IBOutlet weak  var tableView: UITableView!
    @IBOutlet weak  var categoryInputTextField: UITextField!
    @IBOutlet weak  var subCategoryInputTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet var pictureForSelectedItemImage: UIImageView!
    
    var datePickerHidden: Bool = false
    var categoryPickerView = UIPickerView()
    var subCategoryPickerView = UIPickerView()
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    var cellBrandPickerView = UIPickerView()
    var brandSelected = String()
    var cellDatePicker = UIDatePicker()
    var cellYesNoPicker = UIPickerView()
    var tutorialImage = UIImage()
    //CreationViewController Item to be created and modified to be saved
    var viewItem: Item! = Item()
    var currentIndex = 0
    ///Dictionary path to item
    var path: [String: String] = [String: String]()
    @IBAction func createItem(sender: UIButton) {
        
        do{
            try Users_Wardrobe.save(categorySelected, funcSubCategory: subCategorySelected, item: viewItem)
        }
            
            
        catch ItemError.IncorrectSubCategory{
            //            let alert = UIAlertView(title: "SubCategory Missing", message: "Enter in correct subcateogry", delegate: self, cancelButtonTitle: "OK")
            //            alert.show()
        }catch ItemError.missingModelString{
            //            let alert = UIAlertView(title: "Model String Missing", message: "Enter in correct Model String", delegate: self, cancelButtonTitle: "OK")
            //            alert.show()
        }catch ItemError.addImage{
            //            let alert = UIAlertView(title: "Image not selected", message: "Selctect image", delegate: self, cancelButtonTitle: "OK")
            //            alert.show()
        }catch{
            assertionFailure("Unknow error type thrown")
        }
        
        subCategoryPickerView.reloadAllComponents()
        subCategoryPickerView.reloadInputViews()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        log.info(__FUNCTION__)
        self.setUp()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func setItemImage(sender: UIButton) {
        self.setImagePicker()
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
        
        if segue.identifier == SEGUE_CREATION_TO_SELECTION{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MAKE{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MODEL{
            let array = Users_Wardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]
            
            let modelController = segue.destinationViewController as! ModelTableViewController
            modelController.arrayOfItems = array
            modelController.path = self.path
            
            
            
        }
        if segue.identifier == SEGUE_CREATION_TO_DETAIL{
            
        }
        
    }
}


//MARK: - TableView Methods
extension  CreationViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }// Return the number of sections.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return 6
        }else{//(section == 1)
            return 2
        }
    }// Return the number of rows in the section.
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        //        if datePickerHidden && indexPath.section == 1 && indexPath.row == 0{
        //            return 0
        //        }else{
        //            return 200
        //        }
        return 150
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //self.tableView.reloadData()
        if indexPath.section == 0{
            return  self.createCellFromRequiredDictionary(row: indexPath.row) as CreationUITableViewCell
        }else if indexPath.section == 1{
            return self.createCellFromOptionalDictionary(row: indexPath.row) as CreationUITableViewCell
        }else{
            assertionFailure("Unexpected value of indexPath.section == \(indexPath.section)")
            return CreationUITableViewCell()
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Required"
        }else{
            return "Optional"
        }
    }//Puts a text label in the header of the specified section
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        currentIndex = indexPath.row
        if indexPath.section == 1 && indexPath.row == 0{//Date picker
            toggleDatepicker()
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if datePickerHidden && indexPath.section == 1 && indexPath.row == 0{
            return 0
        }else{
            //FIXME: - This is controlling the cell size find way to get automated
            return 25// (tableView.cellForRowAtIndexPath(indexPath)?.frame.height)!
        }
    }
    
    func toggleDatepicker(){
        datePickerHidden = !datePickerHidden
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    ///Returns cell of required dictionary
    func createCellFromRequiredDictionary(row row: Int) -> CreationUITableViewCell{
        let cell : CreationUITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell
        
        var keyAndValue: String!
        
        switch row {
        case 0 :
            keyAndValue = ITEM_BRAND_STRING
            
            
            cell.configure(text: brandSelected, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.inputView = cellBrandPickerView
        case 1 :
            keyAndValue = ITEM_MODEL_STRING
            cell.configure(text: viewItem.model, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.keyboardType = UIKeyboardType.NamePhonePad
        case 2 :
            keyAndValue = ITEM_FAVORITED_STRING
            cell.configure(text: viewItem.favorited?.description, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.inputView = cellYesNoPicker
        case 3 :
            keyAndValue = ITEM_PRICE_STRING
            cell.configure(text: viewItem.payedPrice?.description, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.keyboardType = UIKeyboardType.NumberPad
        case 4 :
            keyAndValue = ITEM_ISTHISNEW_STRING
            cell.configure(text: viewItem.isThisNew?.description, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.inputView = cellYesNoPicker
        case 5 :
            keyAndValue = ITEM_TIMESWORN_STRING
            cell.configure(text: viewItem.timesWorn?.description, labelString: keyAndValue, tag: row)
            cell.textInputCellTextField.keyboardType = UIKeyboardType.NumberPad
        case 6 :
            keyAndValue = ITEM_LASTTIMEWORN_STRING
            cell.configure(text: viewItem.favorited!.description, labelString: keyAndValue, tag: row)
            
        default:
            assertionFailure("Out of scope on the switch statement. row = \(row)")
        }
        
        if row < 6{
            cell.textInputCellTextField.returnKeyType = UIReturnKeyType.Next
        }else{
            cell.textInputCellTextField.returnKeyType = UIReturnKeyType.Done
        }
        
        cell.textInputCellTextField.delegate = self
        return cell as CreationUITableViewCell
    }
    //Returns cell of Optional dictionary
    func createCellFromOptionalDictionary(row row: Int) -> CreationUITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell
        
        var keyAndValue: String!
        
        switch row {
            
        case 0:
            keyAndValue = ITEM_DATEPURCHASERD_STRING
            cell.configure(text: viewItem.datePurchased, labelString: keyAndValue, tag: row+100)
        case 1:
            keyAndValue = ITEM_COLOR_STRING
            cell.configure(text: viewItem.color, labelString: keyAndValue, tag: row+100)
        default:
            assertionFailure("Out of scope on the switch statement. row = \(row)")
        }
        
        if row < 1{
            cell.textInputCellTextField.returnKeyType = UIReturnKeyType.Next
        }else{
            cell.textInputCellTextField.returnKeyType = UIReturnKeyType.Done
        }
        
        cell.textInputCellTextField.delegate = self
        return cell as CreationUITableViewCell
    }
}

//MARK: - Developer Created Methods
extension CreationViewController{
    func setUp(){
        //Category
        categoryPickerView.delegate = self
        categoryInputTextField.inputView = categoryPickerView
        
        
        //Sub-Category
        subCategoryPickerView.delegate = self
        subCategoryInputTextField.inputView = subCategoryPickerView
        subCategoryInputTextField.enabled = false
        
        self.setNeededTextFieldsToUnset()
        
        //        cellDatePicker.
        cellBrandPickerView.delegate = self
        cellYesNoPicker.delegate = self
        
        //Image
        self.pictureForSelectedItemImage.alpha = 0.5
        
        //Table View Init
        //self.createDicsAndAppendToArray()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        self.tableView.hidden = true
        
        viewItem.image = UIImage(named: BLANK_IMAGE_STRING)
    }//Sets up data
    func setNeededTextFieldsToUnset(){
        self.categoryInputTextField.layer.borderWidth = 2
        self.categoryInputTextField.layer.borderColor = UIColor.redColor().CGColor
        
        self.subCategoryInputTextField.layer.borderWidth = 2
        self.subCategoryInputTextField.layer.borderColor = UIColor.redColor().CGColor
    }
}



//MARK: - PickerView Methods
extension CreationViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return categoryPickerOptions.count
        }else if pickerView == subCategoryPickerView{
            let pickerRowsPlusAddFieldOption = subCategoryPickerOptions.count + 1
            
            
            return pickerRowsPlusAddFieldOption
        }else if pickerView == cellBrandPickerView{
            let brandArrayPlus1 = Users_Wardrobe.brandCollection.count + 1
            
            
            return brandArrayPlus1
        }else if pickerView == cellYesNoPicker{
            return YES_NO.count
        }else if pickerView == cellDatePicker{
            log.warning("Not yet implemented")
            return 1
        }else{
            assertionFailure()
            return 0
        }
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
        }else if pickerView == cellBrandPickerView{//if pickerView == cellPickerView{
            if row == (Users_Wardrobe.brandCollection.count){
                return "Add New Sub-Category"
            }else{
                return Users_Wardrobe.brandCollection[row]
            }
        }else if pickerView == cellYesNoPicker{
            return YES_NO[row]
        }else{
            assertionFailure()
            return String()
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView{
            subCategoryInputTextField.inputView = subCategoryPickerView
            subCategoryPickerView.delegate = self
            self.pictureForSelectedItemImage.alpha = 0.5
            categorySelected = categoryPickerOptions[row]
            categoryInputTextField.text = categorySelected
            subCategoryInputTextField.enabled = true
            self.tableView.hidden = true
            subCategoryPickerOptions.removeAll(keepCapacity: false)
            
            let loadedArchived = Users_Wardrobe.selectedCloset
            let keysOfCategory = (loadedArchived[categorySelected]! as Dictionary).keys
            
            for key in keysOfCategory{
                subCategoryPickerOptions.append(key)
            }
            
            subCategoryInputTextField.text = String()
            
        }else if pickerView == subCategoryPickerView{
            defer{
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.reloadData()
                self.tableView.hidden = false
            }
            if row == (subCategoryPickerOptions.count){
                subCategoryInputTextField.inputView = nil
                subCategoryInputTextField.reloadInputViews()
                subCategoryInputTextField.delegate = self
                subCategoryInputTextField.text = String()
                self.pictureForSelectedItemImage.alpha = 1.0
            }else{
                subCategorySelected = subCategoryPickerOptions[row]
                subCategoryInputTextField.text = subCategorySelected
                self.pictureForSelectedItemImage.alpha = 1.0
            }
        }else if pickerView == cellBrandPickerView{
            
            if row == Users_Wardrobe.brandCollection.count{
                //                                cell.textInputCellTextField.inputView = nil
                //                                cell.textInputCellTextField.reloadInputViews()
                //                                cell.textInputCellTextField.delegate = self
                //                                cell.textInputCellTextField.text = String()
            }else{
                brandSelected = Users_Wardrobe.brandCollection[row]
            }
        }else if pickerView == cellYesNoPicker{
            //                cell.textInputCellTextField.text = YES_NO[row]!
        }else if pickerView == cellDatePicker{
            
        }else{
            
        }
    }
}

//MARK: - ImagePickerView Methods
extension CreationViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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



//MARK: - UI-CreationViewController Extension
extension CreationViewController{
    func animateAllButtons(){
        self.animateButtons()
        self.animateImage()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
    func animateImage(){
        imageCustomization(self.pictureForSelectedItemImage)
    }
    func animateButtons(){
        nameLabelCustomizer(self.categoryLabel)
        nameLabelCustomizer(self.subCategoryLabel)
    }
}



//Text Field methods
extension CreationViewController: UITextFieldDelegate{
    func setValueForTaggedCell(tag tag: Int, value: String){
        var bool = true
        if value.lowercaseString == "YES".lowercaseString{
        }else if value.lowercaseString == "NO".lowercaseString{
            bool = false
        }
        //assert((bool != nil), "bool is nil")
        switch tag{
        case 0:
            viewItem.brand = value ?? "N/A"
        case 1:
            viewItem.model = value ?? "N/A"
        case 2:
            viewItem.favorited = bool ?? false
        case 3:
            viewItem.payedPrice = Double(value) ?? 0.0
        case 4:
            viewItem.isThisNew = bool ?? false
        case 5:
            viewItem.timesWorn = NSNumberFormatter().numberFromString(value)?.integerValue ?? 0
        case 6:
            viewItem.lastTimeWorn = value ?? "N/A"
        case 100:
            viewItem.datePurchased = value ?? "N/A"
        case 101:
            viewItem.color = value ?? "N/A"
        default:
            assertionFailure("switch statement isn't working for cell with tag: : \(tag)")
        }
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
        //        let pointInTable:CGPoint = textField.superview!.convertPoint(textField.frame.origin, toView: tableView)
        //        var contentOffset:CGPoint = tableView.contentOffset
        //        contentOffset.y  = pointInTable.y
        //        if let accessoryView = textField.inputAccessoryView {
        //            contentOffset.y -= accessoryView.frame.size.height
        //        }
        //        tableView.contentOffset = contentOffset
        //        return true
        //
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
        let tag = textField.tag
        
        if textField != categoryInputTextField || textField != subCategoryInputTextField{
            if tag == 0{
                textField.text = brandSelected
            }
            
            if let stringValue = textField.text{
                self.setValueForTaggedCell(tag: tag, value: stringValue)
            }
        }
        
        if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
            //            viewItem.subCategory = subCategorySelected
        }
        
        textField.resignFirstResponder()
        
    } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldShouldClear(textField: UITextField) -> Bool{
        log.warning("Not yet implemented")
        return true
    } // called when clear button pressed. return NO to ignore (no notifications)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Next as return button, for other fields
        if textField != subCategoryInputTextField && textField != categoryInputTextField{
            let nextTag: Int = textField.tag + 1
            if let nextResponder: UIResponder = self.tableView.viewWithTag(nextTag){
                nextResponder.becomeFirstResponder()
            }
        }else if textField == categoryInputTextField{
            categorySelected = categoryInputTextField.text
            subCategoryInputTextField.delegate = self
            subCategoryInputTextField.becomeFirstResponder()
        }else if textField == subCategoryInputTextField{
            subCategorySelected = subCategoryInputTextField.text
            subCategoryPickerOptions.append(subCategorySelected)
            subCategoryPickerView.removeFromSuperview()
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
            self.tableView.hidden = false
            
            if let nextResponder: UIResponder = self.tableView.viewWithTag(0){
                nextResponder.becomeFirstResponder()
            }
        }
        return true
    }
}
/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one
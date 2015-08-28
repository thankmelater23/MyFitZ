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
    @IBOutlet var tableView: UITableView!
    @IBOutlet var categoryInputTextField: UITextField!
    @IBOutlet var subCategoryInputTextField: UITextField!
    var categoryPickerView = UIPickerView()
    var subCategoryPickerView = UIPickerView()
    var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
    var subCategoryPickerOptions = [String]()
    var categorySelected: String! = String()
    var subCategorySelected: String! = String()
    @IBOutlet var pictureForSelectedItemImage: UIImageView!
    //CreationViewController Item to be created and modified to be saved
    var viewItem: Item! = Item()
    ///Dictionary path to item
    var path: [String: String] = [String: String]()
    @IBAction func createItem(sender: UIButton) {
        do{ try gamesWardrobe.save(categorySelected, funcSubCategory: subCategorySelected, item: viewItem)}//Do and try
            
        catch ItemError.IncorrectSubCategory{
            let alert = UIAlertView(title: "SubCategory Missing", message: "Enter in correct subcateogry", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }catch ItemError.missingModelString{
            let alert = UIAlertView(title: "Model String Missing", message: "Enter in correct Model String", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }catch{
            assertionFailure("Unknow error type thrown")
        }
    
            subCategoryPickerView.reloadAllComponents()
            subCategoryPickerView.reloadInputViews()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func setItemImage(sender: UIButton) {
        self.setImagePicker()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        //TODO: - Create segue set up to load closet and set in place
        if segue.identifier == SEGUE_CREATION_TO_SELECTION{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MAKE{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_MODEL{
            
        }
        if segue.identifier == SEGUE_CREATION_TO_DETAIL{
            
        }
        print("Segue transfer: \(segue.identifier)")
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
        return 200
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
            //self.tableView.reloadData()
            return "Required"
        }else{
            //self.tableView.reloadData()
            return "Optional"
        }
    }//Puts a text label in the header of the specified section
    ///Returns cell of required dictionary
    func createCellFromRequiredDictionary(row row: Int) -> CreationUITableViewCell{
        let cell : CreationUITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell
        
        var keyAndValue: String!
        
        switch row {
        case 0 :
            keyAndValue = ITEM_BRAND_STRING
            cell.configure(text: viewItem.brand, labelString: keyAndValue, tag: row)
        case 1 :
            keyAndValue = ITEM_MODEL_STRING
            cell.configure(text: viewItem.model, labelString: keyAndValue, tag: row)
        case 2 :
            keyAndValue = ITEM_FAVORITED_STRING
            cell.configure(text: viewItem.favorited?.description, labelString: keyAndValue, tag: row)
        case 3 :
            keyAndValue = ITEM_PRICE_STRING
            cell.configure(text: viewItem.price?.description, labelString: keyAndValue, tag: row)
        case 4 :
            keyAndValue = ITEM_ISTHISNEW_STRING
            cell.configure(text: viewItem.isThisNew?.description, labelString: keyAndValue, tag: row)
        case 5 :
            keyAndValue = ITEM_TIMESWORN_STRING
            cell.configure(text: viewItem.timesWorn?.description, labelString: keyAndValue, tag: row)
        case 6 :
            keyAndValue = ITEM_LASTTIMEWORN_STRING
            cell.configure(text: viewItem.favorited!.description, labelString: keyAndValue, tag: row)
            
        default:
            assertionFailure("Out of scope on the switch statement. row = \(row)")
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
        
        //Image
        self.pictureForSelectedItemImage.alpha = 0.5
        
        //Table View Init
        //self.createDicsAndAppendToArray()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        self.tableView.hidden = true
    }//Sets up data
}



//MARK: - PickerView Methods
extension CreationViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoryPickerView{
            return categoryPickerOptions.count
        }else{
            let pickerRowsPlusAddFieldOption = subCategoryPickerOptions.count + 1
            
            
            return pickerRowsPlusAddFieldOption
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView{
            return categoryPickerOptions[row]
        }else{
            if row == (subCategoryPickerOptions.count){
                
                return "Add New Sub-Category"
            }else{
                return subCategoryPickerOptions[row]
            }
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
            
            //FIXME: - Fix the loading of files
            let loadedArchived = loadAndCreateCloset().selectedCloset
            let keysOfCategory = (loadedArchived[categorySelected]! as Dictionary).keys
            
            for key in keysOfCategory{
                subCategoryPickerOptions.append(key)
            }
            
            subCategoryInputTextField.text = String()
            
        }else{
            if row == (subCategoryPickerOptions.count){
                subCategoryInputTextField.inputView = nil
                subCategoryInputTextField.reloadInputViews()
                subCategoryInputTextField.text = String()
                subCategoryInputTextField.delegate = self
                self.pictureForSelectedItemImage.alpha = 1.0
            }else{
                subCategorySelected = subCategoryPickerOptions[row]
                subCategoryInputTextField.text = subCategorySelected
                viewItem.subCategory = subCategorySelected
                self.pictureForSelectedItemImage.alpha = 1.0
            }
            self.tableView.hidden = false
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
            viewItem.price = Double(value) ?? 0.0
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
        
        if let stringValue = textField.text{
            self.setValueForTaggedCell(tag: tag, value: stringValue)
        }
        
        if textField == subCategoryInputTextField{
            viewItem.subCategory = subCategoryInputTextField.text
        }
        
        
    } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    func textFieldShouldClear(textField: UITextField) -> Bool{
        print("textFieldShouldClear:" + textField.text! + " cleared")
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
            if let nextResponder: UIResponder = self.tableView.viewWithTag(0){
            nextResponder.becomeFirstResponder()
            }
        }
        return true
    }
}


//File System
extension CreationViewController{
    //Used to save to ios directory
    func documentsDirectory() -> NSURL {
        let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsFolderPath
    }
    func fileInDocumentsDirectory(filename: String) -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent(filename)//stringByAppendingString("/\(filename)")
    }
    func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
        
        print("save: \(filePath)")
        
        var success = false
        
        dispatch_async(GlobalUtilityQueue, {
            success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
        })
        if success {
            ("Saved successfully")
        } else{
            print("Error saving data file")
        }
    }
    func loadArchivedObject(filePath: NSURL) -> Wardrobe? {
        
        if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
            return wardrobe
        }else{
            let newWardrobe = Wardrobe()
            saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
            return newWardrobe
        }
    }
    func loadAndCreateCloset() -> Wardrobe{
        let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        return loadArchivedObject(filePath)!
    }
}
/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one
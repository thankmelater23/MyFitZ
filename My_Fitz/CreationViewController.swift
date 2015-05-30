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
  var categegorySelected: String! = String()
  var subCategorySelected: String! = String()
  @IBOutlet var pictureForSelectedItemImage: UIImageView!
  //CreationViewController Item to be created and modified to be saved
  var viewItem: Item! = Item()
  ///Dictionary path to item
  var path: [String: String] = [String: String]()



  @IBAction func createItem(sender: UIButton) {

    var pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    var loadedArchived:Wardrobe! = loadArchivedObject(pathOfFile) as Wardrobe!

    if self.categoryInputTextField.text != nil && self.subCategoryInputTextField.text != nil{
      loadedArchived.selectedCloset[self.categoryInputTextField.text]?.updateValue([Item](), forKey: self.subCategoryInputTextField.text)
      saveObjectToArchived(pathOfFile, wardrobeToSave: loadedArchived)
      magic("Subcategory created: Subcategory: \(subCategoryInputTextField.text)")
    }else{
      magic("Cateogry and/or SubCategory needs value")
    }
    if !self.viewItem.model.isEmpty{
      loadedArchived.selectedCloset[categoryInputTextField.text]![subCategoryInputTextField.text]!.append(viewItem)
      saveObjectToArchived(pathOfFile, wardrobeToSave: loadedArchived)
      magic("item Saved Item Saved: \(viewItem)")

      subCategoryPickerView.reloadAllComponents()
      subCategoryPickerView.reloadInputViews()
    }
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
    magic("Segue transfer: \(segue.identifier)")
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
    }else{
      return self.createCellFromOptionalDictionary(row: indexPath.row) as CreationUITableViewCell
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
  func createCellFromRequiredDictionary(#row: Int) -> CreationUITableViewCell{
    var cell : CreationUITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_BRAND_STRING
      cell.configure(text: viewItem.brand, labelString: keyAndValue, tag: row)
    case 1 :
      keyAndValue = ITEM_MODEL_STRING
      cell.configure(text: viewItem.model, labelString: keyAndValue, tag: row)
      //    case 2 :
      //      keyAndValue = ITEM_CATEGORY_STRING
      //      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
      //    case 3 :
      //      keyAndValue = ITEM_SUBCATEGORY_STRING
      //      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 2 :
      keyAndValue = ITEM_PRICE_STRING
      cell.configure(text: viewItem.price?.description, labelString: keyAndValue, tag: row)
    case 4 :
      keyAndValue = ITEM_ISTHISNEW_STRING
      cell.configure(text: viewItem.isThisNew!.description, labelString: keyAndValue, tag: row)
    case 5 :
      keyAndValue = ITEM_TIMESWORN_STRING
      cell.configure(text: viewItem.favorited.description, labelString: keyAndValue, tag: row)
    case 6 :
      keyAndValue = ITEM_LASTTIMEWORN_STRING
      cell.configure(text: viewItem.lastTimeWorn, labelString: keyAndValue, tag: row)
      //    case 10 :
      //      keyAndValue = ITEM_INDEX_STRING
      //      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    default:
      magic("Something Didnt't go right")
    }

    cell.textInputCellTextField.delegate = self
    return cell as CreationUITableViewCell
  }
  //Returns cell of Optional dictionary
  func createCellFromOptionalDictionary(#row: Int) -> CreationUITableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_DATEPURCHASERD_STRING
      cell.configure(text: viewItem.datePurchased, labelString: keyAndValue, tag: row)
    case 1 :
      keyAndValue = ITEM_COLOR_STRING
      cell.configure(text: viewItem.color, labelString: keyAndValue, tag: row)

    default:
      magic("Something Didnt't go right")
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
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
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
      //subCategoryPickerView.reloadAllComponents()
      categegorySelected = categoryPickerOptions[row]
      categoryInputTextField.text = categegorySelected
      subCategoryInputTextField.enabled = true
      self.tableView.hidden = true
      subCategoryPickerOptions.removeAll(keepCapacity: false)

      //FIXME: - Fix the loading of files
      let loadedArchived = loadAndCreateCloset().selectedCloset
      let keysOfCategory = (loadedArchived[categegorySelected]! as Dictionary).keys

      for key in keysOfCategory{
        subCategoryPickerOptions.append(key)
      }

      subCategoryInputTextField.text = String()

    }else{
      if row == (subCategoryPickerOptions.count){
        subCategoryInputTextField.inputView = nil
        subCategoryInputTextField.reloadInputViews()
        subCategoryInputTextField.text = String()
      }else{
        subCategoryInputTextField.text = subCategoryPickerOptions[row]
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
    imagePicker.mediaTypes = [kUTTypeImage as NSString]
    imagePicker.allowsEditing = false

    self.presentViewController(imagePicker, animated: true, completion: nil)
  }
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    //var video = info[UIImagePickerControllerMediaURL] as? NSURL
    var picture = info[UIImagePickerControllerOriginalImage] as? UIImage
    pictureForSelectedItemImage.image = picture
    viewItem.image = picture

    //pictureButtonForSelectedItemImage.setImage(picture, forState: UIControlState.Normal)
    self.dismissViewControllerAnimated(true, completion: nil)


  }

}


//Text Field methods
extension CreationViewController: UITextFieldDelegate{
  func setValueForTaggedCell(#tag: Int, value: String){
    var bool = true
    if value == "YES"{
    }else if value == "NO"{
      bool = false
    }
    switch tag{
    case 0:
      viewItem.brand = value
    case 1:
      viewItem.model = value
    case 2:
      viewItem.category = value
    case 3:
      viewItem.subCategory = value
    case 4:
      viewItem.price = NSNumberFormatter().numberFromString(value)!.doubleValue
      //    case 5:
      //      viewItem.imageName = value
    case 6:
      viewItem.favorited = bool
    case 7:
      viewItem.isThisNew = bool
    case 8:
      viewItem.timesWorn = NSNumberFormatter().numberFromString(value)!.integerValue
    case 9:
      viewItem.lastTimeWorn = value
    case 10:
      viewItem.index = NSNumberFormatter().numberFromString(value)!.integerValue
    case 11:
      viewItem.datePurchased = value
    case 13:
      viewItem.color = value
    default:
      magic("switch statement isn't working for cell with tag: : \(tag)")
    }
  }
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
    textField.isFirstResponder()
    return true

  }// return NO to disallow editing.
  func textFieldDidBeginEditing(textField: UITextField){
    textField.becomeFirstResponder()
    magic("textFieldDidBeginEditing: Text:  \(textField.text)\n tag:  \(textField.text)  ")
  } // became first responder
  func textFieldShouldEndEditing(textField: UITextField) -> Bool{
    textField.resignFirstResponder()
    return true
  } // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
  func textFieldDidEndEditing(textField: UITextField){
    let tag = textField.tag
    if let stringValue = textField.text{
      self.setValueForTaggedCell(tag: tag, value: stringValue)
      magic("textFieldDidEndEditing:" + textField.text)
    }


  } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
  func textFieldShouldClear(textField: UITextField) -> Bool{
    magic("textFieldShouldClear:" + textField.text)
    return true
  } // called when clear button pressed. return NO to ignore (no notifications)
  func textFieldShouldReturn(textField: UITextField) -> Bool{
    //TODO: - Set up to move to next textfielx
    magic("textFieldShouldReturn:" + textField.text)
    textField.resignFirstResponder()
    if textField == subCategoryInputTextField || textField == categoryInputTextField{
      subCategoryPickerView.reloadAllComponents()
    }
    return true
  } // called when 'return' key pressed. return NO to ignore.
}



//File System
extension CreationViewController{
  //Used to save to ios directory
  func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    return documentsFolderPath
  }
  func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
  }
  func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> Wardrobe? {

    if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! Wardrobe!{
      return wardrobe
    }else{
      let newWardrobe = Wardrobe()
      saveObjectToArchived(filePath, wardrobeToSave: newWardrobe)
      return newWardrobe
    }
  }
  func loadAndCreateCloset() -> Wardrobe{
    var filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    return loadArchivedObject(filePath)!
  }
}
/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one
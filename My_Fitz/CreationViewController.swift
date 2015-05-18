//
//  CreationViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit


//MARK: - CreationViewController class

class CreationViewController: UIViewController{
  //Enums
  enum dictionaryKindReference: Int{
    case dictionaryNotSelected = 0
    case requiredDictionary
    case optionalDictionary
  }
  @IBOutlet var tableView: UITableView!
  @IBOutlet var categoryInputTextField: UITextField!
  @IBOutlet var subCategoryInputTextField: UITextField!
  var categoryPickerView = UIPickerView()
  var subCategoryPickerView = UIPickerView()
  var categoryPickerOptions = CATEGORY_PICKER_OPTIONS
  var subCategoryPickerOptions = [String]()
  var categegorySelected: String! = String()
  var subCategorySelected: String! = String()
  ///Holds the optional and required dictionaries
  var itemInfoDictionaries = [[String: String]]()
  ///Holds the required information from the item
  var itemInfoRequiredDictionary = [String: String]()
  ///Holds the optional information from the item
  var itemInfoOptionalDictionary = [String: String]()
  //CreationViewController Item to be created and modified to be saved
  var viewItem = Item.init()
  ///Dictionary path to item
  var path: [String: String] = [String: String]()



  @IBAction func createItem(sender: UIButton) {

    var pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    var loadedArchived:CLOSET_TYPE! = loadArchivedObject(pathOfFile) as CLOSET_TYPE

    if self.categoryInputTextField.text != nil && self.subCategoryInputTextField.text != nil{
      loadedArchived[self.categoryInputTextField.text]?.updateValue([Item](), forKey: self.subCategoryInputTextField.text)

      if viewItem.areItemRequirmentsFilled(){
        viewItem.populateDictionariesToItemInstanceVariables()
        loadedArchived[viewItem.category]![viewItem.subCategory]!.append(viewItem)
      }
    }

    saveObjectToArchived(pathOfFile, closetInstance: loadedArchived)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()

    // Do any additional setup after loading the view.
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
    return itemInfoDictionaries.count
  }// Return the number of sections.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if (section == 0){
      return self.itemInfoRequiredDictionary.count
    }else{//(section == 1)
      return self.itemInfoOptionalDictionary.count
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
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 1 :
      keyAndValue = ITEM_MODEL_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 2 :
      keyAndValue = ITEM_CATEGORY_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
      cell.hidden = true
      cell.removeFromSuperview()
    case 3 :
      keyAndValue = ITEM_SUBCATEGORY_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
      cell.hidden = true
      cell.removeFromSuperview()
    case 4 :
      keyAndValue = ITEM_PRICE_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 5 :
      keyAndValue = ITEM_IMAGENAME_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
      cell.removeFromSuperview()
      cell.hidden = true
    case 6 :
      keyAndValue = ITEM_FAVORITED_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 7 :
      keyAndValue = ITEM_ISTHISNEW_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 8 :
      keyAndValue = ITEM_TIMESWORN_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 9 :
      keyAndValue = ITEM_LASTTIMEWORN_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 10 :
      keyAndValue = ITEM_INDEX_STRING
      cell.configure(text: viewItem.requiredDictionary[keyAndValue], labelString: keyAndValue, tag: row)
      cell.hidden = true
      cell.removeFromSuperview()


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
      cell.configure(text: viewItem.optionalDictionary[keyAndValue], labelString: keyAndValue, tag: row)
    case 1 :
      keyAndValue = ITEM_COLOR_STRING
      cell.configure(text: viewItem.optionalDictionary[keyAndValue], labelString: keyAndValue, tag: row)

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
    categoryPickerView.delegate = self
    subCategoryPickerView.delegate = self
    categoryInputTextField.inputView = categoryPickerView
    subCategoryInputTextField.inputView = subCategoryPickerView
    subCategoryInputTextField.enabled = false
    self.tableView.hidden = true
    self.createDicsAndAppendToArray()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.reloadData()

  }//Sets up data
  func createRequiredlDic(){
    var keyAndValue: String!


    keyAndValue                             = ITEM_BRAND_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_MODEL_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_CATEGORY_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue
    keyAndValue                             = ITEM_SUBCATEGORY_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_PRICE_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_IMAGENAME_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_FAVORITED_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_ISTHISNEW_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_TIMESWORN_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_LASTTIMEWORN_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = ITEM_INDEX_STRING
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue
  }
  func createOptionalDic(){
    var keyAndValue: String!


    keyAndValue = ITEM_DATEPURCHASERD_STRING
    itemInfoOptionalDictionary[keyAndValue] = keyAndValue

    keyAndValue = ITEM_COLOR_STRING
    itemInfoOptionalDictionary[keyAndValue] = keyAndValue
  }
  func createDicsAndAppendToArray(){
    createRequiredlDic()
    createOptionalDic()
    itemInfoDictionaries.append(itemInfoRequiredDictionary)
    itemInfoDictionaries.append(itemInfoOptionalDictionary)
  }
  ///Takes required & optional dic and matches its info with that of the newley created Item object
  func createNewItem(requiredDic: [String: String], optionalDic: [String: String]){
    viewItem.setUpItemInfoThroughDictionaries(requiredDic: requiredDic, optionalDic: optionalDic)
  }
  func pushDataIntoDictionaries(){
    //TODO: - Setup function to send information from tableViewCell dictionaries then into the item's object dictionaries then sync obect with dic info

    //Set up text to to dictionary
    self.createNewItem(itemInfoRequiredDictionary, optionalDic: itemInfoOptionalDictionary)
  }
}



//
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
      subCategoryPickerView.reloadAllComponents()
      categegorySelected = categoryPickerOptions[row]
      categoryInputTextField.text = categegorySelected
      subCategoryInputTextField.enabled = true
      self.tableView.hidden = true
      subCategoryPickerOptions.removeAll(keepCapacity: false)

      let loadedArchived = loadAndCreateCloset()
      let selectedCategory = loadedArchived[categegorySelected]!

      let options = (selectedCategory as Dictionary).keys

      for key in options{
        subCategoryPickerOptions.append(key)
      }

      subCategoryInputTextField.text = String()

    }else{
      if row == (subCategoryPickerOptions.count){
      subCategoryInputTextField.inputView = nil
      }else{
      subCategoryInputTextField.text = subCategoryPickerOptions[row]
      }
      self.tableView.hidden = false
    }
  }
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
  func saveObjectToArchived(filePath: String, closetInstance: CLOSET_TYPE!){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(closetInstance, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> CLOSET_TYPE! {

    if let closet = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? CLOSET_TYPE{

      return closet as CLOSET_TYPE
    }else{
      let closetToSave = Profile()
      let checkVar = closetToSave.categoryDics
      saveObjectToArchived(filePath, closetInstance: checkVar)

      return checkVar as CLOSET_TYPE
    }
  }
  func loadAndCreateCloset() -> CLOSET_TYPE{
    let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
      return loadArchivedObject(pathOfFile) as CLOSET_TYPE!
  }
}
//File System
extension CreationViewController: UITextFieldDelegate{
  func setValueForTaggedCell(#tag: Int, value: String){
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
      viewItem.price = value
    case 5:
      viewItem.imageName = value
    case 6:
      viewItem.favorited = value
    case 7:
      viewItem.isThisNew = value
    case 8:
      viewItem.timesWorn = NSNumberFormatter().numberFromString(value)!.integerValue
    case 9:
      viewItem.lastTimeWorn = NSNumberFormatter().numberFromString(value)!.integerValue
    case 10:
      viewItem.index = NSNumberFormatter().numberFromString(value)!.integerValue
    case 11:
      viewItem.datePurchased = NSNumberFormatter().numberFromString(value)!.integerValue
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
    magic("textFieldDidBeginEditing:" + textField.text)
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
    return true
  } // called when 'return' key pressed. return NO to ignore.
}
/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one
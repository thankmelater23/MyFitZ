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



  @IBAction func saveItem(sender: UIBarButtonItem) {
    self.pushDataIntoDictionaries()
    viewItem.setUpItemInfoThroughDictionaries(requiredDic: itemInfoRequiredDictionary, optionalDic: itemInfoOptionalDictionary)
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
}


//MARK: - TableView Methods
extension  CreationViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return itemInfoDictionaries.count
  }// Return the number of sections.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if (section == 0){
      return self.itemInfoRequiredDictionary.count
    }

    else{//(section == 1)
      return self.itemInfoOptionalDictionary.count
    }

  }// Return the number of rows in the section.
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //self.tableView.reloadData()
    if indexPath.section == 0{
      return createCellFromRequiredDictionary(row: indexPath.row) as CreationUITableViewCell
    }else{
      return createCellFromOptionalDictionary(row: indexPath.row) as CreationUITableViewCell
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
      keyAndValue = "make"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 1 :
      keyAndValue = "model"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 2 :
      keyAndValue = "category"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 3 :
      keyAndValue = "subCategory"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 4 :
      keyAndValue = "price"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 5 :
      keyAndValue = "imageName"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 6 :
      keyAndValue = "favorited"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 7 :
      keyAndValue = "isThisNew"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 8 :
      keyAndValue = "timesWorn"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 9 :
      keyAndValue = "lastTimeWorn"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 10 :
      keyAndValue = "index"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)


    default:
      magic("Something Didnt't go right")
    }

    return cell as CreationUITableViewCell
  }
  //Returns cell of Optional dictionary
  func createCellFromOptionalDictionary(#row: Int) -> CreationUITableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier(CREATION_CELL) as! CreationUITableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = "datePurchased"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)
    case 1 :
      keyAndValue = "color"
      cell.configure(text: cell.textLabel?.text, labelString: keyAndValue)

    default:
      magic("Something Didnt't go right")
    }

    return cell as CreationUITableViewCell
  }

}


//MARK: - Developer Created Methods
extension CreationViewController{
  func setUp(){
    self.createDicsAndAppendToArray()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.reloadData()

  }//Sets up data


  func createRequiredlDic(){
    var keyAndValue: String!


    keyAndValue                             = "make"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "model"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "category"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue
    keyAndValue                             = "subCategory"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "price"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "imageName"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "favorited"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "isThisNew"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "timesWorn"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "lastTimeWorn"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue

    keyAndValue                             = "index"
    itemInfoRequiredDictionary[keyAndValue] = keyAndValue
  }
  func createOptionalDic(){
    var keyAndValue: String!


    keyAndValue = "datePurchased"
    itemInfoOptionalDictionary[keyAndValue] = keyAndValue

    keyAndValue = "color"
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


/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one
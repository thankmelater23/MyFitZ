//
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

//MARK: - DetailedViewController Class
class DetailedViewController: UIViewController{

  //View IBOutlets
  @IBOutlet var tableView: UITableView!
  ///Views main image of the Item being presented
  @IBOutlet var itemImage: UIImageView!
  @IBAction func duplicateItem() {
    let newItem = self.itemOfObject as Item
    var pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    var archivedCloset = loadArchivedObject(pathOfFile)!
    archivedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]?.append(newItem)
    saveObjectToArchived(pathOfFile, closetInstance: archivedCloset)
  }

  //  ///Enum
  //  enum dictionaryKindReference: Int{
  //    case dictionaryNotSelected = 0
  //    case requiredDictionary
  //    case optionalDictionary
  //  }
  //  var dictionaryKind: dictionaryKindReference = dictionaryKindReference.dictionaryNotSelected

  //View Variables
  ///Item selected
  var itemOfObject: Item! = Item() as Item
  ///Holds the optional and required dictionaries
  var itemInfoDictionaries = [[String: String]]()
  ///Holds the required information from the item
  var itemInfoRequiredDictionary = [String: String]()
  ///Holds the optional information from the item
  var itemInfoOptionalDictionary = [String: String]()
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()

  //View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_DETAIL_TO_MODEL
    {
      var pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
      var loadedArchived:CLOSET_TYPE! = loadArchivedObject(pathOfFile) as CLOSET_TYPE!

      var index = self.tableView.indexPathForSelectedRow()
      var modelTableViewController = segue.destinationViewController as! ModelTableViewController
      modelTableViewController.path = self.path

      modelTableViewController.arrayOfItems = loadedArchived[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]
      magic("Segue transfer: \(segue.identifier)")
    }else if segue.identifier == SEGUE_DETAIL_TO_CREATION{
      magic("Segue transfer: \(segue.identifier)")
    }
  }
}



//MARK: - TableView Methods
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return itemInfoDictionaries.count
  }// Return the number of sections.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if (section == 0){
      return self.itemInfoRequiredDictionary.count
    }

    else if (section == 1){
      return self.itemInfoOptionalDictionary.count
    }

    else{
      magic("Something did not go right")
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
      return "Basic"
    }else{
      return "Misc"
    }
  }//Puts a text label in the header of the specified section
}



//MARK: - Developer Created Methods
extension DetailedViewController{
  func setUp(){
    self.retrieveRequiredDicInfo()
    itemImage.image = UIImage(named: itemOfObject.imageName) as UIImage!
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.reloadData()

  }//Sets up view
  ///Takes required dictionary and matches its info with that of the newley created Item object
  func retrieveRequiredDicInfo(){
    ///Puts the Item instance dictionaries and copies them into this controller dictionaries to use in the tableviewcells
    itemInfoRequiredDictionary = self.itemOfObject.requiredDictionary
    itemInfoOptionalDictionary = self.itemOfObject.optionalDictionary

    ///This appends all dictionaries of the controller into an array
    itemInfoDictionaries.append(itemInfoRequiredDictionary)
    itemInfoDictionaries.append(itemInfoOptionalDictionary)

  }
  ///Returns cell of required dictionary
  func createCellFromRequiredDictionary(#row: Int) -> DoubleLabelTableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_BRAND_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 1 :
      keyAndValue = ITEM_MODEL_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 2 :
      keyAndValue = ITEM_CATEGORY_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 3 :
      keyAndValue = ITEM_SUBCATEGORY_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 4 :
      keyAndValue = ITEM_PRICE_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 5 :
      keyAndValue = ITEM_IMAGENAME_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 6 :
      keyAndValue = ITEM_FAVORITED_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 7 :
      keyAndValue = ITEM_ISTHISNEW_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 8 :
      keyAndValue = ITEM_TIMESWORN_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 9 :
      keyAndValue = ITEM_LASTTIMEWORN_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 10 :
      keyAndValue = ITEM_INDEX_STRING
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)


    default:
      magic("Row does not exist to create cell of required type. ROW: \(row)")
    }

    return cell as DoubleLabelTableViewCell
  }
  ///Returns cell of Optional dictionary
  func createCellFromOptionalDictionary(#row: Int) -> DoubleLabelTableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_DATEPURCHASERD_STRING
      cell.nameLabel.text = keyAndValue
      let value:String = itemInfoOptionalDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 1 :
      keyAndValue = ITEM_COLOR_STRING
      let value:String = itemInfoOptionalDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)

    default:
      magic("Row does not exist to create cell of optional type. ROW: \(row)")
    }

    return cell as DoubleLabelTableViewCell
  }
}



//File System
extension DetailedViewController{
  //Used to save to ios directory
  func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    return documentsFolderPath
  }
  func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
  }
  func saveObjectToArchived(filePath: String, closetInstance: CLOSET_TYPE){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(closetInstance, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> CLOSET_TYPE? {

    if let closet = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? CLOSET_TYPE{
      
      return closet
    }else{
      return nil
    }
  }
}




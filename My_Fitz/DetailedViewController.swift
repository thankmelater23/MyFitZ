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
  //View Variables
  ///Item selected
  var itemOfObject: Item! = Item()
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()

  //View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()
    magic(self.itemOfObject)

    // Do view setup here.
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    defer{
        magic("Segue transfer: \(segue.identifier)")
    }
    if segue.identifier == SEGUE_DETAIL_TO_MODEL
    {
      let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
      var loadedArchived:CLOSET_TYPE! = loadArchivedObject(pathOfFile)!.selectedCloset as CLOSET_TYPE!

      //var index = self.tableView.indexPathForSelectedRow!
      let modelTableViewController = segue.destinationViewController as! ModelTableViewController
      modelTableViewController.path = self.path

      modelTableViewController.arrayOfItems = loadedArchived[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]
      
    }else if segue.identifier == SEGUE_DETAIL_TO_CREATION{
    }
  }
}



//MARK: - TableView Methods
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2//Create constant
  }// Return the number of sections.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if (section == 0){
      return 10
    }

    else if (section == 1){
      return 2
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
  func createCellFromRequiredDictionary(row row: Int) -> DoubleLabelTableViewCell{

    let cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
    
    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_BRAND_STRING
      if let value = self.itemOfObject.brand{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }
    case 1 :
      keyAndValue = ITEM_MODEL_STRING
      if let value = self.itemOfObject.model{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }
    case 2 :
      keyAndValue = ITEM_CATEGORY_STRING
      if let value = self.itemOfObject.category{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }
    case 3 :
      keyAndValue = ITEM_SUBCATEGORY_STRING
      if let value = self.itemOfObject.subCategory{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }
    case 4 :
      keyAndValue = ITEM_PRICE_STRING
      guard let value = itemOfObject.price else{
        cell.configure(name: keyAndValue, infoString: "N/A")
        break
      }
        cell.configure(name: keyAndValue, infoString: String(value))
    case 5 :
      keyAndValue = ITEM_FAVORITED_STRING
      let bool = self.itemOfObject.favorited
      var value = "No"
      if bool == true{
         value = "YES"
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: value)
      }
    case 6 :
      keyAndValue = ITEM_ISTHISNEW_STRING
      let bool = self.itemOfObject.isThisNew
      var value = "No"
      if bool == true{
        value = "YES"
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: value)
      }
    case 7 :
      keyAndValue = ITEM_TIMESWORN_STRING
      guard let value = itemOfObject.timesWorn else{
        cell.configure(name: keyAndValue, infoString: "N/A")
        break
      }
      cell.configure(name: keyAndValue, infoString: String(value))
    case 8 :
      keyAndValue = ITEM_LASTTIMEWORN_STRING
      if let value = self.itemOfObject.lastTimeWorn{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: "N/A")
      }
    case 9 :
      keyAndValue = ITEM_INDEX_STRING
      let number = self.itemOfObject.index
      if number != nil{
        let value = "\(number)"
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }


    default:
      assertionFailure("Row does not exist to create cell of required type. ROW: \(row)")
    }

    return cell as DoubleLabelTableViewCell
  }
  ///Returns cell of Optional dictionary
  func createCellFromOptionalDictionary(row row: Int) -> DoubleLabelTableViewCell{
    let cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = ITEM_DATEPURCHASERD_STRING
      if let value = self.itemOfObject.datePurchased{
      cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }
    case 1 :
      keyAndValue = ITEM_COLOR_STRING
      if let value = self.itemOfObject.color{
        cell.configure(name: keyAndValue, infoString: value)
      }else{
        cell.configure(name: keyAndValue, infoString: String())
      }

    default:
      assertionFailure("Row does not exist to create cell of optional type. ROW: \(row)")
    }

    return cell as DoubleLabelTableViewCell
  }
}



//MARK: - Developer Created Methods
extension DetailedViewController{
  func setUp(){
    //self.retrieveRequiredDicInfo()
    itemImage.image = itemOfObject.image
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.reloadData()

  }//Sets up view
}



//File System
extension DetailedViewController{
  //Used to save to ios directory
  func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
    return documentsFolderPath
  }
  func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
  }
  func saveObjectToArchived(filePath: String, closetInstance: Wardrobe!){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(closetInstance, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> Wardrobe? {

    if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Wardrobe{

      return wardrobe
    }
    let newWardrobe = Wardrobe()
    saveObjectToArchived(filePath, closetInstance: newWardrobe)
    return newWardrobe

  }
  func loadAndCreateCloset() -> Wardrobe{
    let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    return loadArchivedObject(filePath)!
  }
}



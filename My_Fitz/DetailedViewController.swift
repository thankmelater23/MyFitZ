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
  ///Enum
  enum dictionaryKindReference: Int{
    case dictionaryNotSelected = 0
    case requiredDictionary
    case optionalDictionary
  }

  var dictionaryKind: dictionaryKindReference = dictionaryKindReference.dictionaryNotSelected

  //View Variables
  ///Item selected
  var itemOfObject: Item!
  ///Items index place in array
  var arrayIndex: Int!
  ///Holds the optional and required dictionaries
  var itemInfoDictionaries = [[String: String]]()
  ///Holds the required information from the item
  var itemInfoRequiredDictionary = [String: String]()
  ///Holds the optional information from the item
  var itemInfoOptionalDictionary = [String: String]()


  //View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
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
    }

    return 0

  }// Return the number of rows in the section.
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }//Random number returned to fix xcode bug
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //self.tableView.reloadData()
    if indexPath.section == 0{
      return createCellFromRequiredDictionary(row: indexPath.row) as DoubleLabelTableViewCell
    }else{
      return createCellFromOptionalDictionary(row: indexPath.row) as DoubleLabelTableViewCell
    }
  }
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if (section == 0){
      //self.tableView.reloadData()
      return "Basic"
    }else{
      //self.tableView.reloadData()
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
    itemOfObject.populateDictionariesToItemInstanceVariables()
    itemInfoRequiredDictionary = self.itemOfObject.requiredDictionary
    itemInfoOptionalDictionary = self.itemOfObject.optionalDictionary

    ///This appends all dictionaries of the controller into an array
    itemInfoDictionaries.append(itemInfoRequiredDictionary)
    itemInfoDictionaries.append(itemInfoOptionalDictionary)

  }
  ///Returns cell of required dictionary
  func createCellFromRequiredDictionary(#row: Int) -> DoubleLabelTableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier("DoubleLabel") as! DoubleLabelTableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = "make"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 1 :
      keyAndValue = "model"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 2 :
      keyAndValue = "category"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 3 :
      keyAndValue = "subCategory"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 4 :
      keyAndValue = "price"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 5 :
      keyAndValue = "imageName"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 6 :
      keyAndValue = "favorited"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 7 :
      keyAndValue = "isThisNew"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 8 :
      keyAndValue = "timesWorn"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 9 :
      keyAndValue = "lastTimeWorn"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 10 :
      keyAndValue = "index"
      let value:String = itemInfoRequiredDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)


    default:
      magic("Something Didnt't go right")
    }

    return cell as DoubleLabelTableViewCell
  }
  ///Returns cell of Optional dictionary
  func createCellFromOptionalDictionary(#row: Int) -> DoubleLabelTableViewCell{
    var cell = tableView.dequeueReusableCellWithIdentifier("DoubleLabel") as! DoubleLabelTableViewCell

    var keyAndValue: String!

    switch row {
    case 0 :
      keyAndValue = "datePurchased"
      cell.nameLabel.text = keyAndValue
      let value:String = itemInfoOptionalDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)
    case 1 :
      keyAndValue = "color"
      let value:String = itemInfoOptionalDictionary[keyAndValue]!
      cell.configure(name: keyAndValue, infoString: value)

    default:
      magic("Something Didnt't go right")
    }

    return cell as DoubleLabelTableViewCell
  }
}






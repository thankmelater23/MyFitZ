//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

//MARK: - ModelTableViewController Class
class ModelTableViewController: UITableViewController {
  //MARK: - View Variables
  ///items in an Array holds the sub-categories of the items
  var arrayOfItems: [Item]! = [Item]()
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()


  //MARK: - View Methods
  override func viewDidLoad(){
    super.viewDidLoad()
    self.SetUpTypes()

  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_MODEL_TO_DETAIL
    {
      let index = self.tableView.indexPathForSelectedRow
      let detailController = segue.destinationViewController as! DetailedViewController

      if let index = index{
        path[PATHTYPE_INDEX_STRING] = "\(index.row)"
        detailController.itemOfObject = self.arrayOfItems[index.row] as Item!
        detailController.path = self.path
      }
      magic("Segue transfer: \(segue.identifier)")
    }else if segue.identifier == SEGUE_MODEL_TO_MAKE{
      magic("Segue transfer: \(segue.identifier)")

      let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
      let loadedArchived:Wardrobe! = loadArchivedObject(pathOfFile) as Wardrobe!

      //var index = self.tableView.indexPathForSelectedRow
      let makeTableViewController = segue.destinationViewController as! MakeTableViewController
      makeTableViewController.path = self.path

      makeTableViewController.itemsInArrayInDictionary = loadedArchived.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
      magic("Segue transfer: \(segue.identifier)")
    }else if segue.identifier == SEGUE_MODEL_TO_CREATION{
      magic("Segue transfer: \(segue.identifier)")
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

//MARK: - TableView Methods
///ModelTableViewController TableView Methods
extension ModelTableViewController{
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayOfItems.count

  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier(MODEL_CELL) as! ModelCustomCell

    if indexPath.row % 2 == 0//If even number make this color
    {
      //cell.backgroundColor      = UIColor.grayColor()
      cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
    }else{
      //cell.backgroundColor      = UIColor.darkGrayColor()
      cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
    }

    let item: Item            = arrayOfItems[indexPath.row] as Item!

    //TODO: -Change brand to subacategory instead
    cell.setCell(item.image!, brandLabelText: item.brand!, modelLabelText: item.model!, timesWornText: item.timesWorn!)

    return cell
  }
  override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)

  }
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

    return path[PATHTYPE_SUBCATEGORY_STRING]
  }
  ///Makes tableview cells auto resize properly for some reason, it won't without calling this function
  override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
    forRowAtIndexPath indexPath: NSIndexPath) {
      if editingStyle == UITableViewCellEditingStyle.Delete
      {
        arrayOfItems.removeAtIndex(indexPath.row)

        let pathOfFile                                                                        = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        let loadedArchived:Wardrobe!                                                       = loadArchivedObject(pathOfFile) as Wardrobe!
        loadedArchived.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]! = self.arrayOfItems
        saveObjectToArchived(pathOfFile, closetInstance: loadedArchived)

        self.tableView.reloadData()
      }
  }
}



//MARK: - Developer Created Methods
///ModelTableViewController Developer Created Methods
extension ModelTableViewController{
  func SetUpTypes() {

  }
}



//File System
extension ModelTableViewController{
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
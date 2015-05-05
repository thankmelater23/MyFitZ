//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

///MakeTableViewController Class
class MakeTableViewController: UITableViewController{
  //View IBOutlets
  @IBOutlet var TypeBarButtonLabel: UIBarButtonItem!

  //View Variables
  ///items in a dictionary of arrays holds the categories of the items
  var itemsInArrayInDictionary: [String: [Item]]! = [String: [Item]]()
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()


  //View Methods
  override func viewDidLoad(){
    super.viewDidLoad()

    self.setUpTypes()
  }
  override func viewDidAppear(animated: Bool){

    tableView.reloadData()
  }
  override func didReceiveMemoryWarning(){
    super.didReceiveMemoryWarning()
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_MAKE_TO_MODEL
    {
      var index = self.tableView.indexPathForSelectedRow()
      var modelController = segue.destinationViewController as! ModelTableViewController
      let tempItemArray: [Item] = self.itemsInArrayInDictionary.values.array[index!.row]
      path[PATHTYPE_SUBCATEGORY_STRING] = tempItemArray[0].subCategory
      modelController.arrayOfItems = tempItemArray as [Item]!
      modelController.path = self.path
      magic("Segue working proplery")
    }else{
      magic("Segue working not proplery")
    }
  }
}



//MARK: - Developer Created Methods
///Developer Created Methods
extension MakeTableViewController{
  func setUpTypes(){

  }//Sets up
  func selection(){
    TypeBarButtonLabel.title = path[PATHTYPE_CATEGORY_STRING]!
  }
}



//MARK: - TableView Methods
///TableView Methods
extension MakeTableViewController{
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return itemsInArrayInDictionary.count
  }//Returns Int for number of sections in tableView
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    let cell: MakeCustonCell = tableView.dequeueReusableCellWithIdentifier(MAKE_CELL) as! MakeCustonCell


    if indexPath.row % 2 == 0//If even number make this color
    {
      //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
    cell.backgroundColor     = UIColor.redColor()
    }else{
      //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
    cell.backgroundColor     = UIColor.blueColor()
    }

    let arrayItemCell: [Item]     = self.itemsInArrayInDictionary.values.array[indexPath.row]
    cell.setCell(arrayItemCell[0].imageName, makeLabelText: arrayItemCell[0].brand, numberOfItemsText: arrayItemCell.count)

    return cell
  }//Returns a tableView cell at a specific row
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
      if editingStyle == UITableViewCellEditingStyle.Delete
      {
        //TODO: - Create an alert view that uses method
    var alert                = UIAlertController(title: "Alert", message: "Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

        //itemsInArrayInArray.removeAtIndex(indexPath.row)
        //TODO: - Set up way for dictionary cell to be deleted


        self.tableView.reloadData()
      }
  }//Editing to delete row
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    return path[PATHTYPE_CATEGORY_STRING]

  }//Category name is shown in the title header
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }//Shows when a cell at row was selected
  override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }//Xcode bug hack that lets cell autosize properly
}



//File System
extension MakeTableViewController{
  //Used to save to ios directory
  func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    return documentsFolderPath
  }
  func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
  }
  func saveObjectToArchived(filePath: String, closetInstance: CLOSET_TYPE){

    magic("save: \(path)")

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
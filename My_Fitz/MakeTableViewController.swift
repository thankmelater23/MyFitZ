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
  ///items in an Array of Arrays holds the categories of the items
  var itemsInArrayInArray: [[Item]]!
  ///Holds the keys of Name of strings from a dictionary
  var arrayOfCategoryNames = [String]()
  ///Holds the  seleceted Category String  To Send to  ModelTableView
  var categoryString: String!
  ///Holds the  seleceted Sub-Category String  To Send to  ModelTableView
  var subCategoryString: String!
  ///Holds the  seleceted Category index  To Send to  ModelTableView
  var passingSubCategoryIndex: Int!


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
    if segue.identifier == "makeToModel"
    {
      var index = self.tableView.indexPathForSelectedRow()
      var modelController = segue.destinationViewController as! ModelTableViewController
      let tempItemArray: [Item] = self.itemsInArrayInArray[index!.row]
      modelController.arrayOfItems = tempItemArray as [Item]!
      modelController.passingSubCategoryIndex = self.passingSubCategoryIndex
      magic("Segue working proplery")

      //      var parseIsh = PFObject(className: "ModelTable")
      //      parseIsh.addObject(1, forKey: "subCategory")
      //      parseIsh.addObject(1 , forKey: "numberOfItemsInSubCategory")
      //      parseIsh.save()
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
    TypeBarButtonLabel.title = categoryString
  }
}



//MARK: - TableView Methods
///TableView Methods
extension MakeTableViewController{
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return itemsInArrayInArray.count
  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    let cell: MakeCustonCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MakeCustonCell


    if indexPath.row % 2 == 0//If even number make this color
    {
      //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
      cell.backgroundColor = UIColor.redColor()
    }else{
      //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
      cell.backgroundColor = UIColor.blueColor()
    }

    let itemCell: [Item] = self.itemsInArrayInArray[indexPath.row]
    cell.setCell(itemCell[0].imageName, makeLabelText: itemCell[0].make, numberOfItemsText: itemCell.count)

    return cell
  }
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      if editingStyle == UITableViewCellEditingStyle.Delete
      {
        //TODO: - Create an alert view that uses method
        var alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

        itemsInArrayInArray.removeAtIndex(indexPath.row)

        self.tableView.reloadData()
      }
  }
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
    return categoryString

  }//Category name is shown in the title header
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    passingSubCategoryIndex = indexPath.row
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }//Xcode bug hack that lets cell autosize properly
}


////////////////Notes//////////////
//Use more debug loggers
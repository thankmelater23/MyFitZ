//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class MakeTableViewController: UITableViewController
{
  //MARK: - View IBOutlets
  @IBOutlet var TypeBarButtonLabel: UIBarButtonItem!

  //MARK: - View Variables
  ///items in an Array of Arrays holds the categories of the items
  var itemsInArrayInArray: [[Item]]!
  var arrayOfCategoryNames = [String]()
  //var arrayOfTypes: [Item]!
  var categoryString: String!
  var subCategoryString: String!
  var passingSubCategoryIndex: Int!

  //MARK: - Created Methods
  func setUpTypes()
  {

  }
  func selection()
  {
    TypeBarButtonLabel.title = categoryString
  }



  //MARK: - TableView Methods
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return itemsInArrayInArray.count
  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell: MakeCustonCell = tableView.dequeueReusableCellWithIdentifier("cell") as MakeCustonCell


    if indexPath.row % 2 == 0//If even number make this color
    {
      cell.backgroundColor = UIColor.redColor()
    }

    else
    {
      cell.backgroundColor = UIColor.blueColor()
    }

    let itemCell: [Item] = self.itemsInArrayInArray[indexPath.row]
    cell.setCell(itemCell[0].imageName, makeLabelText: itemCell[0].make, numberOfItemsText: itemCell.count)

    return cell
  }
  override func  tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  {
    if editingStyle == UITableViewCellEditingStyle.Delete
    {
      itemsInArrayInArray.removeAtIndex(indexPath.row)

      self.tableView.reloadData()
    }
  }
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  {
    return categoryString

  }
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    passingSubCategoryIndex = indexPath.row
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()

    self.setUpTypes()
  }
  override func viewDidAppear(animated: Bool)
  {

    tableView.reloadData()
  }
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "makeToModel"
    {
      var index = self.tableView.indexPathForSelectedRow()
      var modelController = segue.destinationViewController as ModelTableViewController
      let tempItemArray: [Item] = self.itemsInArrayInArray[index!.row]
      modelController.arrayOfItems = tempItemArray as [Item]!
      modelController.passingSubCategoryIndex = self.passingSubCategoryIndex
      magic("Segue working proplery")
    }
    else
    {
      magic("Segue working not proplery")
    }
  }
}
//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ModelTableViewController: UITableViewController
{
  //MARK: - View Variables
  var profile: [Item]!
  var passingSubCategoryIndex: Int!
  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.SetUpTypes()

  }
  func SetUpTypes()
  {

    magic(profile)

  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "modelToDetailed"
    {
      var index = self.tableView.indexPathForSelectedRow()
      var detailController = segue.destinationViewController as DetailedViewController
      if let newIndex = index
      {
      detailController.profile = self.profile[newIndex.row] as Item!//Item(make: "Jordans" , model: "13's", price: "200", ImageName: "13's", category: "Shoes", subCategory: "Jordans")//self.profile[index] as Item
      magic("Segue working proplery")
}
    }
    else
    {
      magic("Segue working not proplery")
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  //MARK: - TableView Methods
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return profile.count

  }
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as ModelCustomCell

    if indexPath.row % 2 == 0//If even number make this color
    {
      cell.backgroundColor = UIColor.redColor()
    }

    else
    {
      cell.backgroundColor = UIColor.blueColor()
    }

    let item: Item = profile[indexPath.row] as Item!

    cell.setCell(item.imageName, brandLabelText: item.make, modelLabelText: item.model, timesWornText: 1)//"Times Worn: \(item.timesWorn)") also make the brand the type of class this is that represents these items in the array which is an array of items array

    return cell

  }
  override func  tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  {
    if editingStyle == UITableViewCellEditingStyle.Delete
    {
      profile.removeAtIndex(indexPath.row)

      self.tableView.reloadData()
    }
  }
  override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)

  }
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  {
    //FIXME: - This Needs proper string
    var makeString: String! = " "
    if (makeString.isEmpty == true)
    {
          magic("This string is empty")
    }

    return makeString
  }

}


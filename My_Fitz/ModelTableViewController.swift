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

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.SetUpTypes()

  }
  func SetUpTypes()
  {
//    let makeString = userDefaultsValueForKey("selectorString")
//    let categoryArrayString = userDefaultsValueForKey("ModelName")

    //let currentCategoryDic: [String: [Item]] = profile.categoryDics[makeString]!
    //arrayItemList = currentCategoryDic[categoryArrayString]!

  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "modelToDetail"
    {
      var detailController = segue.destinationViewController as DetailedViewController
      //detailController.profile = Profile()
      magic("Segue working proplery")

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

    let item = profile[indexPath.row]

    cell.setCell(item.imageName!, brandLabelText: item.make, modelLabelText: item.model, timesWornText: 1)//"Times Worn: \(item.timesWorn)") also make the brand the type of class this is that represents these items in the array which is an array of items array

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

    //userDefaultsSetObjectForKey("ModelName", userDefValue: arrayOfCategoryNames[indexPath.row])

    //    var detailedViewController: DetailedViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailedViewController") as DetailedViewController
    //    self.presentViewController(detailedViewController, animated: true, completion: nil)
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let num = indexPath.row
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.removeObjectForKey("ItemNum")
    userDefaults.setValue(indexPath.row, forKey: "itemNum")
    NSUserDefaults.standardUserDefaults().synchronize()

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

  //MARK: - User Default Methods
//  func userDefaultsValueForKey(userDefaultKey: String) ->String
//  {
//    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String
//    magic("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")
//
//    return selectorString
//  }
//  func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
//  {
//    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//    userDefaults.removeObjectForKey(userDefaultKey)
//    userDefaults.setValue(userDefValue, forKey: userDefaultKey)
//    NSUserDefaults.standardUserDefaults().synchronize()
//    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String
//
//    magic("userDefaultsSetObjectForKey: \(selectorString)")
//    magic("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
//  }

}


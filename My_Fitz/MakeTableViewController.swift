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
  var profile: [String: [[Item]]]!
  var arrayOfCategoryNames = [String]()
  var arrayOfTypes: [Item]!
  var theItemToSend: [Item]!


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
      if let arrayOfItems = theItemToSend
      {
        var modelController = segue.destinationViewController as ModelTableViewController
        modelController.profile = arrayOfItems
      }
      magic("Segue working proplery")
    }
    else
    {
      magic("Segue working not proplery")
    }
  }

  //MARK: - TableView Methods
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return profile.count
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

    cell.setCell(arrayOfTypes[indexPath.row].imageName, makeLabelText: arrayOfTypes[indexPath.row].make, numberOfItemsText: arrayOfTypes.count)

    return cell
  }
  override func  tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  {
    if editingStyle == UITableViewCellEditingStyle.Delete
    {
      arrayOfTypes.removeAtIndex(indexPath.row)

      self.tableView.reloadData()
    }
  }
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String! = userDefaults.objectForKey("selectorString") as String!

    if (selectorString.isEmpty == true)
    {

    }

    return selectorString

  }
  override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    //FIXME: - Clean tableView(didSelectRowAtIndexPath) - MakeTableViewControll
    let num: Int = self.profile.count
    for (key, value) in self.profile
    {

      var array : [Item] = []
      var i = 0
      if i == indexPath.row
      {
        for valueOfArray in value
        {
          array += valueOfArray
        }
        arrayOfTypes = array
      }

    }
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }


  //MARK: - Created Methods
  func setUpTypes()
  {



  }
  func selection()
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String = userDefaults.objectForKey("selectorString") as String ;TypeBarButtonLabel.title = selectorString
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
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
  
  @IBOutlet var TypeBarButtonLabel: UIBarButtonItem!
  var profile: Profile!
  var arrayOfTypes = [[Item]]()
  var arrayOfCategoryNames = [String]()
  
  
  
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    self.SetUpTypes()
  }
  
  override func viewDidAppear(animated: Bool)
  {
    
    tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  /************************TableView*****************************/
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return arrayOfTypes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell: MakeCustonCell = tableView.dequeueReusableCellWithIdentifier("cell") as! MakeCustonCell
    
    
    if indexPath.row % 2 == 0//If even number make this color
    {
      cell.backgroundColor = UIColor.redColor()
    }
      
    else
    {
      cell.backgroundColor = UIColor.blueColor()
    }
    
    cell.setCell(arrayOfTypes[indexPath.row][0].imageName, makeLabelText: arrayOfTypes[indexPath.row][0].make, numberOfItemsText: arrayOfTypes[indexPath.row].count)
    //userDefaultsSetObjectForKey("ModelName", userDefValue: arrayOfCategoryNames[indexPath.row])
    
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
    var selectorString: String! = userDefaults.objectForKey("selectorString") as! String!
    
    if (selectorString.isEmpty == true)
    {
      
    }
    
    return selectorString
    
  }
  
//    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//      userDefaultsSetObjectForKey("ModelName", userDefValue: arrayOfCategoryNames[indexPath.row])
//      let item = arrayOfTypes[indexPath.row]
//  
//      var detailedViewController: DetailedViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailedViewController") as! DetailedViewController
//      self.presentViewController(detailedViewController, animated: true, completion: nil)
//      self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
  
  /************************Created*****************************/
  func SetUpTypes()
  {
    profile = Profile()
    
    var string: String = userDefaultsValueForKey("selectorString")
    let currentCategoryDic: [String: [Item]] = profile.categoryDics[string]!
    
    for (key, value) in currentCategoryDic as Dictionary
    {
      arrayOfTypes.append(value)
      arrayOfCategoryNames.append(key)
    }
  }
  
  func userDefaultsValueForKey(userDefaultKey: String) ->String
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as! String
    magic("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")
    
    return selectorString
  }
  
  func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.removeObjectForKey(userDefaultKey)
    userDefaults.setValue(userDefValue, forKey: userDefaultKey)
    NSUserDefaults.standardUserDefaults().synchronize()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as! String
    
    magic("userDefaultsSetObjectForKey: \(selectorString)")
    magic("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
  }

  override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    userDefaultsSetObjectForKey("ModelName", userDefValue: arrayOfCategoryNames[indexPath.row])

  }
  
  func selection()
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String = userDefaults.objectForKey("selectorString") as! String
    //arrayOfTypes = profile.categoryDics.valueForKey(selectorString)
    TypeBarButtonLabel.title = selectorString
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "makeToModel"
    {
      var modelController = segue.destinationViewController as! ModelTableViewController
      modelController.profile = Profile()
      magic("Segue working proplery")

    }
    else
    {
      magic("Segue working not proplery")
    }
  }
  
}
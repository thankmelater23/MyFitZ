//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ModelTableViewController: UITableViewController {
  
  @IBOutlet weak var myTableView: UITableView!
  var arrayItemList: [Item] = [Item]()//Make a new class for this
  var profile: Profile!
  var ModelArrayIndex: Int!
  var MakeKeyString: String!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
     self.SetUpTypes()
   
  }
  func SetUpTypes()
  {
    profile = Profile()
    let makeString = userDefaultsValueForKey("selectorString")
    let categoryArrayString = userDefaultsValueForKey("ModelName")
    
    let currentCategoryDic: [String: [Item]] = profile.categoryDics[makeString]!
    arrayItemList = currentCategoryDic[categoryArrayString]!
  
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
    /************************TableView*****************************/
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return arrayItemList.count
    
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  {
    let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier("cell") as! ModelCustomCell
    
    if indexPath.row % 2 == 0//If even number make this color
    {
      cell.backgroundColor = UIColor.redColor()
    }
      
    else
    {
      cell.backgroundColor = UIColor.blueColor()
    }
    
    let item = arrayItemList[indexPath.row]
    
    cell.setCell(item.imageName!, brandLabelText: item.make, modelLabelText: item.model, timesWornText: 1)//"Times Worn: \(item.timesWorn)")
    
    return cell
    
  }
  
  override func  tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
  {
    if editingStyle == UITableViewCellEditingStyle.Delete
    {
      arrayItemList.removeAtIndex(indexPath.row)
      
      self.myTableView.reloadData()
    }
  }
  
  override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
  {
    
    //userDefaultsSetObjectForKey("ModelName", userDefValue: arrayOfCategoryNames[indexPath.row])
    
//    var detailedViewController: DetailedViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailedViewController") as DetailedViewController
//    self.presentViewController(detailedViewController, animated: true, completion: nil)
    self.myTableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  {
     var makeString: String! = userDefaultsValueForKey("ModelName")
    if (makeString.isEmpty == true)
    {
      
    }
    
    return makeString
  }

  
    /************************Created*****************************/
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
  
}


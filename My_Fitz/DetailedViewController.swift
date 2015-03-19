//
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

class DetailedViewController: UIViewController//, UITableViewDelegate, UITableViewDataSource
{
  //MARK: - View IBOutlets
  @IBOutlet var itemImage: UIImageView!

  //MARK: - View Variables
  //TODO:- Change this variable to single item
  var profile: Profile = Profile()

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
  }

  //MARK: - User Default Methods
  func userDefaultsValueForKey(userDefaultKey: String) ->String
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String
    magic("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")

    return selectorString
  }
  func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.removeObjectForKey(userDefaultKey)
    userDefaults.setValue(userDefValue, forKey: userDefaultKey)
    NSUserDefaults.standardUserDefaults().synchronize()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String

    magic("userDefaultsSetObjectForKey: \(selectorString)")
    magic("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
  }

  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0
  }

  //MARK: - Created Methods
  func setUp()
  {
    //Warning Finsish setting up
    //TODO: - Finsish setting up
    //FIXME: - Finsish setting up
    let makeString = userDefaultsValueForKey("selectorString")
    let categoryArrayString = userDefaultsValueForKey("ModelName")
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    //var itemPosition = userDefaults.valueForKey("ItemNum")


    let currentCategoryDic: [String: [Item]] = profile.categoryDics[makeString]!
    let arrayItemList = currentCategoryDic[categoryArrayString]!

    let item = arrayItemList[0]//itemPosition as! Int]

    itemImage.image = UIImage(named: item.imageName)

  }
}

//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit



class SelectionViewController: UIViewController
{
  //MARK: - View Variables
  var profile: Profile!
  var selectorString: String! = ""

  //MARK: - View IBActions
  @IBAction func selectionType(sender: AnyObject)
  {
    selectorString = sender.currentTitle as String!
  }

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do view setup here.
  }
  //!!!: Have to fix this segue
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    var categoryTypeString: String!

    if let segueOpener = segue.identifier
    {
      //TODO: - Add A switch statement to set string for correct segue
      if segue.identifier == "shoesSelectionToMake"
      {
        categoryTypeString = "Shoes"
      }
      var makeController: MakeTableViewController! = segue.destinationViewController as MakeTableViewController
      //FIXME: - variable is holding generic type set up to accept the self.profile
      makeController.profile =   [String: [[Item]]]()//self.profile.categoryDics[categoryTypeString]  //as! [String: [[Item]]]

      magic("Segue working proplery")
    }
    else
    {
      magic("Segue working not proplery")
    }
  }

  //MARK: - User Default Methods
  //func userDefaultsValueForKey(userDefaultKey: String) ->String
  //{
  //  var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
  //  var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String
  //  magic("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")
  //
  //  return selectorString
  //}
  //
  //func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
  //{
  //  var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
  //  userDefaults.removeObjectForKey(userDefaultKey)
  //  userDefaults.setValue(userDefValue, forKey: userDefaultKey)
  //  NSUserDefaults.standardUserDefaults().synchronize()
  //  var selectorString: String = userDefaults.objectForKey(userDefaultKey) as String
  //
  //  magic("userDefaultsSetObjectForKey: \(selectorString)")
  //  magic("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
  //}
  
}
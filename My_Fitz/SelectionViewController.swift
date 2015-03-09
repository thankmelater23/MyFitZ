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
  var profile: Profile! = Profile()

  //MARK: - View IBActions
    @IBAction func selectionType(sender: AnyObject)
    {
        var selectorString: String = sender.currentTitle as String!
        
        userDefaultsSetObjectForKey("selectorString", userDefValue: selectorString)
    }

    //MARK: - View Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
    }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {
    if segue.identifier == "shoesSelectionToMake"
    {
      var makeController = segue.destinationViewController as! MakeTableViewController
      makeController.profile = self.profile
      magic("Segue working proplery")

    }
    else
    {
      magic("Segue working not proplery")
    }
  }

  //MARK: - User Default Methods
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
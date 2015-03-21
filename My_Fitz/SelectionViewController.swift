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

  // A string that holds what category to open up
  var categoryString: String!

  //MARK: - View IBActions
  @IBAction func selectionType(sender: AnyObject)
  {

    //TODO: - Find Out what this method is for
    categoryString = sender.currentTitle as String!
  }

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do view setup here.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {

    if let segueOpener = segue.identifier
    {
      //TODO: - Add A switch statement to set string for correct segue
      if segue.identifier == "shoesSelectionToMake"
      {
        categoryString = "Shoes"
      }
      var makeController: MakeTableViewController! = segue.destinationViewController as MakeTableViewController
      //FIXME: - variable is holding generic type set up to accept the self.profile
      var newArrayVar = self.profile.categoryDics[categoryString]!
      makeController.profile = newArrayVar//[String: [[Item]]]()//self.profile.categoryDics[categoryString] //as [String: [[Item]]]
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
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

  /// A string that holds what category to open up
  var categoryString: String!

  //MARK: - View IBActions
  @IBAction func selectionType(sender: AnyObject)
  {
    categoryString = sender.currentTitle as String!
    //self.performSegueWithIdentifier("shoesSelectionToMake", sender: nil)
  }

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    // Do view setup here.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
  {

    //categoryString = "Shoes"
    if segue.identifier == "selectionToMake"
    {
    var makeController: MakeTableViewController! = segue.destinationViewController as MakeTableViewController
        var newArrayVar = self.profile.categoryDics[categoryString]!
        let tempItemArray = newArrayVar.values.array
        makeController.profile = tempItemArray as   [[Item]]!
        makeController.categoryString = self.categoryString
        magic("Segue working proplery")
      }
      else
      {
        magic("Segue working not proplery")
      }

    }
  }
  

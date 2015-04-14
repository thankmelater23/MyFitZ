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
  //MARK: - IBOutlets
  ///Button that appears after a selection has been made
  @IBOutlet var doneButton: UIButton!
  //MARK: - View Variables
  var profile: Profile!

  /// A string that holds what category to open up
  var categoryString: String!

  //MARK: - View IBActions
  ///An action that takes the buttonn(sender).text and stores it into categoryString
  @IBAction func selectionType(sender: AnyObject){
    categoryString = sender.currentTitle as String!

    if categoryString != nil
    {
      doneButton.hidden = false
    }
  }

  //MARK: - View Methods
  override func viewDidLoad(){
    doneButton.hidden = true

    super.viewDidLoad()
    // Do view setup here.
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == "selectionToMake"
    {
      var makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
      var newArrayVar = self.profile.categoryDics[categoryString]!
      let tempItemArray = newArrayVar.values.array
      makeController.itemsInArrayInArray = tempItemArray as   [[Item]]!
      makeController.categoryString = self.categoryString
      magic("Segue working proplery")

//      var parseIsh = PFObject(className: "MakeTable")
//      parseIsh.addObject(categoryString, forKey: "Category")
//      parseIsh.addObject(makeController.itemsInArrayInArray.count, forKey: "ItemsInArrayInArrayCount")
//      parseIsh.pin()
//      //parseIsh.saveEventually(<#callback: PFBooleanResultBlock!##(Bool, NSError!) -> Void#>)
//      parseIsh.save()
//      parseIsh.unpin()

      //var parseIntRetrieved = PFObject(className: "MakeTable")
      //var category = parseIntRetrieved.objectForKey("Category") as String
    }
    else
    {
      magic("Segue working not proplery")
    }

  }
}


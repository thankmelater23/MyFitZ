//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit


//MARK: - SelectionViewController
class SelectionViewController: UIViewController{
  //IBOutlets
  ///Button that appears after a selection has been made
  @IBOutlet var doneButton: UIButton!
  //View Variables
  ///A variable that holds the entire sytstem tree  of the project
  var profile: Profile!
  /// A string that holds the selected category
  var categoryString: String!


  //View IBActions
  ///An action that takes the buttonn(sender).text and stores it into categoryString
  @IBAction func selectionType(sender: AnyObject){
    categoryString = sender.currentTitle as String!

    if categoryString != nil
    {
      doneButton.hidden = false
    }
  }

  //View Methods
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


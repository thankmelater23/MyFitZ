//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
//import Crashlytics

//MARK: - SelectionViewController
class SelectionViewController: UIViewController{ 
  var selectedUser: Int! = 0//Check on what this is
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()


  //View IBActions
  ///An action that takes the buttonn(sender).text and stores it into categoryString
  @IBAction func categoryIsButtonName(sender: UIButton) {
    path[PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!
  }

  //View Methods
  override func viewDidLoad(){
//      gamesWardrobe = gamesWardrobe.loadAndCreateCloset()

    super.viewDidLoad()
    let button = UIButton(type: UIButtonType.RoundedRect)
    button.frame = CGRectMake(20, 50, 100, 30)
    button.setTitle("Crash", forState: UIControlState.Normal)
    button.addTarget(self, action: "crashButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
    view.addSubview(button)
    }
    
//    @IBAction func crashButtonTapped(sender: AnyObject) {
//        Crashlytics.sharedInstance().crash()
//    }
    
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_SELECTION_TO_MAKE{
      let makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
      makeController.path = self.path
      makeController.itemsInArrayInDictionary = gamesWardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
      print("Segue transfer: \(segue.identifier)")
    }else{
      print("Segue transfer: \(segue.identifier)")
    }
  }
}



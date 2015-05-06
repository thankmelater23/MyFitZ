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
  var profile: Profile! = Profile()
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()


  //View IBActions
  ///An action that takes the buttonn(sender).text and stores it into categoryString
  @IBAction func categoryIsButtonName(sender: UIButton) {
    path[PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!

    if let category = path[PATHTYPE_CATEGORY_STRING]
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
    if segue.identifier == SEGUE_SELECTION_TO_MAKE{
      var makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
      makeController.path = self.path
      makeController.itemsInArrayInDictionary = self.profile.categoryDics[path[PATHTYPE_CATEGORY_STRING]!]

    }else{
      magic("Segue working not proplery: \(segue.identifier)")
    }
    
  }

}



//File System
extension SelectionViewController{
  //Used to save to ios directory
  func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    return documentsFolderPath
  }
  func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
  }
  func saveObjectToArchived(filePath: String, closetInstance: CLOSET_TYPE!){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(closetInstance, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> CLOSET_TYPE? {

    if let closet = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? CLOSET_TYPE{

      return closet
  }
    return nil

}
}

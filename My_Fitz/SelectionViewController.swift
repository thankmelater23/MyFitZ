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
  //View Variables
  ///A variable that holds the entire sytstem tree  of the project
  var users: Wardrobe? //{
//    get{
//      if self.users.isEmpty{
//          if let num = selectedUser as Int{
//            return self.users[num]
//          }else{
//            return self.users.first!
//          }
//      }else{
//        let wardrobe = Wardrobe()
//        users.append(wardrobe)
//        return users.first!
//      }
//    }
//    set{
//      users.append(newElement)
//    }
//  }
  var selectedUser: Int!
  ///Dictionary path to item
  var path: [String: String]! = [String: String]()


  //View IBActions
  ///An action that takes the buttonn(sender).text and stores it into categoryString
  @IBAction func categoryIsButtonName(sender: UIButton) {
    path[PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!
  }

  //View Methods
  override func viewDidLoad(){
    self.users = Wardrobe()
    var loadedArchived = loadAndCreateCloset() as Wardrobe
    self.users = loadedArchived as Wardrobe!

    super.viewDidLoad()
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_SELECTION_TO_MAKE{
      var makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
      makeController.path = self.path
      makeController.itemsInArrayInDictionary = self.users!.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
      magic("Segue transfer: \(segue.identifier)")
    }else{
      magic("Segue transfer: \(segue.identifier)")
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
  func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){

    magic("save: \(filePath)")

    var success = false

    success = NSKeyedArchiver.archiveRootObject(wardrobeToSave!, toFile:filePath)

    if success {
      println("Saved successfully")
    } else {
      println("Error saving data file")
    }
  }
  func loadArchivedObject(filePath: String) -> Wardrobe? {

    if NSFileManager.defaultManager().fileExistsAtPath(filePath){
      if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Wardrobe{
        return wardrobe
      }else{
        let newWardrobe = Wardrobe()
        saveObjectToArchived(filePath, wardrobeToSave: newWardrobe)
        return newWardrobe
      }
    }else{
      if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? Wardrobe{
        return wardrobe
      }else{
        var newWardrobe = Wardrobe()
        saveObjectToArchived(filePath, wardrobeToSave: newWardrobe)
        return newWardrobe
      }

    }
  }
  func loadAndCreateCloset() -> Wardrobe{
    var filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    return loadArchivedObject(filePath)!
  }
}

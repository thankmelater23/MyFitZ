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
//  var users: Wardrobe? //{
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
    let loadedArchived = loadAndCreateCloset() as Wardrobe
    self.users = loadedArchived as Wardrobe!

    super.viewDidLoad()
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_SELECTION_TO_MAKE{
      let makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
      makeController.path = self.path
      makeController.itemsInArrayInDictionary = self.users!.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
      print("Segue transfer: \(segue.identifier)")
    }else{
      print("Segue transfer: \(segue.identifier)")
    }
  }
}



//File System
extension SelectionViewController{
        //Used to save to ios directory
        func documentsDirectory() -> NSURL {
            let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
            return documentsFolderPath
        }
        func fileInDocumentsDirectory(filename: String) -> NSURL {
            return documentsDirectory().URLByAppendingPathComponent(filename)//stringByAppendingString("/\(filename)")
        }
        func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
            
            print("save: \(filePath)")
            
            var success = false
            
            dispatch_async(GlobalUtilityQueue, {
                success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
            })
            if success {
                ("Saved successfully")
            } else{
                print("Error saving data file")
            }
        }
        func loadArchivedObject(filePath: NSURL) -> Wardrobe? {
            
            if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
                return wardrobe
            }else{
                let newWardrobe = Wardrobe()
                saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
                return newWardrobe
            }
        }
        func loadAndCreateCloset() -> Wardrobe{
            let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
            return loadArchivedObject(filePath)!
        }
}


//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ViewController:  UIViewController{
  ///A variable that holds the entire sytstem tree  of the project
  var profile: Profile! = Profile()

  ///Dictionary path to item
  var path: [String: String] = [String: String]()
  

  override func viewDidLoad(){
    super.viewDidLoad()
    
    var pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
    var loadedArchived:CLOSET_TYPE! = loadArchivedObject(pathOfFile) as CLOSET_TYPE
    profile.categoryDics = loadedArchived as CLOSET_TYPE

    // Do any additional setup after loading the view, typically from a nib.
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == SEGUE_MAIN_TO_SELECTION{
      var selectionController = segue.destinationViewController as! SelectionViewController
      selectionController.profile = self.profile
      selectionController.path = self.path

    }else{
      magic("Segue not working proplery SELCTIONCONTROLLER: \(segue.identifier)")
    }
  }
}



  //File System
  extension ViewController{
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
    func loadArchivedObject(filePath: String) -> CLOSET_TYPE! {

      if let closet = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? CLOSET_TYPE{

        return closet as CLOSET_TYPE
      }else{
        let closetToSave = Profile()
        let checkVar = closetToSave.categoryDics
        saveObjectToArchived(filePath, closetInstance: checkVar)

        return checkVar as CLOSET_TYPE
      }
    }
}



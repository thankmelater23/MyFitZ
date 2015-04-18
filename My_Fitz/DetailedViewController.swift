//
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

class DetailedViewController: UIViewController{
  //MARK: - View IBOutlets
  ///Views main image of the Item being presented
  @IBOutlet var itemImage: UIImageView!

  //MARK: - View Variables
  ///Item selected
  var itemOfObject: Item!
  ///Items index place in array
  var arrayIndex: Int!
  ///Holds the optional and required dictionaries
  var itemInfoDictionaries = [[String: String]]()
  ///Holds the required information from the item
  let itemInfoRequiredDictionary = [String: String]()
  ///Holds the optional information from the item
  let itemInfoOptionalDictionary = [String: String]()


  //MARK: - View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
  }
  //MARK: - Created Methods
}



extension DetailedViewController{
  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return itemInfoDictionaries.count
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10
  }
  func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
}



///DetailedViewController Developer Created Methods
extension DetailedViewController{
  func setUp(){
    itemImage.image = UIImage(named: itemOfObject.imageName) as UIImage!

  }//Sets up view

  func retrieveRequiredDicInfo(requiredDic: [String: String]){
    //FIXME: - Finish implementing correctly
    //self.itemInfoRequiredDictionary = requiredDic
  }

  func retrieveOptionalDicInfo(optionalDic: [String: String]){
    //FIXME: - Finish implementing correctly
    //self.itemInfoRequiredDictionary = requiredDic
  }
}
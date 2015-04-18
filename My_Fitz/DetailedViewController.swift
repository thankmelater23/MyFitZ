//
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

//MARK: - DetailedViewController Class
class DetailedViewController: UIViewController{

  //View IBOutlets
  ///Views main image of the Item being presented
  @IBOutlet var itemImage: UIImageView!

  //View Variables
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


  //View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
  }
}


//MARK: - TableView Methods
extension DetailedViewController{
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


//MARK: - Developer Created Methods
extension DetailedViewController{
  func setUp(){
    itemImage.image = UIImage(named: itemOfObject.imageName) as UIImage!

  }//Sets up view
  ///Takes required dictionary and matches its info with that of the newley created Item object
  func retrieveRequiredDicInfo(requiredDic: [String: String]){
    //FIXME: - Finish implementing correctly
    //self.itemInfoRequiredDictionary = requiredDic
  }
  ///Takes optional dictionary and matches its info with that of the newley created Item object
  func retrieveOptionalDicInfo(optionalDic: [String: String]){
    //FIXME: - Finish implementing correctly
    //self.itemInfoRequiredDictionary = requiredDic
  }
}
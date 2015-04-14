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
  @IBOutlet var itemImage: UIImageView!

  //MARK: - View Variables
  var itemOfObject: Item!
  var arrayIndex: Int!


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
    return 0
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
    //Warning Finsish setting up
  }
}
//
//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

class DetailedViewController: UIViewController//, UITableViewDelegate, UITableViewDataSource
{
  //MARK: - View IBOutlets
  @IBOutlet var itemImage: UIImageView!

  //MARK: - View Variables
  //TODO:- Change this variable to single item
  var profile: Item!

  //MARK: - View Methods
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.setUp()

    // Do view setup here.
  }

  // MARK: - Table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
  }
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0
  }

  //MARK: - Created Methods
  func setUp()
  {
    //Warning Finsish setting up
    //TODO: - Finsish setting up
    //FIXME: - Finsish setting up
  }
}

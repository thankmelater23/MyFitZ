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
    @IBOutlet var myTableView: UITableView!
  @IBOutlet var itemImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func userDefaultsMeth()
    {
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var selectorString: String = userDefaults.objectForKey("selectorString") as! String
        
        
        userDefaults.removeObjectForKey("selectorString")
        userDefaults.setValue(selectorString, forKey: "selectorString")
        userDefaults.synchronize()
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
    
}

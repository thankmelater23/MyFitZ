//
//  CreationViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController
{
  @IBOutlet var categoryInputTextField: UITextField!
  @IBOutlet var subCategoryInputTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.

  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("textInput") as CreationUITableViewCell

    cell.configure(text: "", labelString: "Name", placeHolder:"Enter Text")
    // set cell's textLabel.text property
    // set cell's detailTextLabel.text property
    return cell
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1 // Most of the time my data source is an array of something...  will replace with the actual name of the data source
  }

   func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 200
  }
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


/***********************NOTES*********************/
// Use pickerView Object to choose categories and sub-categories that already exist and at the bottom have an option to add new one

//













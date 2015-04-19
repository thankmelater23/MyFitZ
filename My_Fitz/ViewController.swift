
//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
  ///A variable that holds the entire sytstem tree  of the project
  var profile: Profile!

  override func viewDidLoad(){
    super.viewDidLoad()
    if self.profile == nil
    {
      profile = Profile()
    }

    // Do any additional setup after loading the view, typically from a nib.
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    if segue.identifier == "maintToSelection"
    {
      var selectionController = segue.destinationViewController as! SelectionViewController
      selectionController.profile = self.profile
      magic("Segue working proplery SELCTIONCONTROLLER: /(selectionController)")

    }else{
      magic("Segue working not proplery SELCTIONCONTROLLER: /(selectionController)")
    }
  }
}


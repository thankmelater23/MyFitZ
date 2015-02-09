               //
//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var profile: Profile!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profile = Profile()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
//                if (segue.identifier == "maintToSelection")
//                {
//                    var newVC : MakeTableViewController = segue.destinationViewController as MakeTableViewController
//                    newVC.profile = self.profile
//                    println("segue")
//                }
//        
//        else
//                {
//                    println("No segue")
//        }
        
        //        newVC.profile = self.profile
        //newVC.recievedString = ""
        
        //var myVC: MakeViewController = segue.destinationViewController as  MakeViewController
        //let vc = navigationController.topViewController as MakeViewController
        //myVC.profile = self.profile
        
        //var modelViewController: ModelViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ModelViewController") as ModelViewController
        //makeViewController = self.profile
        
        //self.presentViewController(makeViewController, animated: true, completion: nil)
    }
}


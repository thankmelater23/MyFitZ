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
}


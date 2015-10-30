
//  ViewController.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class ViewController:  UIViewController{
    @IBAction func selectedCloset() {
        gamesWardrobe = gamesWardrobe.loadAndCreateCloset()
        gamesWardrobe.closetSelectionString = MY_CLOSET
        
    }


    
    @IBAction func selectedWants() {
        gamesWardrobe = gamesWardrobe.loadAndCreateCloset()
        gamesWardrobe.closetSelectionString = MY_WANTS_CLOSET
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


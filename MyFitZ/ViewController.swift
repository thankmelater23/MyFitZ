
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
        playSoundEffects(closetSFX)
//        performSegueWithIdentifier(SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    
    @IBAction func selectedWants() {
        gamesWardrobe = gamesWardrobe.loadAndCreateCloset()
        gamesWardrobe.closetSelectionString = MY_WANTS_CLOSET
        playSoundEffects(wishlistSFX)
//        performSegueWithIdentifier(SEGUE_MAIN_TO_SELECTION, sender: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        initializeSounds()
        
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = false
        
        self.title = gamesWardrobe.closetSelectionString
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


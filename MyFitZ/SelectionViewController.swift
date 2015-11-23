//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
import DKChainableAnimationKit
//import Crashlytics

//MARK: - SelectionViewController
class SelectionViewController: UIViewController{
    @IBOutlet weak var searchButton: UIButton!
    var selectedUser: Int! = 0//Check on what this is
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    //View IBActions
    ///An action that takes the buttonn(sender).text and stores it into categoryString
    @IBAction func categoryIsButtonName(sender: UIButton) {
        path[PATHTYPE_CATEGORY_STRING] = sender.currentTitle as String!
    }
    
    //View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
            
        self.searchButton.animation.makeScale(2.5).makeScale(0.5).makeScale(1.0).animate(2.0)
        
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Selection")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        
    }
    
    //    @IBAction func crashButtonTapped(sender: AnyObject) {
    //        Crashlytics.sharedInstance().crash()
    //    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_SELECTION_TO_MAKE{
            let makeController: MakeTableViewController! = segue.destinationViewController as! MakeTableViewController
            makeController.path = self.path
        }else if segue.identifier == SEGUE_SELECTION_TO_CREATION{
            
        }else{
//            print("Segue transfer: \(segue.identifier)")
        }
    }
}



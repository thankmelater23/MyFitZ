//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics



//MARK: - ModelTableViewController Class
class ModelTableViewController: UITableViewController {
    //MARK: -Variables
    ///items in an Array holds the sub-categories of the items
    var arrayOfItems: [Item]! = [Item]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetUpTypes()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("MODEL_PAGE_COUNT")
        
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        
        if segue.identifier == SEGUE_MODEL_TO_DETAIL
        {
            let index = indexToSend
            path[PATHTYPE_INDEX_STRING] = String(index!)
            
            let detailController = segue.destinationViewController as! DetailedViewController
            
            if let index = index{
                
                detailController.itemOfObject = self.arrayOfItems[index] as Item!
                
                detailController.path = self.path
            }else{
                assertionFailure("This shouldn't happen")
            }
            
        }else if segue.identifier == SEGUE_MODEL_TO_MAKE{
            let makeTableViewController = segue.destinationViewController as! MakeTableViewController
            
            makeTableViewController.path = self.path
        }else if segue.identifier == SEGUE_MODEL_TO_CREATION{
            
        }else if segue.identifier == SEGUE_MODEL_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = SEGUE_CREATION_TO_MODEL
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



//MARK: - TableView Methods
extension ModelTableViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier(MODEL_CELL) as! ModelCustomCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }else{
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }
        
        let item: Item            = arrayOfItems[indexPath.row] as Item!
        
        //TODO: -Change brand to subacategory instead
        cell.setCell(item.image!, brandLabelText: item.brand!, modelLabelText: item.model!, lastTimeWornText: item.lastTimeWorn!, favorited: item.favorited)
        
        return cell
    }
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        indexToSend = indexPath.row
        playSoundEffects(itemSelectSFX)
        performSegueWithIdentifier(SEGUE_MODEL_TO_DETAIL, sender: self)
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String(path[PATHTYPE_SUBCATEGORY_STRING]! + ": " + "\(self.arrayOfItems.count)")
    }
    ///Makes tableview cells auto resize properly for some reason, it won't without calling this function
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == UITableViewCellEditingStyle.Delete
            {
                let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
                let act = UIAlertAction(title: "cancel", style: .Default){_ in}
                let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
                    let itemToDelete = self.arrayOfItems[indexPath.row]
                    
                    Users_Wardrobe.deleteItem(self.path[PATHTYPE_CATEGORY_STRING]!, funcSubCategory: self.path[PATHTYPE_SUBCATEGORY_STRING]!, item: itemToDelete)
                    
                    self.arrayOfItems.removeAtIndex(indexPath.row)
                    
                    self.tableView.reloadData()
                }
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
    }
}



//MARK: - Actions-ModelTableViewController Extension
extension ModelTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_MODEL_TO_MAKE, sender: self)
    }
}



//MARK: - Initializer-ModelTableViewController Extension
extension ModelTableViewController{
    func SetUpTypes() {
        self.animateAllButtons()
        self.arrayOfItems = Users_Wardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]!
        
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PATHTYPE_SUBCATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
    }
}



//MARK: - UI-ModelTableViewController Extension
extension ModelTableViewController{
    func animateAllButtons(){
        //    self.animateSearchButton()
        //    self.animateStarButton()
        //    self.animateHamperButton()
        //    self.animateSearchButton()
        //    self.animatePictureLabels()
        //    self.animatePictureImages()
        //    self.animateNumberLabels()
        //    self.animateTrashButton()
        //    self.animateLogo()
        //        self.animateViews()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
}



//MARK: -Anylitics-MakeTableViewController Extension
extension ModelTableViewController{
    func logPageView(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("MODEL_PAGE_COUNT")
        
        Answers.logContentViewWithName("Sub-Category Content View",
            contentType: "Sub-Category View",
            contentId: "MF4",
            customAttributes: ["MODEL_PAGE_COUNT": pageCount!
            ])
    }
}
//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

//MARK: - ModelTableViewController Class
class ModelTableViewController: UITableViewController {
    //MARK: - View Variables
    ///items in an Array holds the sub-categories of the items
    var arrayOfItems: [Item]! = [Item]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetUpTypes()
        
    }
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_MODEL_TO_MAKE, sender: self)
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
///ModelTableViewController TableView Methods
extension ModelTableViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier(MODEL_CELL) as! ModelCustomCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            //cell.backgroundColor      = UIColor.grayColor()
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }else{
            //cell.backgroundColor      = UIColor.darkGrayColor()
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
        
        return path[PATHTYPE_SUBCATEGORY_STRING]
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
                    self.arrayOfItems.removeAtIndex(indexPath.row)
                    gamesWardrobe.selectedCloset[self.path[PATHTYPE_CATEGORY_STRING]!]![self.path[PATHTYPE_SUBCATEGORY_STRING]!]! = self.arrayOfItems
                    
                    gamesWardrobe.quickSave()
                    
                    self.tableView.reloadData()
                }
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
    }
}



//MARK: - Developer Created Methods
///ModelTableViewController Developer Created Methods
extension ModelTableViewController{
    func SetUpTypes() {
        self.arrayOfItems = gamesWardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]![path[PATHTYPE_SUBCATEGORY_STRING]!]!
        
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: PATHTYPE_SUBCATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
        }
}
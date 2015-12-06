//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
import Crashlytics

//MARK: -MakeTableViewController Class
class MakeTableViewController: UITableViewController{
    //MARK: -Outlets
    @IBOutlet var TypeBarButtonLabel: UIBarButtonItem!
    
    //MARK: - Variables
    ///items in a dictionary of arrays holds the categories of the items
    var itemsInArrayInDictionary: [String: [Item]]! = [String: [Item]]()
    var array = [[Item]]()
    var keyOfSelectedArray = [String]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        itemsInArrayInDictionary = gamesWardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
        
        self.setUpTypes()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("MAKE_PAGE_COUNT")
        
        self.logPageView()
        
    }
    override func viewDidAppear(animated: Bool){
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        if segue.identifier == SEGUE_MAKE_TO_MODEL
        {
            let index = self.tableView.indexPathForSelectedRow
            
            let modelController = segue.destinationViewController as! ModelTableViewController
            modelController.path = self.path
        }else if segue.identifier == SEGUE_MAKE_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = SEGUE_CREATION_TO_MAKE
        }
    }
}



//MARK: - Action-MakeTableViewController Extension
extension MakeTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_MAKE_TO_SELECTION, sender: self)
    }
}



//MARK: - Initializer Created Methods
extension MakeTableViewController{
    func setUpTypes(){
        self.itemsInArrayInDictionary = gamesWardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
    }//Sets up
    func selection(){
        TypeBarButtonLabel.title = path[PATHTYPE_CATEGORY_STRING]!
    }
}



//MARK: -TableView Methods-MakeTableViewController Extension
extension MakeTableViewController:UIAlertViewDelegate{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = itemsInArrayInDictionary.count
        return count
    }//Returns Int for number of sections in tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: MakeCustomCell = tableView.dequeueReusableCellWithIdentifier(MAKE_CELL) as! MakeCustomCell
        
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }else{
            cell.backgroundColor = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }
        
        var arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
        if arrayItemCell.count > 1{
            arrayItemCell = arrayItemCell.sort({$0.category > $1.category})
        }
        
        if let availableSubCategoryItem = arrayItemCell.first{
            cell.setCell(availableSubCategoryItem.image!, makeLabelText: availableSubCategoryItem.subCategory!, numberOfItemsText: arrayItemCell.count)
        }else{
            let image = UIImage(named: BLANK_IMAGE_STRING)
            cell.setCell(image!, makeLabelText: keyOfSelectedArray, numberOfItemsText: arrayItemCell.count)
        }
        
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
            let act = UIAlertAction(title: "cancel", style: .Default){_ in}
            let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
                let subCategoryToDelete = Array(self.itemsInArrayInDictionary.keys)[indexPath.row] as String//Gets key for dictionary selected
                self.itemsInArrayInDictionary.removeValueForKey(subCategoryToDelete)
                
                gamesWardrobe.selectedCloset[self.path[PATHTYPE_CATEGORY_STRING]!] = self.itemsInArrayInDictionary
                gamesWardrobe.quickSave()
                
                self.tableView.reloadData()
            }
            
            alert.addAction(action)
            alert.addAction(act)
            self.presentViewController(alert, animated: true, completion: {})
        }
        
        
    }//Editing to delete row
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return path[PATHTYPE_CATEGORY_STRING]
        
    }//Category name is shown in the title header
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
        path[PATHTYPE_SUBCATEGORY_STRING] = keyOfSelectedArray
        
        playSoundEffects(itemSelectSFX)
        
        performSegueWithIdentifier(SEGUE_MAKE_TO_MODEL, sender: self)
    }//Shows when a cell at row was selected
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
}



//MARK: -Anylitics-MakeTableViewController Extension
extension MakeTableViewController{
    func logPageView(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("MAKE_PAGE_COUNT")
        
        Answers.logContentViewWithName("Category Content View",
            contentType: "Category View",
            contentId: "MF3",
            customAttributes: ["MAKE_PAGE_COUNT": pageCount!
            ])
    }
}
 
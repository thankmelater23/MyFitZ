//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

///MakeTableViewController Class
class MakeTableViewController: UITableViewController{
    //View IBOutlets
    @IBOutlet var TypeBarButtonLabel: UIBarButtonItem!
    
    //View Variables
    ///items in a dictionary of arrays holds the categories of the items
    var itemsInArrayInDictionary: [String: [Item]]! = [String: [Item]]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    //View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.setUpTypes()
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
            let tempItemArray: [Item] = Array(self.itemsInArrayInDictionary.values)[index!.row]
            path[PATHTYPE_SUBCATEGORY_STRING] = Array(self.itemsInArrayInDictionary.keys)[index!.row]
            modelController.arrayOfItems = tempItemArray as [Item]!
            modelController.path = self.path
            
    }
}

}

//MARK: - Developer Created Methods
///Developer Created Methods
extension MakeTableViewController{
    func setUpTypes(){
        
    }//Sets up
    func selection(){
        TypeBarButtonLabel.title = path[PATHTYPE_CATEGORY_STRING]!
    }
}



//MARK: - TableView Methods
///TableView Methods
extension MakeTableViewController:UIAlertViewDelegate{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = itemsInArrayInDictionary.count
        return count
    }//Returns Int for number of sections in tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: MakeCustomCell = tableView.dequeueReusableCellWithIdentifier(MAKE_CELL) as! MakeCustomCell
        
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
            //cell.backgroundColor     = UIColor.cyanColor()
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }else{
            //cell.imageView?.image = UIImage(named: "cellBlackPatternImage.png")
            cell.backgroundColor = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }
        
        let arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
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
    }//Shows when a cell at row was selected
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
}
 
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
        if segue.identifier == SEGUE_MAKE_TO_MODEL
        {
            let index = self.tableView.indexPathForSelectedRow
            
            let modelController = segue.destinationViewController as! ModelTableViewController
            let tempItemArray: [Item] = self.itemsInArrayInDictionary.values.array[index!.row]
            path[PATHTYPE_SUBCATEGORY_STRING] = self.itemsInArrayInDictionary.keys.array[index!.row]
            modelController.arrayOfItems = tempItemArray as [Item]!
            modelController.path = self.path
            
            print("Segue transfer: \(segue.identifier)")
        }else{
            print("Segue transfer: \(segue.identifier)")
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
extension MakeTableViewController{
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
        
        let arrayItemCell: [Item] = self.itemsInArrayInDictionary.values.array[indexPath.row]
        let keyOfSelectedArray = self.itemsInArrayInDictionary.keys.array[indexPath.row]
        
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
            //TODO: - Create an alert view that uses method
            let alert                                       = UIAlertController(title: "Alert", message: "Are you sure you want to delete", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            //TODO: - Set up way for dictionary cell to be deleted
            
            let subCategoryToDelete = itemsInArrayInDictionary.keys.array[indexPath.row] as String//Gets key for dictionary selected
            itemsInArrayInDictionary.removeValueForKey(subCategoryToDelete)
            let pathOfFile                                  = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
            let loadedArchived:Wardrobe!                 = loadArchivedObject(pathOfFile) as Wardrobe?
            loadedArchived.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!] = self.itemsInArrayInDictionary
            saveObjectToArchived(pathOfFile.path!, wardrobeToSave: loadedArchived)
            
            
            self.tableView.reloadData()
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



//File System
extension MakeTableViewController{
    //Used to save to ios directory
    func documentsDirectory() -> NSURL {
        let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsFolderPath
    }
    func fileInDocumentsDirectory(filename: String) -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent(filename)//stringByAppendingString("/\(filename)")
    }
    func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
        
        print("save: \(filePath)")
        
        var success = false
        
        dispatch_async(GlobalUtilityQueue, {
            success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
        })
        if success {
            ("Saved successfully")
        } else{
            print("Error saving data file")
        }
    }
    func loadArchivedObject(filePath: NSURL) -> Wardrobe? {
        
        if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
            return wardrobe
        }else{
            let newWardrobe = Wardrobe()
            saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
            return newWardrobe
        }
    }
    func loadAndCreateCloset() -> Wardrobe{
        let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        return loadArchivedObject(filePath)!
    }
}
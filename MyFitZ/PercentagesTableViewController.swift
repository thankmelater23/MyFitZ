//
//  PercentagesTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/17/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import UIKit
import Crashlytics

class PercentagesTableViewController: UITableViewController {
    //MARK: - Variables
    ///items in a dictionary of arrays holds the categories of the items
    var itemsInArrayInDictionary: [String: [Item]]! = [String: [Item]]()
    var array = [[Item]]()
    var keyOfSelectedArray = [String]()
    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
        
        self.setUpTypes()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("PERCENT_PAGE_COUNT")
        
        self.logPageView()
        
    }
    override func viewDidAppear(animated: Bool){
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}


//MARK: -Action Methods
extension PercentagesTableViewController{
//    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
//        playSoundEffects(backSFX)
//        performSegueWithIdentifier(SEGUE_TRASH_TO_SELECTION, sender: self)
//    }
}



//MARK: - Initializer Created Methods
extension PercentagesTableViewController{
    func setUpTypes(){
        self.animateAllButtons()
        
        self.itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PATHTYPE_CATEGORY_STRING]!]
        
        self.setTitle()
        
    }//Sets up
    func selection(){
//        TypeBarButtonLabel.title = path[PATHTYPE_CATEGORY_STRING]!
    }
    func setTitle(){
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
    }
}



//MARK: -TableView Methods-MakeTableViewController Extension
extension PercentagesTableViewController:UIAlertViewDelegate{
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
        }
        
        
    }//Editing to delete row
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return String(path[PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
           }//Shows when a cell at row was selected
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
}



//MARK: - UI-TrashTableViewController Extension
extension PercentagesTableViewController{
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



//MARK: -Anylitics-TrashTableViewController Extension
extension PercentagesTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let pageCount:Int? = defaults.returnIntValue("PERCENT_PAGE_COUNT")
            
            Answers.logContentViewWithName("Percent Content View",
                contentType: "Percent View",
                contentId: "MF12",
                customAttributes: ["PERCENT_PAGE_COUNT": pageCount!
                ])
        })
    }
}



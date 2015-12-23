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
    var itemsInArrayInDictionary = [String: [[String: String]]]()
    var keyOfSelectedArray = [String]()
//    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
//    var path: [String: String]! = [String: String]()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.setUpTypes()
        self.view.backgroundColor = Cotton
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_PERCENTAGE_TO_SELECTION{
        }
    }
}


//MARK: -Action Methods
extension PercentagesTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_PERCENTAGE_TO_SELECTION, sender: self)
    }
}



//MARK: - Initializer Created Methods
extension PercentagesTableViewController{
    func setUpTypes(){
        self.animateAllButtons()
        self.setUpData()
        
        
        self.setTitle()
        
    }//Sets up
    func selection(){
//        TypeBarButtonLabel.title = path[PATHTYPE_CATEGORY_STRING]!n
    }
    func setTitle(){
        self.title = grabTitle("STATS", view: PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
    }
    func setUpData(){
        //Category item count
        let numberOfItemsInTop = Users_Wardrobe.getCountOfAllItemsInCategory(TOPS)
        let numberOfItemsInBottoms = Users_Wardrobe.getCountOfAllItemsInCategory(BOTTOMS)
        let numberOfItemsInFootware = Users_Wardrobe.getCountOfAllItemsInCategory(FOOTWARE)
        let numberOfItemsInUnderclothing = Users_Wardrobe.getCountOfAllItemsInCategory(UNDERCLOTHING)
        let numberOfItemsInAccessories = Users_Wardrobe.getCountOfAllItemsInCategory(ACCESSORIES)
        let numberOfItemsInHeadware = Users_Wardrobe.getCountOfAllItemsInCategory(HEADWARE)
        
        //Count of Subcategories
        let numberOfSubcategoriesInTop = Users_Wardrobe.selectedCloset[TOPS]!.count ?? 0
        let numberOfSubcategoriesInBottom = Users_Wardrobe.selectedCloset[BOTTOMS]!.count ?? 0
        let numberOfSubcategoriesInFootware = Users_Wardrobe.selectedCloset[FOOTWARE]!.count ?? 0
        let numberOfSubcategoriesInUnderClothing = Users_Wardrobe.selectedCloset[UNDERCLOTHING]!.count ?? 0
        let numberOfSubcategoriesInAccessories = Users_Wardrobe.selectedCloset[ACCESSORIES]!.count ?? 0
        let numberOfSubcategoriesInHeadware = Users_Wardrobe.selectedCloset[HEADWARE]!.count ?? 0
        let allSubCategories = numberOfSubcategoriesInTop + numberOfSubcategoriesInBottom + numberOfSubcategoriesInFootware + numberOfSubcategoriesInUnderClothing + numberOfSubcategoriesInAccessories + numberOfSubcategoriesInHeadware
        
        itemsInArrayInDictionary["Closet"] = [
            ["Amount of Items in \(Users_Wardrobe.closetSelectionString)": String(Users_Wardrobe.getCountOfCloset())],
            ["Total Amount Of Sub-Categories": String(allSubCategories)]
        ]
        
        
        
        itemsInArrayInDictionary["Categories"] = [
            //items category count
            ["Amount of Items in Top Category": String(numberOfItemsInTop)],
            ["Amount of Items in BOTTOMS Category": String(numberOfItemsInBottoms)],
            ["Amount of Items in FOOTWARE Category": String(numberOfItemsInFootware)],
            ["Amount of Items in UNDERCLOTHING Category": String(numberOfItemsInUnderclothing)],
            ["Amount of Items in ACCESSORIES Category": String(numberOfItemsInAccessories)],
            ["Amount of Items in HEADWARE Category": String(numberOfItemsInHeadware)]]
        
        itemsInArrayInDictionary["Categories"] = [
            //Sub categories count
            ["Amount of Sub Categories in Top Category": String(numberOfSubcategoriesInTop)],
            ["Amount of Sub Categories in BOTTOMS Category": String(numberOfSubcategoriesInBottom)],
            ["Amount of Sub Categories in FOOTWARE Category": String(numberOfSubcategoriesInFootware)],
            ["Amount of Sub Categories in UNDERCLOTHING Category": String(numberOfSubcategoriesInUnderClothing)],
            ["Amount of Sub Categories in ACCESSORIES Category": String(numberOfSubcategoriesInAccessories)],
            ["Amount of Sub Categories in HEADWARE Category": String(numberOfSubcategoriesInHeadware)]
            ]
        
            itemsInArrayInDictionary["Feature Stats"] = [
                ["Amount of favorited Items": String(Users_Wardrobe.selectedClosetFavoritedItems.count)],
                ["Amount of recently worn Items": String(Users_Wardrobe.selectedClosetRecentWornItems.count)],
                ["Amount of trashed Items": String(Users_Wardrobe.selectedClosetTrashItems.count)]
        ]
        
        self.keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)
    }
}



//MARK: -TableView Methods-MakeTableViewController Extension
extension PercentagesTableViewController:UIAlertViewDelegate{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let count = itemsInArrayInDictionary.count
        return count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let key = self.keyOfSelectedArray[section]
        return (self.itemsInArrayInDictionary[key]?.count)!
    }//Returns Int for number of sections in tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: StatsTableVIewCell = tableView.dequeueReusableCellWithIdentifier(STATS_CELL) as! StatsTableVIewCell
        
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }else{
            cell.backgroundColor = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }
        
        let key = self.keyOfSelectedArray[indexPath.section]
        let value = self.itemsInArrayInDictionary[key]![indexPath.row]
        value.keys.first
        
        let name = value.keys.first
        let info = value.values.first
        
//        var arrayItemCell = self.itemsInArrayInDictionary.indexForKey("here")//Array(self.itemsInArrayInDictionary.values)[indexPath.row]
////        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
//            guard let 
            cell.configure(name: name!, infoString: info!)
        
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
        }
        
        
    }//Editing to delete row
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return  self.keyOfSelectedArray[section]
        //String(path[PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
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



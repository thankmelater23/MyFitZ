//
//  PercentagesTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/17/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import UIKit
<<<<<<< HEAD

class PercentagesTableViewController: UITableViewController {
    //MARK: - Variables
    @objc var itemsInArrayInDictionary = [String: [[String: String]]]()
    @objc var keyOfSelectedArray = [String]()
    //    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    //    var path: [String: String]! = [String: String]()
=======
import Crashlytics

class PercentagesTableViewController: UITableViewController {
    //MARK: - Variables
    var itemsInArrayInDictionary = [String: [[String: String]]]()
    var keyOfSelectedArray = [String]()
//    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
//    var path: [String: String]! = [String: String]()
>>>>>>> MyFitZOld/master
    
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.info(#function)
        self.setUpTypes()
        self.view.backgroundColor = Cotton
        
        
<<<<<<< HEAD
        //        defaults.addAndSend("PERCENT_PAGE_COUNT")
        
        //        self.logPageView()
        
    }
    override func viewDidAppear(_ animated: Bool){
=======
        defaults.addAndSend("PERCENT_PAGE_COUNT")
        
        self.logPageView()
        
    }
    override func viewDidAppear(animated: Bool){
>>>>>>> MyFitZOld/master
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
    }
    
<<<<<<< HEAD
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
=======
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
>>>>>>> MyFitZOld/master
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == Segue.SEGUE_PERCENTAGE_TO_SELECTION{
        }
    }
<<<<<<< HEAD
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //TODO: Set these up to do some house work
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        return true
    }
=======
>>>>>>> MyFitZOld/master
    deinit{
        log.info(#function)
        
    }
}


//MARK: -Action Methods
extension PercentagesTableViewController{
<<<<<<< HEAD
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_PERCENTAGE_TO_SELECTION, sender: self)
=======
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(Segue.SEGUE_PERCENTAGE_TO_SELECTION, sender: self)
>>>>>>> MyFitZOld/master
    }
}



//MARK: - Initializer Created Methods
extension PercentagesTableViewController{
<<<<<<< HEAD
    @objc func setUpTypes(){
=======
    func setUpTypes(){
>>>>>>> MyFitZOld/master
        self.animateAllButtons()
        self.setUpData()
        
        
        self.setTitle()
        
    }//Sets up
<<<<<<< HEAD
    @objc func selection(){
        //        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!n
    }
    @objc func setTitle(){
=======
    func selection(){
//        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!n
    }
    func setTitle(){
>>>>>>> MyFitZOld/master
        self.title = grabTitle("STATS", view: PathType.PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
<<<<<<< HEAD
        self.navigationController?.navigationBar.isTranslucent = false
    }
    @objc func setUpData(){
        //        //Category item count
        //        let numberOfItemsInTop = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.TOPS)
        //        let numberOfItemsInBottoms = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.BOTTOMS)
        //        let numberOfItemsInFootware = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.FOOTWARE)
        //        let numberOfItemsInUnderclothing = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.UNDERCLOTHING)
        //        let numberOfItemsInAccessories = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.ACCESSORIES)
        //        let numberOfItemsInHeadware = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.HEADWARE)
        //
        //        //Count of Subcategories
        //        let numberOfSubcategoriesInTop = Users_Wardrobe.selectedCloset[CateogryType.TOPS]!.count ?? 0
        //        let numberOfSubcategoriesInBottom = Users_Wardrobe.selectedCloset[CateogryType.BOTTOMS]!.count ?? 0
        //        let numberOfSubcategoriesInFootware = Users_Wardrobe.selectedCloset[CateogryType.FOOTWARE]!.count ?? 0
        //        let numberOfSubcategoriesInUnderClothing = Users_Wardrobe.selectedCloset[CateogryType.UNDERCLOTHING]!.count ?? 0
        //        let numberOfSubcategoriesInAccessories = Users_Wardrobe.selectedCloset[CateogryType.ACCESSORIES]!.count ?? 0
        //        let numberOfSubcategoriesInHeadware = Users_Wardrobe.selectedCloset[CateogryType.HEADWARE]!.count ?? 0
        //        let allSubCategories = numberOfSubcategoriesInTop + numberOfSubcategoriesInBottom + numberOfSubcategoriesInFootware + numberOfSubcategoriesInUnderClothing + numberOfSubcategoriesInAccessories + numberOfSubcategoriesInHeadware
        //
        //        itemsInArrayInDictionary["Categories"] = [
        //            //items category count
        //            ["Amount of Items in Top Category": String(numberOfItemsInTop)],
        //            ["Amount of Items in BOTTOMS Category": String(numberOfItemsInBottoms)],
        //            ["Amount of Items in FOOTWARE Category": String(numberOfItemsInFootware)],
        //            ["Amount of Items in UNDERCLOTHING Category": String(numberOfItemsInUnderclothing)],
        //            ["Amount of Items in ACCESSORIES Category": String(numberOfItemsInAccessories)],
        //            ["Amount of Items in HEADWARE Category": String(numberOfItemsInHeadware)]
        //        ]
        //
        //        itemsInArrayInDictionary["Categories"] = [
        //            //Sub categories count
        //            ["Amount of Sub Categories in Top Category": String(numberOfSubcategoriesInTop)],
        //            ["Amount of Sub Categories in BOTTOMS Category": String(numberOfSubcategoriesInBottom)],
        //            ["Amount of Sub Categories in FOOTWARE Category": String(numberOfSubcategoriesInFootware)],
        //            ["Amount of Sub Categories in UNDERCLOTHING Category": String(numberOfSubcategoriesInUnderClothing)],
        //            ["Amount of Sub Categories in ACCESSORIES Category": String(numberOfSubcategoriesInAccessories)],
        //            ["Amount of Sub Categories in HEADWARE Category": String(numberOfSubcategoriesInHeadware)]
        //        ]
        //
        //            itemsInArrayInDictionary["Feature Stats"] = [
        //                ["Amount of favorited Items": String(Users_Wardrobe.selectedClosetFavoritedItems.count)],
        //                ["Amount of recently worn Items": String(Users_Wardrobe.selectedClosetRecentWornItems.count)],
        //                ["Amount of trashed Items": String(Users_Wardrobe.selectedClosetTrashItems.count)]
        //        ]
        //
        //        itemsInArrayInDictionary["Closet"] = [
        //            ["Amount of Items in \(Users_Wardrobe.closetSelectionString)": String(Users_Wardrobe.getCountOfCloset())],
        //            ["Total Amount Of Sub-Categories": String(allSubCategories)]
        //        ]
        //
        //        self.keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)
        //    }
=======
        self.navigationController?.navigationBar.translucent = false
    }
    func setUpData(){
        //Category item count
        let numberOfItemsInTop = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.TOPS)
        let numberOfItemsInBottoms = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.BOTTOMS)
        let numberOfItemsInFootware = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.FOOTWARE)
        let numberOfItemsInUnderclothing = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.UNDERCLOTHING)
        let numberOfItemsInAccessories = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.ACCESSORIES)
        let numberOfItemsInHeadware = Users_Wardrobe.getCountOfAllItemsInCategory(CateogryType.HEADWARE)
        
        //Count of Subcategories
        let numberOfSubcategoriesInTop = Users_Wardrobe.selectedCloset[CateogryType.TOPS]!.count ?? 0
        let numberOfSubcategoriesInBottom = Users_Wardrobe.selectedCloset[CateogryType.BOTTOMS]!.count ?? 0
        let numberOfSubcategoriesInFootware = Users_Wardrobe.selectedCloset[CateogryType.FOOTWARE]!.count ?? 0
        let numberOfSubcategoriesInUnderClothing = Users_Wardrobe.selectedCloset[CateogryType.UNDERCLOTHING]!.count ?? 0
        let numberOfSubcategoriesInAccessories = Users_Wardrobe.selectedCloset[CateogryType.ACCESSORIES]!.count ?? 0
        let numberOfSubcategoriesInHeadware = Users_Wardrobe.selectedCloset[CateogryType.HEADWARE]!.count ?? 0
        let allSubCategories = numberOfSubcategoriesInTop + numberOfSubcategoriesInBottom + numberOfSubcategoriesInFootware + numberOfSubcategoriesInUnderClothing + numberOfSubcategoriesInAccessories + numberOfSubcategoriesInHeadware
        
        itemsInArrayInDictionary["Categories"] = [
            //items category count
            ["Amount of Items in Top Category": String(numberOfItemsInTop)],
            ["Amount of Items in BOTTOMS Category": String(numberOfItemsInBottoms)],
            ["Amount of Items in FOOTWARE Category": String(numberOfItemsInFootware)],
            ["Amount of Items in UNDERCLOTHING Category": String(numberOfItemsInUnderclothing)],
            ["Amount of Items in ACCESSORIES Category": String(numberOfItemsInAccessories)],
            ["Amount of Items in HEADWARE Category": String(numberOfItemsInHeadware)]
        ]
        
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
        
        itemsInArrayInDictionary["Closet"] = [
            ["Amount of Items in \(Users_Wardrobe.closetSelectionString)": String(Users_Wardrobe.getCountOfCloset())],
            ["Total Amount Of Sub-Categories": String(allSubCategories)]
        ]
        
        self.keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)
>>>>>>> MyFitZOld/master
    }
}


<<<<<<< HEAD
//MARK: -TableView Methods-MakeTableViewController Extension
extension PercentagesTableViewController:UIAlertViewDelegate{
    override func numberOfSections(in tableView: UITableView) -> Int {
        let count = itemsInArrayInDictionary.count
        return count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let key = self.keyOfSelectedArray[section]
        return (self.itemsInArrayInDictionary[key]?.count)!
    }//Returns Int for number of sections in tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: StatsTableVIewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.STATS_CELL) as! StatsTableVIewCell
=======

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
        let cell: StatsTableVIewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.STATS_CELL) as! StatsTableVIewCell
>>>>>>> MyFitZOld/master
        
        
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
        
<<<<<<< HEAD
        //        var arrayItemCell = self.itemsInArrayInDictionary.indexForKey("here")//Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        ////        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
        //            guard let
        cell.configure(name: name!, infoString: info!)
        
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete
=======
//        var arrayItemCell = self.itemsInArrayInDictionary.indexForKey("here")//Array(self.itemsInArrayInDictionary.values)[indexPath.row]
////        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
//            guard let 
            cell.configure(name: name!, infoString: info!)
        
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete
>>>>>>> MyFitZOld/master
        {
        }
        
        
    }//Editing to delete row
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
=======
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
>>>>>>> MyFitZOld/master
        return  self.keyOfSelectedArray[section]
        //String(path[PathType.PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
=======
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
>>>>>>> MyFitZOld/master
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }//Shows when a cell at row was selected
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
=======
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
           }//Shows when a cell at row was selected
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
>>>>>>> MyFitZOld/master
        return 200
    }//Xcode bug hack that lets cell autosize properly
}



//MARK: - UI-TrashTableViewController Extension
extension PercentagesTableViewController{
<<<<<<< HEAD
    @objc func animateAllButtons(){
=======
    func animateAllButtons(){
>>>>>>> MyFitZOld/master
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
<<<<<<< HEAD
    @objc func animateLogo(){
=======
    func animateLogo(){
>>>>>>> MyFitZOld/master
        //    logoCustomization(self.logoImage)
    }
}



//MARK: -Anylitics-TrashTableViewController Extension
<<<<<<< HEAD
//extension PercentagesTableViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//            
//            
//            let pageCount:Int? = defaults.returnIntValue("PERCENT_PAGE_COUNT")
//            
//            Answers.logContentView(withName: "Percent Content View",
//                contentType: "Percent View",
//                contentId: "MF12",
//                customAttributes: ["PERCENT_PAGE_COUNT": pageCount!
//                ])
//        })
//    }
//}
=======
extension PercentagesTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("PERCENT_PAGE_COUNT")
            
            Answers.logContentViewWithName("Percent Content View",
                contentType: "Percent View",
                contentId: "MF12",
                customAttributes: ["PERCENT_PAGE_COUNT": pageCount!
                ])
        })
    }
}
>>>>>>> MyFitZOld/master



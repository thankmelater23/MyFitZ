//
//  PercentagesTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/17/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation
import UIKit

class PercentagesTableViewController: UITableViewController {
    //MARK: - Variables
    @objc var itemsInArrayInDictionary = [String: [[String: String]]]()
    @objc var keyOfSelectedArray = [String]()
    //    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    //    var path: [String: String]! = [String: String]()
    
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        //log.info(#function)
        self.setUpTypes()
        self.view.backgroundColor = Cotton
        
        
        //        defaults.addAndSend("PERCENT_PAGE_COUNT")
        
        //        self.logPageView()
        
    }
    override func viewDidAppear(_ animated: Bool){
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        //log.warning("Recieved Memory Warning")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        defer{
            //log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == Segue.SEGUE_PERCENTAGE_TO_SELECTION{
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //TODO: Set these up to do some house work
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        return true
    }
    deinit{
        //log.info(#function)
        
    }
}


//MARK: -Action Methods
extension PercentagesTableViewController{
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_PERCENTAGE_TO_SELECTION, sender: self)
    }
}



//MARK: - Initializer Created Methods
extension PercentagesTableViewController{
    @objc func setUpTypes(){
        self.animateAllButtons()
        self.setUpData()
        
        
        self.setTitle()
        
    }//Sets up
    @objc func selection(){
        //        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!n
    }
    @objc func setTitle(){
        self.title = grabTitle("STATS", view: PathType.PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
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
    }
}


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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete
        {
        }
        
        
    }//Editing to delete row
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return  self.keyOfSelectedArray[section]
        //String(path[PathType.PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tableView.deselectRow(at: indexPath, animated: true)
        
    }//Shows when a cell at row was selected
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
}



//MARK: - UI-TrashTableViewController Extension
extension PercentagesTableViewController{
    @objc func animateAllButtons(){
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
    @objc func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
}



//MARK: -Anylitics-TrashTableViewController Extension
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



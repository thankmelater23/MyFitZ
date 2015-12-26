//
//  RecentlyWornTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/2/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import Crashlytics



//MARK: -RecentlyWornTableViewController Class
class RecentlyWornTableViewController: UITableViewController {
    //MARK: -Variables
    ///items in an Array holds the sub-categories of the items
    var arrayOfItems: [Item]! = [Item]()
    var pathToSend:[String: String] = [:]
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetUpTypes()
        self.view.backgroundColor = RedBunchedUpSilkSheet
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("RECENTLY_PAGE_COUNT")
        
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        
        if segue.identifier == SEGUE_RECENT_TO_SELECTION
        {
            
        }else if segue.identifier == SEGUE_RECENT_TO_DETAIL{
            let detailedViewController = segue.destinationViewController as! DetailedViewController
            let tempItem = returnItem(pathToSend)
            detailedViewController.itemOfObject = tempItem
            detailedViewController.path = pathToSend
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



//MARK: -Action Methods
extension RecentlyWornTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier("recentToSelection", sender: self)
    }
}



//MARK: - TableView Methods
extension RecentlyWornTableViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: RecentTableViewCell = tableView.dequeueReusableCellWithIdentifier(RECENTLY_CELL) as! RecentTableViewCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor.brownColor()
        }else{
            cell.backgroundColor     = UIColor.brownColor()
        }
        
        let item: Item            = arrayOfItems[indexPath.row] as Item!
        
        
        cell.setCell(item.image!, nameLabelText: item.model!, brandLabelText: item.brand!, row: indexPath.row, lastTimeWorn: item.lastTimeWorn!)
        
        return cell
    }
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        playSoundEffects(itemSelectSFX)
        self.pathToSend = self.arrayOfItems[indexPath.row].path
        performSegueWithIdentifier(SEGUE_RECENT_TO_DETAIL, sender: self)
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String("Recently Worn Items" + ": " + "\(self.arrayOfItems.count)")
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
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

                    Users_Wardrobe.setNewRecents(self.arrayOfItems)
                    
                    Users_Wardrobe.quickSave()
                    
                    self.tableView.reloadData()
                }
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
    }
    func customizeTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = RedBunchedUpSilkSheet
        self.tableView?.tintColor = LeatherTexture
        self.tableView.reloadData()
        //        self.tableView?.separatorColor = UIColor.blackColor()
        //        self.tableView.sectionIndexBackgroundColor = UIColor.purpleColor()
        
    }
}



//MARK: -Initializer  Created Methods
extension RecentlyWornTableViewController{
    func SetUpTypes() {
        self.arrayOfItems = Users_Wardrobe.populateRecentlyWornItems()
        
        self.animateAllButtons()
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "RECENYLY_WORN")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
        self.customizeTableView()
    }
}



//MARK: - UI-ModelTableViewController Extension
extension RecentlyWornTableViewController{
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



//MARK: -Anylitics-RecentlyWornTableViewController Extension
extension RecentlyWornTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("RECENTLY_PAGE_COUNT")
        
        Answers.logContentViewWithName("Recently Content View",
            contentType: "Recently View",
            contentId: "MF10",
            customAttributes: ["RECENTLY_PAGE_COUNT": pageCount!
            ])
        })
    }
}



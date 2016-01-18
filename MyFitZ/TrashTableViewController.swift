//
//  TrashTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/12/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import Crashlytics

class TrashTableViewController: UITableViewController {
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
        log.info(__FUNCTION__)
        self.SetUpTypes()
        self.view.backgroundColor = RedBunchedUpSilkSheet
        
        defaults.addAndSend("TRASH_PAGE_COUNT")
        
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        
        if segue.identifier == Segue.SEGUE_TRASH_TO_SELECTION
        {
            
            //        }else if segue.identifier == Segue.SEGUE_TRASH_TO_DETAIL{
            //            let detailedViewController = segue.destinationViewController as! DetailedViewController
            //            let tempItem = returnItem(pathToSend)
            //            detailedViewController.itemOfObject = tempItem
            //            detailedViewController.path = pathToSend
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
    }
    deinit{
        log.info(__FUNCTION__)
        
    }
}



//MARK: -Action Methods
extension TrashTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(Segue.SEGUE_TRASH_TO_SELECTION, sender: self)
    }
}



//MARK: - TableView Methods
extension TrashTableViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TrashTableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.TRASH_CELL) as! TrashTableViewCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor.blackColor()
        }else{
            cell.backgroundColor     = UIColor.blackColor()
        }
        
        let item: Item            = arrayOfItems[indexPath.row] as Item!
        
        //TODO: -Fix this cell to take date deleted add date deleted to item system
        cell.setCell(item.image!, nameLabelText: item.model!, brandLabelText: item.brand!, row: indexPath.row, dateDeleted: "xx-xx-xxxx")

        
        return cell
    }
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        playSoundEffects(itemSelectSFX)
        self.promptForRestoringItem(indexPath.row)
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String("Deleted Items" + ": " + "\(self.arrayOfItems.count)")
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
                let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete this item from the trash permanetly?", preferredStyle: .Alert)
                let act = UIAlertAction(title: "cancel", style: .Default){_ in}
                let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
                    
                    Users_Wardrobe.selectedClosetTrashItems.removeAtIndex(indexPath.row)
                    
                    Users_Wardrobe.quickSave()
                    
                    self.arrayOfItems.removeAtIndex(indexPath.row)
                    
                    self.tableView.reloadData()
                }
                
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
    }
    func promptForRestoringItem(index: Int){
        
        let alert = UIAlertController(title: "Restore Item", message:"Are You Sure You Want To Restore This Item?", preferredStyle: .Alert)
        let act = UIAlertAction(title: "cancel", style: .Default){_ in}
        let action = UIAlertAction(title: "Restore", style: .Destructive) { _ in
            self.restoreItem(index)
            
            Users_Wardrobe.selectedClosetTrashItems.removeAtIndex(index)
            
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addAction(act)
        
        self.presentViewController(alert, animated: true, completion: {})
    }
    func restoreItem(index: Int){
        let item = Users_Wardrobe.selectedClosetTrashItems[index]
        
        do{
            try Users_Wardrobe.save(item.category, funcSubCategory: item.subCategory, item: item)
        }catch ItemError.IncorrectSubCategory{
            
        }catch ItemError.missingModelString{
            
        }catch ItemError.addImage{
            
        }catch{
            
        }
        //TODO: -Segue after selected
//        self.performSegueWithIdentifier("TrashToDetail", sender: self)
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
extension TrashTableViewController{
    func SetUpTypes() {
        self.arrayOfItems = Users_Wardrobe.selectedClosetTrashItems
        
        self.animateAllButtons()
        
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Trash")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
        self.customizeTableView()
    }
    
}



//MARK: - UI-TrashTableViewController Extension
extension TrashTableViewController{
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
extension TrashTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("TRASH_PAGE_COUNT")
            
            Answers.logContentViewWithName("Trash Content View",
                contentType: "Trash View",
                contentId: "MF11",
                customAttributes: ["TRASH_PAGE_COUNT": pageCount!
                ])
        })
    }
}



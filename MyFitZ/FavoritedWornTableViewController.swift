//
//  FavoritedWornTableViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/2/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//


import UIKit
import Crashlytics



class FavoritedWornTableViewController: UITableViewController {
    //MARK: - Variables
    var arrayOfItems: [Item]! = [Item]()
    var pathToSend:[String: String] = [:]
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        self.SetUpTypes()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.addAndSend("FAVORITED_PAGE_COUNT")
        
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        
        if segue.identifier == SEGUE_FAVORITED_TO_SELECTION
        {
            
            
        }else if segue.identifier == SEGUE_FAVORITED_TO_DETAIL{
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



//MARK: - Action Methods
extension FavoritedWornTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        //TODO: -Maybe need to delete this most likeley
    }
    @IBAction func pressedBack(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(SEGUE_FAVORITED_TO_SELECTION, sender: self)
    }
}



//MARK: - TableView Methods
extension FavoritedWornTableViewController{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier(MODEL_CELL) as! ModelCustomCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }else{
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }
        
        let item: Item            = arrayOfItems[indexPath.row] as Item!
        
        //TODO: -Change brand to subacategory instead
        cell.setCell(item.image!, brandLabelText: item.brand!, modelLabelText: item.model!, lastTimeWornText: item.lastTimeWorn!, favorited: item.favorited)
        
        return cell
    }
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        playSoundEffects(itemSelectSFX)
        self.pathToSend = self.arrayOfItems[indexPath.row].path
        performSegueWithIdentifier(SEGUE_FAVORITED_TO_DETAIL, sender: self)
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String("FAVORITES" + ": " + "\(self.arrayOfItems.count)")
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
                    Users_Wardrobe.selectedCloset[self.path[PATHTYPE_CATEGORY_STRING]!]![self.path[PATHTYPE_SUBCATEGORY_STRING]!]! = self.arrayOfItems
                    Users_Wardrobe.quickSave()
                    
                    self.tableView.reloadData()
                }
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
    }
}



//MARK: - Initializers Created Methods
extension FavoritedWornTableViewController{
    func SetUpTypes() {
        self.arrayOfItems = Users_Wardrobe.populateFavoriteItems()
        
        self.animateAllButtons()
        
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: "Favorited Items")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
        
    }
}



//MARK: - UI-ModelTableViewController Extension
extension FavoritedWornTableViewController{
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



//MARK: -Anylitics-FavoritedWornTableViewController Extension
extension FavoritedWornTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let pageCount:Int? = defaults.returnIntValue("FAVORITED_PAGE_COUNT")
        
        Answers.logContentViewWithName("Favorited Content View",
            contentType: "Favorited View",
            contentId: "MF9",
            customAttributes: ["FAVORITED_PAGE_COUNT": pageCount!
            ])
        })
    }
}



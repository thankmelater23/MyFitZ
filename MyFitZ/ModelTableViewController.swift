//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
<<<<<<< HEAD
//import Crashlytics
import CoreData
=======
import Crashlytics
>>>>>>> MyFitZOld/master



//MARK: - ModelTableViewController Class
<<<<<<< HEAD
class ModelTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    //MARK: -Variables
    ///items in an Array holds the sub-categories of the items
    @objc var arrayOfItems: [Item]! = [Item]()
    ///Dictionary path to item
    @objc var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    //Core Data
    @objc let context = DataBaseController.getContext()
    //    var items: [Item]? = nil
    @objc var items: [Item]? = nil
    
    @objc var fetchRequestController: NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    
    @objc func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let categorySorter = NSSortDescriptor(key: "category", ascending: true)
        let nameSorter = NSSortDescriptor(key: "model", ascending: true)
        let favoritesSorter = NSSortDescriptor(key: "isFavorite", ascending: true)
        fetchRequest.sortDescriptors = [nameSorter, favoritesSorter, categorySorter]
        return fetchRequest
    }
    
    @objc func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        fetchRequestController = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchRequestController
    }
=======
class ModelTableViewController: UITableViewController {
    //MARK: -Variables
    ///items in an Array holds the sub-categories of the items
    var arrayOfItems: [Item]! = [Item]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
>>>>>>> MyFitZOld/master
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.info(#function)
<<<<<<< HEAD
        self.setUpTypes()
=======
        self.SetUpTypes()
>>>>>>> MyFitZOld/master
        self.view.backgroundColor = SiliverSilkSheet
        
        
        defaults.addAndSend("MODEL_PAGE_COUNT")
        
<<<<<<< HEAD
        //        self.logPageView()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //        defer{
        //            log.verbose("Segue transfer: \(segue.identifier)")
        //        }
        //
        //
        //        if segue.identifier == Segue.SEGUE_MODEL_TO_DETAIL
        //        {
        //            let index = indexToSend
        //            path[PathType.PATHTYPE_INDEX_STRING] = String(index!)
        //
        //            let detailController = segue.destination as! DetailedViewController
        //
        //            if let index = index{
        //
        //                detailController.itemOfObject = self.arrayOfItems[index] as Item!
        //
        //                detailController.path = self.path
        //            }else{
        //                assertionFailure("This shouldn't happen")
        //            }
        //
        //        }else if segue.identifier == Segue.SEGUE_MODEL_TO_MAKE{
        //            let makeTableViewController = segue.destination as! MakeTableViewController
        //
        //            makeTableViewController.path = self.path
        //        }else if segue.identifier == Segue.SEGUE_MODEL_TO_CREATION{
        //
        //        }else if segue.identifier == Segue.SEGUE_MODEL_TO_CREATION{
        //            let createItemViewController: CreateItemViewController! = segue.destination as! CreateItemViewController
        //            createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_MODEL
        //        }
=======
        self.logPageView()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        
        if segue.identifier == Segue.SEGUE_MODEL_TO_DETAIL
        {
            let index = indexToSend
            path[PathType.PATHTYPE_INDEX_STRING] = String(index!)
            
            let detailController = segue.destinationViewController as! DetailedViewController
            
            if let index = index{
                
                detailController.itemOfObject = self.arrayOfItems[index] as Item!
                
                detailController.path = self.path
            }else{
                assertionFailure("This shouldn't happen")
            }
            
        }else if segue.identifier == Segue.SEGUE_MODEL_TO_MAKE{
            let makeTableViewController = segue.destinationViewController as! MakeTableViewController
            
            makeTableViewController.path = self.path
        }else if segue.identifier == Segue.SEGUE_MODEL_TO_CREATION{
            
        }else if segue.identifier == Segue.SEGUE_MODEL_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_MODEL
        }
>>>>>>> MyFitZOld/master
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - TableView Methods
extension ModelTableViewController{
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchRequestController.sections?[section].numberOfObjects
        return count ?? 0
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MODEL_CELL) as! ModelCustomCell
=======
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier.MODEL_CELL) as! ModelCustomCell
>>>>>>> MyFitZOld/master
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }else{
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }
        
<<<<<<< HEAD
        let item = fetchRequestController.object(at: indexPath) as! Item
        let image = UIImage(named: "blank image")!
        
        //TODO: -Change brand to subacategory instead
        let lastTimeWornString = item.lastTimeWorn?.description ?? "NA"
//        let itemImage = UIImage(data:item.image?) ?? image
        let fav = item.isFavorite
        cell.setCell(image,
                     brandLabelText: item.brand ?? "N/A",
                     modelLabelText: item.model ?? "N/A",
                     lastTimeWornText: lastTimeWornString ?? "N/A",
                     favorited: fav)
        
        return cell
    }
    override func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        indexToSend = indexPath.row
        playSoundEffects(itemSelectSFX)
//        performSegue(withIdentifier: Segue.SEGUE_MODEL_TO_DETAIL, sender: self)
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String()//String(path[PathType.PATHTYPE_SUBCATEGORY_STRING]! + ": " + "\(self.arrayOfItems.count)")
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
=======
        let item: Item            = arrayOfItems[indexPath.row] as Item!
        
        //TODO: -Change brand to subacategory instead
        cell.setCell(item.image!, brandLabelText: item.brand!, modelLabelText: item.model!, lastTimeWornText: item.lastTimeWorn!, favorited: item.favorited)
        
        return cell
    }
    override func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        indexToSend = indexPath.row
        playSoundEffects(itemSelectSFX)
        performSegueWithIdentifier(Segue.SEGUE_MODEL_TO_DETAIL, sender: self)
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return String(path[PathType.PATHTYPE_SUBCATEGORY_STRING]! + ": " + "\(self.arrayOfItems.count)")
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
>>>>>>> MyFitZOld/master
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
    ///Makes tableview cells auto resize properly for some reason, it won't without calling this function
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .alert)
            let act = UIAlertAction(title: "cancel", style: .default){_ in}
            let action = UIAlertAction(title: "Delete", style: .destructive) { _ in
                
                let item = self.fetchRequestController.object(at: (indexPath))
                self.context.delete(item as! NSManagedObject)
                
                do{
                    try self.context.save()
                }catch{
                    log.error("Deleted item failed")
                }
                
                self.tableView.reloadData()
            }
            
            alert.addAction(action)
            alert.addAction(act)
            self.present(alert, animated: true, completion: {})
        }
=======
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
                    let itemToDelete = self.arrayOfItems[indexPath.row]
                    
                    Users_Wardrobe.deleteItem(self.path[PathType.PATHTYPE_CATEGORY_STRING]!, funcSubCategory: self.path[PathType.PATHTYPE_SUBCATEGORY_STRING]!, item: itemToDelete)
                    
                    self.arrayOfItems.removeAtIndex(indexPath.row)
                    
                    self.tableView.reloadData()
                }
                alert.addAction(action)
                alert.addAction(act)
                self.presentViewController(alert, animated: true, completion: {})
            }
>>>>>>> MyFitZOld/master
    }
}


<<<<<<< HEAD
//MARK: - Actions-ModelTableViewController Extension
extension ModelTableViewController{
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_MODEL_TO_MAKE, sender: self)
=======

//MARK: - Actions-ModelTableViewController Extension
extension ModelTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(Segue.SEGUE_MODEL_TO_MAKE, sender: self)
>>>>>>> MyFitZOld/master
    }
}



//MARK: - Initializer-ModelTableViewController Extension
extension ModelTableViewController{
<<<<<<< HEAD
    @objc func setUpTypes() {
//        self.animateAllButtons()
        
        fetchRequestController = getFRC()
        fetchRequestController.delegate = self
        
        do{
            try fetchRequestController.performFetch()
        }catch{
            log.error("Fetch Failed")
        }
        self.tableView.reloadData()
        //        self.setTitle()
=======
    func SetUpTypes() {
        self.animateAllButtons()
        
        self.arrayOfItems = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]![path[PathType.PATHTYPE_SUBCATEGORY_STRING]!]!
        
        self.setTitle()
>>>>>>> MyFitZOld/master
        
        
    }
}



//MARK: - UI-ModelTableViewController Extension
<<<<<<< HEAD
//extension ModelTableViewController{
//    func animateAllButtons(){
//        //    self.animateSearchButton()
//        //    self.animateStarButton()
//        //    self.animateHamperButton()
//        //    self.animateSearchButton()
//        //    self.animatePictureLabels()
//        //    self.animatePictureImages()
//        //    self.animateNumberLabels()
//        //    self.animateTrashButton()
//        //    self.animateLogo()
//        //        self.animateViews()
//
//    }
//    func animateLogo(){
//        //    logoCustomization(self.logoImage)
//    }
//    func setTitle(){
////        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PathType.PATHTYPE_SUBCATEGORY_STRING)
////        if self.title == MY_CLOSET{
////            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
////        }else if self.title == MY_WANTS_CLOSET{
////            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
////        }
////        self.navigationController?.navigationBar.isTranslucent = false
////    }
//}
//}


//MARK: -Anylitics-MakeTableViewController Extension
//extension ModelTableViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {
//
//
//        let pageCount:Int? = defaults.returnIntValue("MODEL_PAGE_COUNT")
//        
//        Answers.logContentView(withName: "Sub-Category Content View",
//            contentType: "Sub-Category View",
//            contentId: "MF4",
//            customAttributes: ["MODEL_PAGE_COUNT": pageCount!
//            ])
//        })
//    }
//}
=======
extension ModelTableViewController{
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
    func setTitle(){
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PathType.PATHTYPE_SUBCATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.translucent = false
    }
}



//MARK: -Anylitics-MakeTableViewController Extension
extension ModelTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
        
        
        let pageCount:Int? = defaults.returnIntValue("MODEL_PAGE_COUNT")
        
        Answers.logContentViewWithName("Sub-Category Content View",
            contentType: "Sub-Category View",
            contentId: "MF4",
            customAttributes: ["MODEL_PAGE_COUNT": pageCount!
            ])
        })
    }
}
>>>>>>> MyFitZOld/master

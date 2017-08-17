//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import CoreData
//import Crashlytics
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

=======
import Crashlytics
>>>>>>> MyFitZOld/master

//MARK: -MakeTableViewController Class
class MakeTableViewController: UITableViewController{
    //MARK: -Outlets
    @IBOutlet  weak var TypeBarButtonLabel: UIBarButtonItem!
    
    //MARK: - Variables
    ///items in a dictionary of arrays holds the categories of the items
<<<<<<< HEAD
    @objc var keyOfSelectedArray = [String]()
    @objc var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    @objc var path: [String: String]! = [String: String]()
    //Core Data
    @objc let context = DataBaseController.getContext()
    //    var items: [Item]? = nil
    @objc var wardrobe: Wardrobe? = nil
    @objc var items: [Item]? = nil
    
    @objc var fetchRequestController: NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    @objc func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
//        let categorySorter = NSSortDescriptor(key: "category", ascending: true)
//        let nameSorter = NSSortDescriptor(key: "model", ascending: true)
//        let favoritesSorter = NSSortDescriptor(key: "isFavorite", ascending: true)
//        fetchRequest.sortDescriptors = [nameSorter, favoritesSorter, categorySorter]
        let wardrobePredicate = NSPredicate(format: "self.wardrobe = %@", wardrobe!)
//        let categoryPredicates = 
        
        
        return fetchRequest
    }
    
    @objc func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        fetchRequestController = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchRequestController
    }
=======
    var itemsInArrayInDictionary: [String: [Item]]! = [String: [Item]]()
    var array = [[Item]]()
    var keyOfSelectedArray = [String]()
    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
>>>>>>> MyFitZOld/master
    
    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.info(#function)
<<<<<<< HEAD
        self.view.backgroundColor = SiliverSilkSheet
        self.initializeFetchedResultsController()
        
        self.setUpTypes()
        //        self.setUPSearchBar()
        
        //        defaults.addAndSend("MAKE_PAGE_COUNT")
        
        //self.logPageView()
        tableView.delegate = self
        tableView.dataSource = self
//        self.setUpSearchBar()
        
    }
    override func viewDidAppear(_ animated: Bool){
=======
        itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]
        self.view.backgroundColor = SiliverSilkSheet
        
        self.setUpTypes()
        
        
        defaults.addAndSend("MAKE_PAGE_COUNT")
        
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
        defer{
            log.debug("Segue transfer: \(String(describing: segue.identifier))")
=======
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
>>>>>>> MyFitZOld/master
        }
        if segue.identifier == Segue.SEGUE_MAKE_TO_MODEL
        {
            //            let index = self.tableView.indexPathForSelectedRow
            
<<<<<<< HEAD
            let modelController = segue.destination as! ModelTableViewController
            modelController.path = self.path
        }else if segue.identifier == Segue.SEGUE_MAKE_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destination as! CreateItemViewController
            createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_MAKE
        }else if segue.identifier == Segue.SEGUE_MAKE_TO_SELECTION{
            let selectionViewController = segue.destination as! SelectionViewController
            selectionViewController.wardrobe = self.wardrobe
=======
            let modelController = segue.destinationViewController as! ModelTableViewController
            modelController.path = self.path
        }else if segue.identifier == Segue.SEGUE_MAKE_TO_CREATION{
            let createItemViewController: CreateItemViewController! = segue.destinationViewController as! CreateItemViewController
            createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_MAKE
>>>>>>> MyFitZOld/master
        }
    }
    deinit{
        log.info(#function)
<<<<<<< HEAD
=======
        
>>>>>>> MyFitZOld/master
    }
}



<<<<<<< HEAD

//MARK: - Core Data
extension MakeTableViewController: NSFetchedResultsControllerDelegate{
    @objc func initializeFetchedResultsController() {
        fetchRequestController = getFRC()
        fetchRequestController.delegate = self
        
        do{
            try fetchRequestController.performFetch()
        }catch{
            log.error("Fetch Failed")
        }
        
        
        //User
        //        let fetchRequestUser:NSFetchRequest<User> = User.fetchRequest()
        //        do{
        //            let fetchedUsers = try DataBaseController.getContext().fetch(fetchRequestUser)
        //            log.debug("Users Count: \(fetchedUsers.count)")
        //            if fetchedUsers.count < 1{
        //                user = NSEntityDescription.insertNewObject(forEntityName: myfitzEntities.Item, into: context) as! Item
        //                user?.name = "User1"
        ////                user?.wardrobe = Wardrobe()
        ////                user?.wardrobe?.items = []
        ////
        //                DataBaseController.saveContext()
        //            }else{
        //                user = fetchedUsers.first!
        //            }
        //
        //        }catch{
        //            log.error("Fetch Failed")
        //        }
        //
        //        let fetchRequestWardrobe:NSFetchRequest<Item> = Item.fetchRequest()
        //        do{
        //            let fetchedWardrobes = try DataBaseController.getContext().fetch(fetchRequestWardrobe)
        //            log.debug("Search Results Count: \(fetchedWardrobes.count)")
        //
        //            if fetchedWardrobes.count < 1{
        //                let wardrobe = NSEntityDescription.insertNewObject(forEntityName: myfitzEntities.wardrobe, into: context) as! Wardrobe
        //                user?.wardrobe = wardrobe
        //                user?.wardrobe?.isBoy = true
        //                user?.wardrobe?.items = []
        //            }else{
        //                user?.wardrobe = fetchedWardrobes.first
        //            }
        //
        //        }catch{
        //            log.error("Fetch Failed")
        //        }
        //
        
        //        let item = NSEntityDescription.insertNewObject(forEntityName: myfitzEntities.item, into: context) as! Item
        //
        //
        //        item.brand = "Brand"
        //        item.category = "Category"
        //        item.subCategory = "Sub-Category"
        //        item.index = 25
        //
        //        user?.wardrobe?.addToItems(item)
        //
        //        do{
        //            try context.save()
        //            log.verbose("User: \(user)\nWardrobe: \(user?.wardrobe!)\nItems Count: \(user?.wardrobe?.items?.count)\nItems: \(user?.wardrobe?.items)")
        //        }catch{
        //            log.error("item saved failed")
        //        }
        //        //        let fetchRequestItems:NSFetchRequest<Item> = Item.fetchRequest()
        //        log.debug(user?.wardrobe?.items)
        tableView.reloadData()
        //
        //
        //        do{
        //            items = try context.fetch(Item.fetchRequest())
        //            log.debug(items)
        //            log.debug("Items Count: \(items.count)")
        //        }catch{
        //            log.error("Fetch Failed")
        //        }
        //
        //
        //
        //
        //
        //
        //
        //        let fetchRequestItem:NSFetchRequest<Item> = Item.fetchRequest()
        //        do{
        //            let searchResults = try DataBaseController.getContext().fetch(fetchRequestItem)
        //            log.debug("Search Results Count: \(searchResults.count)")
        //
        //            for result in searchResults {
        //                log.debug("\(result.category!) - \(result.subCategory!) favorited: \(result.isFavorite)")
        //            }
        //        }catch{
        //            log.error("Fetch Failed")
        //        }
    }
}

//MARK: - Action-MakeTableViewController Extension
extension MakeTableViewController{
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        // playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_MAKE_TO_SELECTION, sender: self)
=======
//MARK: - Action-MakeTableViewController Extension
extension MakeTableViewController{
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegueWithIdentifier(Segue.SEGUE_MAKE_TO_SELECTION, sender: self)
>>>>>>> MyFitZOld/master
    }
}



//MARK: - Initializer Created Methods
extension MakeTableViewController{
<<<<<<< HEAD
    @objc func setUpTypes(){
        self.animateAllButtons()
        
        // self.itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]
=======
    func setUpTypes(){
        self.animateAllButtons()
        
        self.itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]
>>>>>>> MyFitZOld/master
        
        self.setTitle()
        
    }//Sets up
<<<<<<< HEAD
    @objc func selection(){
        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!
    }
    @objc func setTitle(){
        //self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PathType.PATHTYPE_CATEGORY_STRING)
=======
    func selection(){
        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!
    }
    func setTitle(){
        self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PathType.PATHTYPE_CATEGORY_STRING)
>>>>>>> MyFitZOld/master
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
<<<<<<< HEAD
        self.navigationController?.navigationBar.isTranslucent = false
=======
        self.navigationController?.navigationBar.translucent = false
>>>>>>> MyFitZOld/master
    }
}



//MARK: -TableView Methods-MakeTableViewController Extension
extension MakeTableViewController:UIAlertViewDelegate{
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = fetchRequestController.sections?[section].numberOfObjects
        return count!
    }//Returns Int for number of sections in tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: MakeCustomCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MAKE_CELL) as? MakeCustomCell)!
=======
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = itemsInArrayInDictionary.count
        return count
    }//Returns Int for number of sections in tableView
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: MakeCustomCell = (tableView.dequeueReusableCellWithIdentifier(CellIdentifier.MAKE_CELL) as? MakeCustomCell)!
>>>>>>> MyFitZOld/master
        
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }else{
            cell.backgroundColor = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }
        
<<<<<<< HEAD
        let itemCell = fetchRequestController.object(at: indexPath) as! Item
        let image = UIImage(named: "blank image")
        cell.setCell(image!, makeLabelText: itemCell.brand ?? "N/A", numberOfItemsText: 0)
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
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
=======
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
            let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
            let act = UIAlertAction(title: "cancel", style: .Default){_ in}
            let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
                let subCategoryToDelete = Array(self.itemsInArrayInDictionary.keys)[indexPath.row] as String//Gets key for dictionary selected
                
                Users_Wardrobe.deleteAt(self.path[PathType.PATHTYPE_CATEGORY_STRING]!, funcSubCategory: subCategoryToDelete)
                //
                self.itemsInArrayInDictionary.removeValueForKey(subCategoryToDelete)
                //
                //                Users_Wardrobe.selectedCloset[self.path[PathType.PATHTYPE_CATEGORY_STRING]!] = self.itemsInArrayInDictionary
                //                Users_Wardrobe.quickSave()
>>>>>>> MyFitZOld/master
                
                self.tableView.reloadData()
            }
            
            alert.addAction(action)
            alert.addAction(act)
<<<<<<< HEAD
            self.present(alert, animated: true, completion: {})
=======
            self.presentViewController(alert, animated: true, completion: {})
>>>>>>> MyFitZOld/master
        }
        
        
    }//Editing to delete row
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        //TODO: - Fix Me
        return String()//String(path[PathType.PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
=======
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return String(path[PathType.PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
>>>>>>> MyFitZOld/master
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tableView.deselectRow(at: indexPath, animated: true)
        //        let arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        //        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
        //        path[PathType.PATHTYPE_SUBCATEGORY_STRING] = keyOfSelectedArray
        
        playSoundEffects(itemSelectSFX)
        
        //        performSegue(withIdentifier: Segue.SEGUE_MAKE_TO_MODEL, sender: self)
    }//Shows when a cell at row was selected
    //    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 200
    //    }//Xcode bug hack that lets cell autosize properly
=======
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //        let arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
        path[PathType.PATHTYPE_SUBCATEGORY_STRING] = keyOfSelectedArray
        
        playSoundEffects(itemSelectSFX)
        
        performSegueWithIdentifier(Segue.SEGUE_MAKE_TO_MODEL, sender: self)
    }//Shows when a cell at row was selected
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
>>>>>>> MyFitZOld/master
}



//MARK: - UI-ModelTableViewController Extension
extension MakeTableViewController{
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


<<<<<<< HEAD
//MARK: - Search Bar
extension MakeTableViewController: UISearchBarDelegate{
        fileprivate func setUPSearchBar(){
            let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 65))

            searchBar.showsScopeBar = true
            searchBar.scopeButtonTitles = [myfitzEntities.user, myfitzEntities.wardrobe, myfitzEntities.item]
            searchBar.selectedScopeButtonIndex = 0

            searchBar.delegate = self as UISearchBarDelegate

            self.tableView.tableFooterView = searchBar
        }

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    guard !searchText.isEmpty else {
//        item = //Fetch All objects
        tableView.reloadData()
        return
    }
    
    //array = CoreDataManager.fetchObj(selectedScopeIdx: searchBar.selectedScopeButtonIndex, targetText:searchText)
    tableView.reloadData()
    print(searchText)
}

        func searchBarShouldEndEditting(_ searchBar: UISearchBar)->Bool{
            searchBar.resignFirstResponder()
            return true
        }
}



//MARK: -Anylitics-MakeTableViewController Extension
//extension MakeTableViewController{
//    func logPageView(){
//        GlobalBackgroundQueue.async(execute: {


//            let pageCount:Int? = defaults.returnIntValue("MAKE_PAGE_COUNT")

//            Answers.logContentView(withName: "Category Content View",
//                contentType: "Category View",
//                contentId: "MF3",
//                customAttributes: ["MAKE_PAGE_COUNT": pageCount!
//                ])
//        })
//    }
//}

=======

//MARK: -Anylitics-MakeTableViewController Extension
extension MakeTableViewController{
    func logPageView(){
        dispatch_async(GlobalBackgroundQueue, {
            
            
            let pageCount:Int? = defaults.returnIntValue("MAKE_PAGE_COUNT")
            
            Answers.logContentViewWithName("Category Content View",
                contentType: "Category View",
                contentId: "MF3",
                customAttributes: ["MAKE_PAGE_COUNT": pageCount!
                ])
        })
    }
}
 
>>>>>>> MyFitZOld/master

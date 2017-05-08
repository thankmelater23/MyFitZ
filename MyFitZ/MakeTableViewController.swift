//
//  MakeTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
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


//MARK: -MakeTableViewController Class
class MakeTableViewController: UITableViewController{
    //MARK: -Outlets
    @IBOutlet  weak var TypeBarButtonLabel: UIBarButtonItem!
    
    //MARK: - Variables
    ///items in a dictionary of arrays holds the categories of the items
    var keyOfSelectedArray = [String]()
    var indexReference: [String: Int] = [:]
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    //Core Data
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var itemsInArrayInDictionary: [Item] = []
//    lazy var fetchedResultsController: NSFetchedResultsController<Item> = {
//        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
//        
//        let fechedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//        fetchedResultController.delegate = self
//        
//        return fetchedR
//}

    
    //MARK: -View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.info(#function)
        self.view.backgroundColor = SiliverSilkSheet
        self.initializeFetchedResultsController()
        
        self.setUpTypes()
        
        
        //        defaults.addAndSend("MAKE_PAGE_COUNT")
        
        //self.logPageView()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool){
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        log.warning("Recieved Memory Warning")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        defer{
            log.verbose("Segue transfer: \(String(describing: segue.identifier))")
        }
        if segue.identifier == Segue.SEGUE_MAKE_TO_MODEL
        {
            //            let index = self.tableView.indexPathForSelectedRow
            
            // let modelController = segue.destination as! ModelTableViewController
            //modelController.path = self.path
        }else if segue.identifier == Segue.SEGUE_MAKE_TO_CREATION{
            //let createItemViewController: CreateItemViewController! = segue.destination as! CreateItemViewController
            //createItemViewController.lastVCSegue = Segue.SEGUE_CREATION_TO_MAKE
        }
    }
    deinit{
        log.info(#function)
        
    }
}



//MARK: - Core Data
extension MakeTableViewController{
    
    func initializeFetchedResultsController() {
        let context = appDelegate.persistentContainer.viewContext
        do{
            itemsInArrayInDictionary = try context.fetch(Item.fetchRequest())
        }catch{
            log.error("Fetch Failed")
        }
//        //var fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController
//        do{
//            let userRequest = try context.fetch(User.fetchRequest())
//            let wardrobeRequest = try context.fetch(Wardrobe.fetchRequest())
//            let itemsRequest = try context.fetch(Item.fetchRequest())
//            
//            print(userRequest, wardrobeRequest, itemsRequest)
//            let subCatSort = NSSortDescriptor(key: "item.category", ascending: true)
//            let catSort = NSSortDescriptor(key: "subCategory", ascending: true)
//            //request.sortDescriptors = [subCatSort, catSort]
//        }catch{
//            log.error("Fetch request failed")
//        }
        //let moc = self.context
        //fetchedResultsController = fetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        //fetchedResultsController.delegate = self
        
        //do {
        //    try fetchedResultsController.performFetch()
        //} catch {
        //    fatalError("Failed to initialize FetchedResultsController: \(error)")
        //}
    }
}

//MARK: - Action-MakeTableViewController Extension
extension MakeTableViewController{
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        // playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_MAKE_TO_SELECTION, sender: self)
    }
}



//MARK: - Initializer Created Methods
extension MakeTableViewController{
    func setUpTypes(){
        self.animateAllButtons()
        
        // self.itemsInArrayInDictionary = Users_Wardrobe.selectedCloset[path[PathType.PATHTYPE_CATEGORY_STRING]!]
        
        self.setTitle()
        
    }//Sets up
    func selection(){
        TypeBarButtonLabel.title = path[PathType.PATHTYPE_CATEGORY_STRING]!
    }
    func setTitle(){
        //self.title = grabTitle(Users_Wardrobe.closetSelectionString, view: PathType.PATHTYPE_CATEGORY_STRING)
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        self.navigationController?.navigationBar.isTranslucent = false
    }
}



//MARK: -TableView Methods-MakeTableViewController Extension
extension MakeTableViewController:UIAlertViewDelegate{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let count = itemsInArrayInDictionary.count
        return count
    }//Returns Int for number of sections in tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: MakeCustomCell = (tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MAKE_CELL) as? MakeCustomCell)!
        
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }else{
            cell.backgroundColor = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MAKE)!)
        }
//        
//        var arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
//        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
//        if arrayItemCell.count > 1{
//            arrayItemCell = arrayItemCell.sorted(by: {$0.category > $1.category})
//        }
        
//        if let availableSubCategoryItem = arrayItemCell.first{
//            cell.setCell(UIImage(), makeLabelText: availableSubCategoryItem.subCategory!, numberOfItemsText: arrayItemCell.count)
//        }else{
//            let image = UIImage(named: BLANK_IMAGE_STRING)
//            cell.setCell(image!, makeLabelText: keyOfSelectedArray, numberOfItemsText: arrayItemCell.count)
//        }
        let itemCell = itemsInArrayInDictionary[indexPath.row]
        let image = UIImage(named: "blank image")
        cell.setCell(image!, makeLabelText: itemCell.brand!, numberOfItemsText: 0)
        return cell
    }//Returns a tableView cell at a specific row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        let context = appDelegate.persistentContainer.viewContext
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .alert)
            let act = UIAlertAction(title: "cancel", style: .default){_ in}
            let action = UIAlertAction(title: "Delete", style: .destructive) { _ in
                
                let item = self.itemsInArrayInDictionary[indexPath.row]
                context.delete(item)
                
                do{
                    try context.save()
                }catch{
                    log.error("Deleted item failed")
                }
//                let subCategoryToDelete = Array(self.itemsInArrayInDictionary.keys)[indexPath.row] as String//Gets key for dictionary selected
                
                //Users_Wardrobe.deleteAt(self.path[PathType.PATHTYPE_CATEGORY_STRING]!, funcSubCategory: subCategoryToDelete)
                //
//                self.itemsInArrayInDictionary.removeValue(forKey: subCategoryToDelete)
                //
                //                Users_Wardrobe.selectedCloset[self.path[PathType.PATHTYPE_CATEGORY_STRING]!] = self.itemsInArrayInDictionary
                //                Users_Wardrobe.quickSave()
                
                self.tableView.reloadData()
            }
            
            alert.addAction(action)
            alert.addAction(act)
            self.present(alert, animated: true, completion: {})
        }
        
        
    }//Editing to delete row
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        //TODO: - Fix Me
        return String()//String(path[PathType.PATHTYPE_CATEGORY_STRING]! + ": " + "\(self.itemsInArrayInDictionary.count)")
        
    }//Category name is shown in the title header
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tableView.deselectRow(at: indexPath, animated: true)
        //        let arrayItemCell: [Item] = Array(self.itemsInArrayInDictionary.values)[indexPath.row]
//        let keyOfSelectedArray = Array(self.itemsInArrayInDictionary.keys)[indexPath.row]
        
//        path[PathType.PATHTYPE_SUBCATEGORY_STRING] = keyOfSelectedArray
        
        playSoundEffects(itemSelectSFX)
        
        performSegue(withIdentifier: Segue.SEGUE_MAKE_TO_MODEL, sender: self)
    }//Shows when a cell at row was selected
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }//Xcode bug hack that lets cell autosize properly
}



//MARK: - UI-ModelTableViewController Extension
extension MakeTableViewController{
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


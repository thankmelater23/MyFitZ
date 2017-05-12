//
//  ModelTableViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit
//import Crashlytics
import CoreData



//MARK: - ModelTableViewController Class
class ModelTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    //MARK: -Variables
    ///items in an Array holds the sub-categories of the items
    var arrayOfItems: [Item]! = [Item]()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    var indexToSend:Int?
    
    //Core Data
    let context = DataBaseController.getContext()
    //    var items: [Item]? = nil
    var user: User? = nil
    
    var fetchRequestController: NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let nameSorter = NSSortDescriptor(key: "model", ascending: true)
        let favoritesSorter = NSSortDescriptor(key: "isFavorite", ascending: true)
        fetchRequest.sortDescriptors = [nameSorter, favoritesSorter]
        return fetchRequest
    }
    
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        fetchRequestController = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchRequestController
    }
    
    
    //MARK: - View Methods
    override func viewDidLoad(){
        super.viewDidLoad()
        log.info(#function)
        self.SetUpTypes()
        self.view.backgroundColor = SiliverSilkSheet
        
        
        defaults.addAndSend("MODEL_PAGE_COUNT")
        
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = fetchRequestController.sections?[section].numberOfObjects
        return count ?? 0
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ModelCustomCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.MODEL_CELL) as! ModelCustomCell
        
        if indexPath.row % 2 == 0//If even number make this color
        {
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }else{
            cell.backgroundColor     = UIColor(patternImage: UIImage(named: CELL_BACKGROUND_IMAGE_MODEL)!)
        }
        
        let item = fetchRequestController.object(at: indexPath) as! Item
        let image = UIImage(named: "blank image")
        
        //TODO: -Change brand to subacategory instead
        cell.setCell(UIImage(data:item.image! as Data) ?? image!, brandLabelText: item.brand!, modelLabelText: item.model!, lastTimeWornText: "Date", favorited: item.isFavorite)
        
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
        view.tintColor = LeatherTexture
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = Gold
    }
    ///Makes tableview cells auto resize properly for some reason, it won't without calling this function
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
    }
}


//MARK: - Actions-ModelTableViewController Extension
extension ModelTableViewController{
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        playSoundEffects(backSFX)
        performSegue(withIdentifier: Segue.SEGUE_MODEL_TO_MAKE, sender: self)
    }
}



//MARK: - Initializer-ModelTableViewController Extension
extension ModelTableViewController{
    func SetUpTypes() {
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
        
        
    }
}



//MARK: - UI-ModelTableViewController Extension
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

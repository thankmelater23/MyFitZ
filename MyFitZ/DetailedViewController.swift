//  DetailedViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit
import CRToast
import DKChainableAnimationKit

//MARK: - DetailedViewController Class
class DetailedViewController: UIViewController{
    
    //View IBOutlets
    @IBOutlet var tableView: UITableView!
    ///Views main image of the Item being presented
    @IBOutlet var itemImage: UIImageView!
    @IBAction func deleteItem() {
        let alert = UIAlertController(title: "Alert!", message:"Are you sure you want to delete", preferredStyle: .Alert)
        let act = UIAlertAction(title: "cancel", style: .Default){_ in}
        let action = UIAlertAction(title: "Delete", style: .Destructive) { _ in
            
            gamesWardrobe.deleteItem(self.itemOfObject.category, funcSubCategory: self.itemOfObject.subCategory, item: self.itemOfObject)
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addAction(act)
        self.presentViewController(alert, animated: true, completion: {})
        
    }
    @IBOutlet weak var wearButton: UIButton!
    @IBAction func wear() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        let newDate = dateFormatter.stringFromDate((NSDate()))
        
        
        
        let dicOfOptions = [
            kCRToastTextKey: "Wear date UPDATED-From: " + self.itemOfObject.lastTimeWorn + "-To : " + newDate,
            kCRToastTextAlignmentKey : "NSTextAlignmentCenter",
            kCRToastBackgroundColorKey : UIColor.blueColor(),
            kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
            kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
            kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
            kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"]
        
        
        CRToastManager.showNotificationWithOptions(dicOfOptions, completionBlock: {
            wait(w_status: 1)//Put something valid
            self.itemOfObject.lastTimeWorn = newDate
            gamesWardrobe.quickSave()
        })
        self.tableView.reloadData()
    }
    //View Variables
    ///Item selected
    var itemOfObject: Item! = Item()
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    //View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        print(self.itemOfObject)
        
        // Do view setup here.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_DETAIL_TO_MODEL
        {
            let modelTableViewController = segue.destinationViewController as! ModelTableViewController
            
            modelTableViewController.path = self.path
        }else if segue.identifier == SEGUE_DETAIL_TO_CREATION{
            let createItemViewController = segue.destinationViewController as! CreateItemViewController
            
        }else if segue.identifier == SEGUE_DETAIL_TO_EDIT{
            let editItemViewController = segue.destinationViewController as! EditItemViewController
            editItemViewController.path = self.path
            editItemViewController.viewItem = self.itemOfObject
            editItemViewController.previousItem = self.itemOfObject
        }
    }
}



//MARK: - TableView Methods
extension DetailedViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2//Create constant
    }// Return the number of sections.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return 10
        }
            
        else if (section == 1){
            return 8
        }
            
        else{
            print("Something did not go right")
            return 0
        }
    }// Return the number of rows in the section.
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }//Random number returned to fix xcode bug
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            return createCellFromRequiredDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }else{
            return createCellFromOptionalDictionary(row: indexPath.row) as DoubleLabelTableViewCell
        }
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Basic"
        }else{
            return "Misc"
        }
    }//Puts a text label in the header of the specified section
    func createCellFromRequiredDictionary(row row: Int) -> DoubleLabelTableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        let cal = NSCalendar.currentCalendar()
        let unit:NSCalendarUnit = .Day
        
        switch row {
        case 0 :
            keyAndValue = ITEM_BRAND_STRING
            if let value = self.itemOfObject.brand{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 1 :
            keyAndValue = ITEM_MODEL_STRING
            if let value = self.itemOfObject.model{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 2 :
            keyAndValue = ITEM_CATEGORY_STRING
            if let value = self.itemOfObject.category{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 3 :
            keyAndValue = ITEM_SUBCATEGORY_STRING
            if let value = self.itemOfObject.subCategory{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 4 :
            keyAndValue = ITEM_PRICE_STRING
            guard let value = itemOfObject.price else{
                cell.configure(name: keyAndValue, infoString: "N/A")
                break
            }
            cell.configure(name: keyAndValue, infoString: "N/A")
        case 5 :
            keyAndValue = ITEM_FAVORITED_STRING
            let bool = self.itemOfObject.favorited
            var value = "No"
            if bool == true{
                value = "YES"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: value)
            }
        case 6 :
            keyAndValue = ITEM_ISTHISNEW_STRING
            let bool = self.itemOfObject.isThisNew
            var value = "No"
            if bool == true{
                value = "YES"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: value)
            }
        case 7 :
            keyAndValue = ITEM_TIMESWORN_STRING
            guard let value = itemOfObject.timesWorn else{
                cell.configure(name: keyAndValue, infoString: "N/A")
                break
            }
            cell.configure(name: keyAndValue, infoString: "N/A")
        case 8 :
            keyAndValue = ITEM_LASTTIMEWORN_STRING
            
            let lastDate = dateFormatter.dateFromString(self.itemOfObject.lastTimeWorn)
            if(lastDate != nil){
                let today = NSDate()
                
                let components = cal.components(unit, fromDate: lastDate!, toDate: today, options: .WrapComponents)
                if let value = self.itemOfObject.lastTimeWorn{
                    switch(components.day){
                    case 0...500:
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.day)) + " Days ago")
                    case 500...1000:
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.month)) + " Months ago")
                    case 1000..<1000:
                        cell.configure(name: keyAndValue, infoString:value + "-" + String((components.year)) + " Years ago")
                    default: break
                        assertionFailure("This shouldint happen")
                    }
                }
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 9 :
            keyAndValue = ITEM_INDEX_STRING
            let number = self.itemOfObject.index
            if number != nil{
                let value = "\(number)"
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
            
        default:
            assertionFailure("Row does not exist to create cell of required type. ROW: \(row)")
        }
        
        return cell as DoubleLabelTableViewCell
    }
    ///Returns cell of Optional dictionary
    func createCellFromOptionalDictionary(row row: Int) -> DoubleLabelTableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(DOUBLE_LABEL_CELL) as! DoubleLabelTableViewCell
        
        var keyAndValue: String!
        
        switch row {
        case 0 :
            keyAndValue = ITEM_DATEPURCHASERD_STRING
            if let value = self.itemOfObject.datePurchased{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 1 :
            keyAndValue = ITEM_COLOR_STRING
            if let value = self.itemOfObject.color{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 2 :
            keyAndValue = ITEM_SECONDARYCOLOR_STRING
            if let value = self.itemOfObject.secondaryColor{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 3 :
            keyAndValue = ITEM_THIRDCOLOR_STRING
            if let value = self.itemOfObject.thirdColor{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 4 :
            keyAndValue = ITEM_ITEMDESCRIPTION_STRING
            if let value = self.itemOfObject.itemDescription{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 5 :
            keyAndValue = ITEM_DATERELEASED_STRING
            if let value = self.itemOfObject.dateReleased{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 6 :
            keyAndValue = ITEM_RETAILPRICE_STRING
            if let value = self.itemOfObject.retailPrice{
                cell.configure(name: keyAndValue, infoString: value.description)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 7 :
            keyAndValue = ITEM_CONDITION_STRING
            if let value = self.itemOfObject.condition{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        case 8 :
            keyAndValue = ITEM_PRIMARYMATERIAL_STRING
            if let value = self.itemOfObject.color{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 8 :
            keyAndValue = ITEM_SECONDAY_MATERIAL_STRING
            if let value = self.itemOfObject.secondaryMaterial{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 8 :
            keyAndValue = ITEM_STORELOCATION_STRING
            if let value = self.itemOfObject.storeLocationURL{
                cell.configure(name: keyAndValue, infoString: value)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
        case 8 :
            keyAndValue = ITEM_ISTHISNEW_STRING
            if let value = self.itemOfObject.isThisNew{
                cell.configure(name: keyAndValue, infoString: value.description)
            }else{
                cell.configure(name: keyAndValue, infoString: "N/A")
            }
            
        default:
            assertionFailure("Row does not exist to create cell of optional type. ROW: \(row)")
        }
        
        return cell as DoubleLabelTableViewCell
    }
}



//MARK: - Developer Created Methods
extension DetailedViewController{
    func setUp(){
        self.title = grabTitle(gamesWardrobe.closetSelectionString, view: "Detail")
        if self.title == MY_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_CLOSET_BAR_COLOR
        }else if self.title == MY_WANTS_CLOSET{
            self.navigationController?.navigationBar.tintColor = MY_WANTS_CLOSET_BAR_COLOR
        }
        
        itemImage.image = itemOfObject.image
        self.customizeTableView()
        self.wearButton.animation.makeScale(0.0).moveX(-20).moveY(-20).makeBorderWidth(5.0).makeBorderColor(UIColor.blackColor()).animate(1.5)
        self.wearButton.animation.makeScale(1.0).animate(0.5).moveX(20).moveY(20).makeBorderColor(UIColor.whiteColor()).animate(3.0)
        self.wearButton.animation.makeScale(1.0).animateWithCompletion(1.0, {
            //Play Sound
        })
        
        
    }//Sets up view
    func customizeTableView(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        //self.tableView.backgroundColor = UIColor.blueColor()
        //self.tableView.style = UITableViewStyle.Grouped
        //self.tableView.tintColor = UIColor.blueColor()
    }
}



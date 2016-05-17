//
//  Wardrobe.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 5/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit
import MRProgress
import SVProgressHUD
import CRToast
import Async


//MARK: -Wardrobe Class
///Holds all Item's and Fit's and two closet types.  The system revolves around this class
class Wardrobe:NSObject, NSCoding{
    //MARK: -Variables
    //MARK: -Arrays
    var brandCollection: [String] = [String]()
    //    var brandCategoryCollection: [String: [String]] = [String: [String]]()
    var sizes:[String] = [String]()
    var closetItemCountID: Int! = 0
    var wishListItemCountID: Int! = 0
    //TODO: -These need to be deleted
    //!!: -Deleting crashes the archive system
    var recentWornItems: [Item] = [Item]()
    var favoritedItems: [Item] = [Item]()
    
    var myClosetTrash: [Item] = [Item]()
    var myWishListTrash: [Item] = [Item]()
    
    private var myClosetRecentWornItems: [[String: String]] = [[String: String]]()
    private var myClosetFavoritedItems: [[String: String]] = [[String: String]]()
    
    private var myWishListRecentWornItems: [[String: String]] = [[String: String]]()
    private var myWishListFavoritedItems: [[String: String]] = [[String: String]]()
    
    var selectedClosetRecentWornItems: [[String: String]]{
        get{
            //            log.verbose("Getting Recents")
            if closetSelectionString == MY_CLOSET{
                
                return myClosetRecentWornItems
            }else if closetSelectionString == MY_WANTS_CLOSET{
                
                return myWishListRecentWornItems
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                return myClosetRecentWornItems
            }
        }
        
        set{
            //            log.verbose("Setting to Closet" + self.closetSelectionString)
            if closetSelectionString == MY_CLOSET{
                myClosetRecentWornItems = newValue
            }else if closetSelectionString == MY_WANTS_CLOSET{
                myWishListRecentWornItems = newValue
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                myClosetRecentWornItems = newValue
            }
        }
    }
    var selectedClosetFavoritedItems: [[String: String]]{
        get{
            //            log.verbose("Getting Favorites")
            if closetSelectionString == MY_CLOSET{
                return myClosetFavoritedItems
            }else if closetSelectionString == MY_WANTS_CLOSET{
                return myWishListFavoritedItems
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                return myClosetFavoritedItems
            }
        }
        
        set{
            //            log.verbose("Setting Favorites")
            if closetSelectionString == MY_CLOSET{
                myClosetFavoritedItems = newValue
            }else if closetSelectionString == MY_WANTS_CLOSET{
                myWishListFavoritedItems = newValue
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                myClosetFavoritedItems = newValue
            }
        }
    }
    var selectedClosetTrashItems: [Item]{
        get{
            //            log.verbose("Getting Trash")
            if closetSelectionString == MY_CLOSET{
                return myClosetTrash
            }else if closetSelectionString == MY_WANTS_CLOSET{
                return myWishListTrash
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                return myClosetTrash
            }
        }
        
        set{
            //            log.verbose("Setting Trash")
            if closetSelectionString == MY_CLOSET{
                myClosetTrash = newValue
            }else if closetSelectionString == MY_WANTS_CLOSET{
                myWishListTrash = newValue
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                myClosetTrash = newValue
            }
        }
    }
    
    deinit{
        log.info(__FUNCTION__)
    }
    
    //MARK: -Closets
    /// Users Personal Closet
    var myCloset = CLOSET_TYPE()
    /// Users Wishlist Inventory
    var myWantsCloset: CLOSET_TYPE = CLOSET_TYPE()
    /// Represents what closet the user is in
    var closetSelectionString: String! = MY_CLOSET
    var selectedCloset: CLOSET_TYPE{
        get{
            
            if closetSelectionString == MY_CLOSET{
                return myCloset
            }else if closetSelectionString == MY_WANTS_CLOSET{
                return myWantsCloset
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                return myCloset
            }
        }
        
        set{
            if closetSelectionString == MY_CLOSET{
                myCloset = newValue
            }else if closetSelectionString == MY_WANTS_CLOSET{
                myWantsCloset = newValue
            }else{
                assertionFailure("Incorect closet selection string: \(closetSelectionString)")
                myCloset = newValue
            }
        }
    }
    
    ///Dictionary path to item
    var path: [String: String]! = [String: String]()
    
    //MARK: -Arrays not added yet
    //  var allItems = [Item]()
    //  var savedFits      = [Fit]()
    //  var closetTotalPrice:Double! = 0
    //  var numberOfItemsWorn: Int! = 0
    //  var percentOfItemsWorn: Double! = 0
    //  var numberOfItems: Int! = 0
    //  var favoritedItems = [Item]()
    //  var favoritedFits  = [Fit]()
    //  var recentWornFits = [Fit]()
    
    
    
    //MARK: -Methods
    //MARK: -Initializers
    override var description: String {
        return String()
    }
    
    required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
        super.init()
        log.info("Decoding Wardrobe Object")
        self.myCloset = decoder.decodeObjectForKey("1") as! CLOSET_TYPE!
        self.myWantsCloset = decoder.decodeObjectForKey("2") as! CLOSET_TYPE!
        self.closetSelectionString = decoder.decodeObjectForKey("3") as! String! ?? String()
        self.path = decoder.decodeObjectForKey("4") as! [String: String]! ?? [String: String]()
        self.brandCollection = decoder.decodeObjectForKey("5") as! [String]! ?? [String]()
        self.recentWornItems = decoder.decodeObjectForKey("6") as! [Item]! ?? [Item]()
        self.favoritedItems = decoder.decodeObjectForKey("7") as! [Item]! ?? [Item]()
        self.sizes = decoder.decodeObjectForKey("8") as! [String]! ?? [String]()
        self.closetItemCountID = decoder.decodeObjectForKey("9") as! Int? ?? Int()
        self.wishListItemCountID = decoder.decodeObjectForKey("10") as! Int? ?? Int()
        
        self.myClosetRecentWornItems = decoder.decodeObjectForKey("11") as! [[String: String]]! ?? [[String: String]]()
        self.myWishListRecentWornItems = decoder.decodeObjectForKey("12") as! [[String: String]]! ?? [[String: String]]()
        self.myClosetFavoritedItems = decoder.decodeObjectForKey("13") as! [[String: String]]! ?? [[String: String]]()
        self.myWishListFavoritedItems = decoder.decodeObjectForKey("14") as! [[String: String]]! ?? [[String: String]]()
        self.myClosetTrash = decoder.decodeObjectForKey("15") as! [Item]! ?? [Item]()
        self.myWishListTrash = decoder.decodeObjectForKey("16") as! [Item]! ?? [Item]()
        //self.selectedCloset = CLOSET_TYPE()
        
        log.verbose(closetSelectionString)
        log.verbose(path)
        log.verbose(myCloset)
        log.verbose(myWantsCloset)
        
    }//Decode data in class
    func encodeWithCoder(coder: NSCoder){
        log.info("Encoding Wardrobe Object")
        coder.encodeObject(self.myCloset, forKey: "1")
        coder.encodeObject(self.myWantsCloset, forKey: "2")
        coder.encodeObject(self.closetSelectionString, forKey: "3")
        coder.encodeObject(self.path, forKey: "4")
        coder.encodeObject(self.brandCollection, forKey: "5")
        coder.encodeObject(self.recentWornItems, forKey: "6")
        coder.encodeObject(self.favoritedItems, forKey: "7")
        coder.encodeObject(self.sizes, forKey: "8")
        coder.encodeObject(self.closetItemCountID, forKey: "9")
        coder.encodeObject(self.wishListItemCountID, forKey: "10")
        coder.encodeObject(self.myClosetRecentWornItems, forKey: "11")
        coder.encodeObject(self.myWishListRecentWornItems, forKey: "12")
        coder.encodeObject(self.myClosetFavoritedItems, forKey: "13")
        coder.encodeObject(self.myWishListFavoritedItems, forKey: "14")
        coder.encodeObject(self.myClosetTrash, forKey: "15")
        coder.encodeObject(self.myWishListTrash, forKey: "16")
    }//Encodes data in class
    /**
    Initializes the Wardrobe class with a basic setup, and no items
    
    - returns: No return
    */
    override init(){
        log.info(__FUNCTION__)
        super.init()
        log.info("Wardrobe Object Initializing")
        
        for key in CATEGORY_PICKER_OPTIONS{
            let categoryString = "DEFAULT"
            myCloset.updateValue([categoryString: [Item]()], forKey: key)
            myWantsCloset.updateValue([categoryString: [Item]()], forKey: key)
        }
        
        closetSelectionString = MY_CLOSET
        
    }
}



//MARK: -File System-Wardrobe Extension
extension Wardrobe{
    /**
     Gets the path to app directory
     
     - returns: URL to path of directory
     */
    func documentsDirectory() -> NSURL {
        log.info(__FUNCTION__)
        log.info("Getting NSURL from file manager")
        let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        log.info("Returning \(documentsFolderPath) url")
        return documentsFolderPath
    }
    /**
     Gets URL path from directory
     
     - parameter filename: String URL path
     
     - returns: NSURL of path to save to
     */
    func fileInDocumentsDirectory(filename: String) -> NSURL {
        log.info(__FUNCTION__)
        return documentsDirectory().URLByAppendingPathComponent(filename)
    }
    /**
     Saves wardrobe file and shows saving prompt
     
     - parameter filePath:       URL path to save to
     - parameter wardrobeToSave: Wardrobe object to save to URL path
     */
    func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
        log.info(__FUNCTION__)
        log.info("Wardrobe save started")
        var success = false
        //!!: -Clear containers for testing(debugging code)
        //        self.clearAllContainers()
        
        
        dispatch_async(GlobalMainQueue, {
            
            SVProgressHUD.show()
            
            let toastOptions = [kCRToastTextKey: "File Saving", kCRToastTextAlignmentKey : "NSTextAlignmentCenter",
                kCRToastBackgroundColorKey : UIColor.greenColor(),
                kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
                kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
                kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
                kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"]
            
            
            CRToastManager .showNotificationWithOptions(toastOptions, completionBlock: {
                dispatch_async(GlobalWardrobeSerial, {
                    success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
                    log.info("Finished Saving")
                    log.info("Success = \(success)")
                    let numOfItemsToSave = 3.0
                    let timeTillExecuted = (numOfItemsToSave * 0.10)
                    let now = dispatch_time(DISPATCH_TIME_NOW, Int64(timeTillExecuted * Double(NSEC_PER_SEC)))
                    vibrate()
                    
                    dispatch_async(GlobalMainQueue, {
                        SVProgressHUD.showSuccessWithStatus("Saved")
                        
                        //Run block after x amount of time
                        dispatch_after(now, GlobalMainQueue , {
                            log.info("Progress Label Removed")
                            log.info("File  Saved Successfully \n saved items: " + String(numOfItemsToSave) + "\nTime till save is checked: " + String(timeTillExecuted))
                            
                            //Dismis Progress hud in main que
                            dispatch_async(GlobalMainQueue, {SVProgressHUD.dismiss()})
                        })
                    })
                })
            })
        })
    }
    /**
     Loads Wardrobe of object through NSKeyArchiver
     
     - parameter filePath: URL path to saved wardrobe
     
     - returns: return wardrobe
     */
    func loadArchivedObject(filePath: NSURL) -> Wardrobe? {
        log.info(__FUNCTION__)
        log.info("Loaing Wardrobe Object")
        if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
            log.info("Returning previous created wardrobe from file")
            return wardrobe
        }else{
            log.info("New Wardrobe Created")
            let newWardrobe = Wardrobe()
            self.saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
            return newWardrobe
        }
    }
    /**
     Gets wardrobe object from loadArchiveObject method
     
     - returns: Wardrobe from file directory
     */
    func loadAndCreateCloset() -> Wardrobe{
        log.info(__FUNCTION__)
        log.info("Loading Object from file")
        let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        return loadArchivedObject(filePath)!
    }
    /**
     Save item at the location of FuncCategory/FuncSubCategory
     
     - parameter funcCategory:    Cateogry of file
     - parameter funcSubCategory: Sub-Cateogry of file
     - parameter item:            Item to save
     */
    func save(funcCategory:String, funcSubCategory:String, item: Item)throws{
        log.info(__FUNCTION__)
        log.info("Saving Wardrobe Object")
        if funcSubCategory.isEmpty == true{throw ItemError.IncorrectSubCategory}
        
        //Checks if new SubCategory is new
        let keysOfCategory = Array(selectedCloset[funcCategory]!.keys)
        let isKeyNew = keysOfCategory.contains(funcSubCategory)
        
        item.category = funcCategory
        item.subCategory = funcSubCategory
        
        //Creates a subcategory if none exist by that name
        if !isKeyNew{
            self.selectedCloset[funcCategory]!.updateValue([Item](), forKey: funcSubCategory)
            log.info("\(funcSubCategory) is not in subcategories array, \(funcSubCategory) is now added to the subcategory array")
        }
        
        //Sets image to blank if none exist
        if (item.image == nil){
            item.image = UIImage(named: BLANK_IMAGE_STRING)
        }
        
        //Checks to see if model value is empty
        if item.model.isEmpty != true{//Appends item to subCategory else throws
            self.selectedCloset[funcCategory]![funcSubCategory]!.append(item)
            
            //Update brandCollection
            updateBrandCollectiion(item.brand)
            
            log.info("Item Saved: \(item) \nTo: \(funcCategory)/\(funcSubCategory)")
        }else{throw ItemError.missingModelString}
        
        //Puts item in favoirtes if elgible
        
        self.sort(funcCategory, funcSubCategory: funcSubCategory)
        
        //!!: -This is here because when edit button is pressed and item is saved is causing some issues so have to reorganize the containers
        //        self.clearAllContainersAndPopulate()
        
        self.ItemFavorited(item)
        self.checkItemWorn(item)
        
        //Saves Wardrobe
        self.quickSave()
        
        //        if funcSubCategory.isEmpty == true{throw ItemError.IncorrectSubCategory}
        //
        //        item.category = funcCategory
        //        item.subCategory = funcSubCategory
        //
        //        //Sets image to blank if none exist
        //        if (item.image == nil){
        //            item.image = UIImage(named: BLANK_IMAGE_STRING)
        //        }
        //
        //        //Checks to see if model value is empty
        //        if item.model.isEmpty != true{//Appends item to subCategory else throws
        //            self.selectedCloset[funcCategory]![funcSubCategory]!.append(item)
        //            log.info("Item Saved: \(item) \nTo: \(funcCategory)/\(funcSubCategory)")
        //        }else{throw ItemError.missingModelString}
        //
        //
        //        self.saveItem(item)
        
    }
    
    func saveItem(myItem: Item){
        log.info(__FUNCTION__)
        log.info("Saving Item Object: \(myItem.model)" )
        self.newSubCategoryCheck(myItem)
        
        //Update brandCollection
        self.updateBrandCollectiion(myItem.brand)
        
        
        //Puts item in favoirtes if elgible
        self.selectedCloset[myItem.category]![myItem.subCategory]!.append(myItem)
        
        self.sort(myItem.category, funcSubCategory: myItem.subCategory)
        
        myItem.populatePath(self.closetSelectionString)
        
        self.ItemFavorited(myItem)
        self.checkItemWorn(myItem)
        
        //Saves Wardrobe
        self.quickSave()
    }
    
    func newSubCategoryCheck(item: Item){
        log.info(__FUNCTION__)
        log.info("Checking if \(item.subCategory) exist in previously created subcategories")
        //Checks if new SubCategory is new
        let keysOfCategory = Array(self.selectedCloset[item.category]!.keys)
        let isKeyNew = keysOfCategory.contains(item.subCategory)
        
        //Creates a subcategory if none exist by that name
        if !isKeyNew{
            self.selectedCloset[item.category]!.updateValue([Item](), forKey: item.subCategory)
            log.info("\(item.subCategory) is not in subcategories array, \(item.subCategory) is now added to the subcategory array")
        }
    }
    /**
     Plays SFX, gets file path to save to, than save Wardrobe object to archive
     */
    func quickSave(){
        log.info(__FUNCTION__)
        log.info("Quick saved called")
        playSoundEffects(saveSFX)
        
        
        let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        
        saveObjectToArchived(pathOfFile.path!, wardrobeToSave: self)
    }
}



//MARK: -Counter Methods-Wardrobe Extension
extension Wardrobe{
    /**
     Returns an ID number that has not been given yet and than increments for the next item to get an ID number for an item in the closet
     
     - returns: New ID number
     */
    func countClosetUp()->Int{
        log.info(__FUNCTION__)
        defer{
            closetItemCountID! += 1
        }
        if closetItemCountID == nil{
            closetItemCountID = 0
        }
        
        log.info("Closet count ID current value: \(closetItemCountID)")
        return closetItemCountID!
    }
    /**
     Returns an ID number that has not been given yet and than increments for the next item to get an ID number for an item in the wish listch
     
     - returns: New ID number
     */
    func countWishlistDown()->Int{
        log.info(__FUNCTION__)
        defer{
            wishListItemCountID! -= 1
        }
        
        if wishListItemCountID == nil || wishListItemCountID == 0{
            wishListItemCountID = 100000
        }
        log.info("Wish list count ID current value: \(wishListItemCountID)")
        return wishListItemCountID!
    }
    
    /**
     Get the number of items in MyCloset
     
     - returns: number of items in MyCloset
     */
    private func getsCountOfMyCloset()-> Int{
        log.info(__FUNCTION__)
        log.info("Getting count of closet")
        var sum = 0
        for (_, value) in myCloset{
            for (_, value) in value{
                for _ in value{
                    sum++
                }
            }
        }
        log.info("Closet Count: \(sum)")
        return sum
    }
    /**
     Get the number of items in Wishlist
     
     - returns: number of items in Wishlist
     */
    private func getsCountOfMyWishList()-> Int{
        log.info(__FUNCTION__)
        log.info("Getting count of Wish List")
        var sum = 0
        for (_, value) in myWantsCloset{
            for (_, value) in value{
                for _ in value{
                    sum++
                }
            }
        }
        log.info("Wish List Count: \(sum)")
        return sum
    }
    
    ///Returns count of allt current closet items
    func getCountOfCloset()->Int{
        log.info(__FUNCTION__)
        if self.closetSelectionString == MY_CLOSET{
            return self.getsCountOfMyCloset()
        }else if self.closetSelectionString == MY_WANTS_CLOSET{
            return self.getsCountOfMyWishList()
        }else{
            return 0
        }
    }
    /**
     Get count of subCategories in key of Category
     
     - parameter funcCategory: Category Key
     
     - returns: Number of sumCategories
     */
    func getCountOfAllItemsInCategory(funcCategory: String)->Int{
        log.info(__FUNCTION__)
        log.info("Getting Count of all items in \(funcCategory)")
        var sum = 0
        for (_, value) in selectedCloset[funcCategory]!{
            sum += value.count
        }
        log.info("\(funcCategory) Count: \(sum)")
        return sum
    }
    /**
     Gets count of number of items in Subcategory
     
     - parameter funcCategory:    Category Key
     - parameter funcSubCategory: SubCategory Key
     
     - returns: Number of items in array of subcategory
     */
    func getCountOfSubCategories(funcCategory: String, funcSubCategory: String)->Int{
        log.info(__FUNCTION__)
        log.info("Getting Count of all items in \(funcSubCategory)")
        let count = selectedCloset[funcCategory]![funcSubCategory]!.count
        log.info("\(funcSubCategory) count: \(count)")
        return count
    }
}



//MARK: -General-Wardrobe Extension
extension Wardrobe{
    private func sort(funcCategory:String, funcSubCategory:String){
        log.info(__FUNCTION__)
        log.info("Sorting \(funcCategory)/\(funcSubCategory)")
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        let unSortedArray = self.selectedCloset[funcCategory]![funcSubCategory]!
        let sorted = unSortedArray.sort({
            $0.lastTimeWorn.returnDaysInDate() < $1.lastTimeWorn.returnDaysInDate()
        })
        
        var sum = 0
        
        //Sets new index for item within array and populate paths
        for value in sorted{
            value.index = sum
            value.populatePath(self.closetSelectionString)
            value.path[PathType.PATHTYPE_INDEX_STRING] = String(value.index)
            sum++
        }
        
        //Make replace old array with new sorted array
        self.selectedCloset[funcCategory]![funcSubCategory]! = sorted
        log.info("Sorting \(funcCategory)/\(funcSubCategory) sorted")
    }
    /**
     Gets value from Category, sort value, return value to be used in tableView sorted
     
     - parameter funcCategory: Category of selected closet
     
     - returns: Array of an array of Items thats sorted
     */
    func returnCategorySorted(funcCategory:String)->[[Item]]{
        log.info(__FUNCTION__)
        var unSorted:[[Item]]! = [[Item]]()
        
        for (_, value) in self.selectedCloset[funcCategory]!{
            unSorted.append(value)
        }
        
        let sorted = unSorted.sort({
            $0.first!.subCategory < $1.first!.subCategory
        })
        return sorted
    }
    /**
     Sorts subcats by subcategory name, but isn't working because if item is not availabe then it will crash
     
     - parameter category: Category Key string
     
     - returns: sorted array of subCategories
     */
    func sort(category: String)->[[Item]]{
        log.info(__FUNCTION__)
        //        //Gets subcategory
        //        let tempArray = self.selectedCloset[category]!
        //
        //        //Gets key from subcategory value
        //        let keyOfSelectedArray = Array(tempArray.keys)
        //
        //        var array = [[Item]]()
        //
        //        if keyOfSelectedArray.count > 1{
        //            array = Array(tempArray.values)
        //
        //            array.first?.first?.category
        //
        //            array = array.sort({
        //                $0.first!.subCategory < $1.first!.subCategory})
        //        }
        //
        //        var index = 0
        //
        //        for value in array{
        //            if value.first!.subCategory == keyOfSelectedArray[index]{
        //                selectedCloset[category]![keyOfSelectedArray[index]] = value
        //            }
        //            index++
        //        }
        //
        //        return array
        //    }
        return [[Item]]()
    }
}



//MARK: -Wardrobe Modification-Wardrobe Extension
extension Wardrobe{
    //MARK: -Return functions
    /**
    Gets value of subcategories of a category
    
    - parameter funcCategory: Category key
    
    - returns: A dictionary of array of array of Items:[String: [Item]]
    */
    func returnDictionaryOfCategory(funcCategory: String)-> [String: [Item]]{
        log.info(__FUNCTION__)
        let dictionaryOfArray:[String: [Item]] = selectedCloset[funcCategory]!
        
        return dictionaryOfArray
    }
    /**
     Gets array of keys for category subcategories
     
     - parameter funcCategory: Category key
     
     - returns: returns an array of keys*[String]
     */
    func returnArrayOfKeysOfCategory(funcCategory: String)->[String]{
        log.info(__FUNCTION__)
        let keys:[String] = Array(selectedCloset[funcCategory]!.keys)
        
        return keys
    }
    /**
     Gets array of values for category subcategories
     
     - parameter funcCategory: Category key
     
     - returns: A dictionary of arrays of Items: [String: [Item]
     */
    func returnArrayOfValuesOfCategory(funcCategory: String)->[String: [Item]]{
        log.info(__FUNCTION__)
        let values:[String: [Item]] = selectedCloset[funcCategory]!
        
        return values
    }
    /**
     Gets array of Items from keys of Category/SubCategory
     
     - parameter funcCategory:    Category key
     - parameter funcSubCategory: SubCategory key
     
     - returns: return an array of Items: [Item]
     */
    func returnArrayOfItems(funcCategory: String, funcSubCategory: String)->[Item]{
        let array:[Item] = selectedCloset[funcCategory]![funcSubCategory]!
        
        return array
    }
    
    //MARK: -Delete Functions
    /**
    Deletes item from Category/SubCategory/(Matching Item), plays SFX, checks if item is a favorite adds to favoritedArray if it is remove it if it was and now it isn't; then saves Wardrobe
    
    - parameter funcCategory:    Category Key
    - parameter funcSubCategory: Sub-Category Key
    - parameter item:            Item to be matched than deleted
    */
    func deleteItem(funcCategory: String, funcSubCategory: String, item: Item){//Deletes item
        log.info(__FUNCTION__)
        log.info("deleting item \(item.model)")
        playSoundEffects(deleteSFX)
        
        let array = self.selectedCloset[funcCategory]![funcSubCategory]!
        var num = 0
        for index in array{
            if index.id == item.id{
                self.removeItemFromAllContainters(item.path)
                self.selectedCloset[funcCategory]![funcSubCategory]!.removeAtIndex(num)
                break
            }
            num++
        }
        
        self.sort(funcCategory, funcSubCategory: funcSubCategory)
        self.quickSave()
    }
    /**
     Deletes item from Category/SubCategory/(Matching Item), plays SFX, checks if item is a favorite adds to favoritedArray if it is remove it if it was and now it isn't; then saves Wardrobe
     
     - parameter funcCategory:    Category Key
     - parameter funcSubCategory: Sub-Category Key
     - parameter item:            Item to be matched than deleted
     */
    func deleteItemWithNoSave(funcCategory: String, funcSubCategory: String, item: Item){//Deletes item
        log.info(__FUNCTION__)
        playSoundEffects(deleteSFX)
        
        let array = self.selectedCloset[funcCategory]![funcSubCategory]!
        
        var num = 0
        
        for index in array{
            if index.id == item.id{
                self.removeItemFromAllContainters(item.path)
                self.selectedCloset[funcCategory]![funcSubCategory]!.removeAtIndex(num)
                break
            }else{
                num++
            }
        }
        
        self.sort(funcCategory, funcSubCategory: funcSubCategory)
        
    }
    /**
     Deletes array:[Item] at Category/Sub-Category, plays SFX, than save
     
     - parameter funcCategory:    Category Key
     - parameter funcSubCategory: Sub-Category Key
     */
    func deleteAt(funcCategory: String, funcSubCategory: String){//Deletes subCateogry row
        log.info(__FUNCTION__)
        playSoundEffects(deleteSFX)
        
        for item in Users_Wardrobe.selectedCloset[funcCategory]![funcSubCategory]!{
            self.removeItemFromAllContainters(item.path)
        }
        
        selectedCloset[funcCategory]!.removeValueForKey(funcSubCategory)
        
        quickSave()
    }
    /**
     Deletes subcategory of category, plays SFX, than save
     
     - parameter funcCategory: Category Key
     - parameter row:          Sub-Category Key
     */
    func deleteAt(funcCategory: String, row: Int){//Deletes category row
        log.info(__FUNCTION__)
        playSoundEffects(deleteSFX)
        
        var array = Array(selectedCloset[funcCategory]!.keys)
        
        let key = array[row]
        
        for item in selectedCloset[funcCategory]![key]!{
            self.removeItemFromAllContainters(item.path)
        }
        
        selectedCloset[funcCategory]?.removeValueForKey(key)
        
        self.sort(funcCategory, funcSubCategory: key)
        
        quickSave()
    }
    ///Removes the item path from all feature containers if it exists there then sends it to the trash
    func removeItemFromAllContainters(path: [String: String]){
        log.info(__FUNCTION__)
        log.info("Removing item from all containers")
        self.removeFromFavoriteList(path)
        self.removeFromRecentWornCollectiion(path)
        let item = returnItem(path)
        self.updateTrashCollectiion(item!)
    }
    
    //MARK: -Appending
    /**
    Add Item to SubCategory
    
    - parameter funcCategory:    Category key
    - parameter funcSubCategory: Sub-Category key
    - parameter newItem:         Item to Add
    */
    func appendItemAt(funcCategory: String, funcSubCategory: String, newItem: Item){
        log.info(__FUNCTION__)
        log.info("Appening item: \(newItem.model) to: \(funcCategory)/\(funcSubCategory)")
        selectedCloset[funcCategory]![funcSubCategory]!.append(newItem)
        
        self.sort(funcCategory, funcSubCategory: funcSubCategory)
        quickSave()
    }
    
    //MARK: -Swap Item
    /**
    Swaps Item if needed, but also updates current item
    
    - parameter funcCategory:        Category key
    - parameter funcSubCategory:     SubCategory key
    - parameter prevFuncCategory:    Previous Category key
    - parameter prevFuncSubCategory: Previous SubCategory key
    - parameter item:                New Item to insert
    */
    func swapItem(funcCategory:     String, funcSubCategory:     String,
        prevFuncCategory: String, prevFuncSubCategory: String,
        item: Item)throws{
            log.info(__FUNCTION__)
            log.info("Swapping item: \(item.model) from \(prevFuncCategory)/\(prevFuncSubCategory) to \(funcCategory)/\(funcSubCategory)")
            let tempItem = item
            self.deleteItem(prevFuncCategory, funcSubCategory: funcSubCategory, item: item)
            
            do{
                try Users_Wardrobe.save(funcCategory, funcSubCategory: funcSubCategory, item: tempItem)
            }
            
            //The delete function puts the deleted item into the trash this removes it as its only being swapped
            self.removeLastTrashedItem()
    }
    
    //MARK: -Check for availibility
    
    /**
    Checks if a array of [Item] is empty
    
    - parameter funcCategory:    Category key
    - parameter funcSubCategory: SubCategory key
    
    - returns: True if array at Category/SubCategory is empty
    */
    func isSubCatCategoryEmptyAt(funcCategory: String, funcSubCategory: String)-> Bool{
        log.info(__FUNCTION__)
        return (selectedCloset[funcCategory]![funcSubCategory]?.isEmpty)!
    }
    /**
     Checks if a Dictionary:[String: [Item]] of a category is empty
     
     - parameter funcCategory:    Category key
     
     - returns: returns true if object at Category is empty
     */
    func isCategoryEmptyAt(funcCategory: String)-> Bool{//Deletes category row
        log.info(__FUNCTION__)
        return (selectedCloset[funcCategory]!.isEmpty)
    }
}



//MARK: -Search-Wardrobe Extension
extension Wardrobe{
    func returnAllItems(){
        //Create array
        //Append items to array
        //Return array
        
    }
    func returnAllItemsFromCategory(category: String)->[Item]{
        //Create array
        //Append items to array
        //Return array
        return []
    }
    func returnAllItemsFromSubCategory(subCategory: String)->[Item]{
        //Create array
        //Append items to array
        //Return array
        return []
    }
}




//MARK: -Array Modifiers-Wardrobe Extension
extension Wardrobe{
    //MARK: -Brand
    ///Adds brand to BrandCollection if one of the same doesn't already exist
    func updateBrandCollectiion(brand: String){
        log.info(__FUNCTION__)
        log.verbose("Brand list is being updated")
        //Checks if Brand exist if not its added to the list
        if !brandCollection.contains(brand)  && brand.isEmpty != true{
            brandCollection.append(brand)
            log.verbose("\(brand) does not exist inside of saved brands list is now being added")
            //TODO: -Fix this sort
            
            
            self.brandCollection = self.brandCollection.sort({$0 < $1})
        }
    }
    ///Removes string from brand if it exists
    func removeBrandIfNoBrandItemsExist(brand: String){
        log.info(__FUNCTION__)
        log.verbose("If \(brand) doesnt exist than remove")
        //TODO: -Add this method to the places it needs to go to remove brand from the list when it is no longer needed
        var sum = 0
        
        for currBrand in brandCollection{
            
            if brand == currBrand as String{
                brandCollection.removeAtIndex(sum)
            }else{
                continue
            }
            sum++
        }
        
    }
    
    //MARK: -Size
    ///Updates Size collection(Not yet implemented)
    func updateSizesCollectiion(item: Item){
        log.info(__FUNCTION__)
        let size = item.size
        if !sizes.contains(size)  && size.isEmpty != true{
            sizes.append(size)
            sizes = sizes.sort{$0 <  $1}
        }
    }
}



//MARK: -Wardrobe Item Methods
extension Wardrobe{
    ///If item is favorited it is sent to favoritedArrau if not it is removed if it's in favoriteCollection
    func checkItemWorn(item: Item){
        log.info(__FUNCTION__)
        log.verbose("\(item.model) check if worn")
        selectedClosetRecentWornItems = selectedClosetRecentWornItems.filter({
            let lastTime = returnItem($0)!.lastTimeWorn
            return (lastTime != "N.A" || lastTime != "")
        })
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        let isStringConvertableToDate = dateFormatter.dateFromString(item.lastTimeWorn) as NSDate?
        
        if isStringConvertableToDate != nil{
            
            if selectedClosetRecentWornItems.count < RECENTLY_WORN_CONTAINER_MAX{
                selectedClosetRecentWornItems.insert(item.path, atIndex: 0)
                selectedClosetRecentWornItems = selectedClosetRecentWornItems.sort({(returnItem($0)!.lastTimeWorn).returnDaysInDate() < (returnItem($1)!.lastTimeWorn).returnDaysInDate()})
                
            }else{
                for (index, value) in selectedClosetRecentWornItems.enumerate(){
                    if (item.lastTimeWorn).returnDaysInDate() <= (returnItem(value)!.lastTimeWorn).returnDaysInDate(){
                        selectedClosetRecentWornItems.insert(item.path, atIndex: index)
                        return
                    }
                }
            }
        }
    }
    /**
     Checks if item exist in this SubCategory of Category
     
     - parameter funcCategory:    Category key
     - parameter funcSubCategory: SubCategory key
     - parameter item:            Item to check
     
     - returns: returns true if item exist in subCategory false if it doesn't
     */
    func doesItemExistAt(funcCategory: String, funcSubCategory: String, item: Item)-> Bool{
        log.info(__FUNCTION__)
        log.verbose("Checking if item \(item.model) exist")
        let array = self.selectedCloset[funcCategory]![funcSubCategory]!
        
        for index in array{
            if index.isEqual(item){
                log.verbose("item: \(item.model) does exist")
                return true
            }
        }
        return false
    }
}



//MARK: -Containers of Features Functions
extension Wardrobe{
    //MARK: -Favorites
    ///Takes a container of Items and converts them to a path and sets them as new Favorites container
    func setNewFavorites(items: [Item]){
        log.info(__FUNCTION__)
        log.verbose("Sets new Favorites")
        self.selectedClosetFavoritedItems = self.returnPathsFromArrayOfItems(items)
    }
    ///Populates FavoritedItems with the paths stored in favoriteItemsPaths to pull the item directly from the source insead of keeping copies
    func populateFavoriteItems()->[Item]{
        log.info(__FUNCTION__)
        log.verbose("Returning favorites Items array from Path array")
        var returningDictionaryPath = [Item]()
        
        for path in selectedClosetFavoritedItems{
            let item = returnItem(path)
            
            if item == nil{
                self.clearAllContainersAndPopulate()
                return self.populateFavoriteItems()
            }
            
            returningDictionaryPath.append(item!)
        }
        
        return returningDictionaryPath
    }
    ///Puts item in Favorite Collection if it doesn't exist in array already and if it does its removed from that position and append to the top
    private func updateFavoritedWornCollectiion(path: [String: String]){
        log.info(__FUNCTION__)
        log.verbose("Removing item path from favorites")
        
        var count = 0
        
        let id = path[PathType.PATHTYPE_ID_STRING]!
        
        for arrayPath in selectedClosetFavoritedItems{
            if id == arrayPath[PathType.PATHTYPE_ID_STRING]!{
                
                selectedClosetFavoritedItems.removeAtIndex(count)
                
                selectedClosetFavoritedItems.insert(path, atIndex: 0)
                
            }
            
            count++
        }
        
        selectedClosetFavoritedItems.insert(path, atIndex: 0)
    }
    func removeItemFromFavorites(path: [String: String]){
        log.info(__FUNCTION__)
        log.verbose("Removing item path from favorites")
        let checkedID = path[PathType.PATHTYPE_ID_STRING]!
        
        for (index, item) in self.selectedClosetFavoritedItems.enumerate(){
            if checkedID == String(item[PathType.PATHTYPE_ID_STRING]){
                log.verbose("found and removed item path from favorites")
                self.selectedClosetFavoritedItems.removeAtIndex(index)
                return
            }
        }
    }
    ///Removes any Item from the FavoritedList that's not Favorited
    private func removeNonFavoritedItems(){
        log.info(__FUNCTION__)
        log.verbose("Removing non favorites items in favorites if they exisit")
        var count = 0
        
        for arrayPath in selectedClosetFavoritedItems{
            let item = returnItem(arrayPath)
            if item!.favorited != true{
                log.verbose("Item is removed from favorites")
                selectedClosetFavoritedItems.removeAtIndex(count)
            }
            count++
        }
    }
    ///Removes item from FavoritedItems if one exist with the same ID number
    private func removeFromFavoriteList(path: [String: String]){
        log.info(__FUNCTION__)
        log.verbose("Removing item path from favorites")
        selectedClosetFavoritedItems = selectedClosetFavoritedItems.filter({$0[PathType.PATHTYPE_ID_STRING]! != path[PathType.PATHTYPE_ID_STRING]!})
    }
    func setFavoriteContainerToMax(max: Int){
        while selectedClosetFavoritedItems.count > max{
            selectedClosetFavoritedItems.popLast()
        }
        
    }
    
    
    //MARK: -Recents
    ///Sorts and filter Recently Worn Container
    func sortRecentContainer(){
        log.info(__FUNCTION__)
        log.info("Sorting Recent worn list")
        
        //Sorts item then removes all items that hasn't been worn
        selectedClosetRecentWornItems = selectedClosetRecentWornItems.sort(){
            returnItem($0)?.lastTimeWorn.returnDaysInDate() < returnItem($1)?.lastTimeWorn.returnDaysInDate()
            }.filter(){ returnItem($0)?.lastTimeWorn.returnDaysInDate() >= 0 }
        
        self.setRecentContainerToMax(RECENTLY_WORN_CONTAINER_MAX)
    }
    func setRecentContainerToMax(max: Int){
        while selectedClosetRecentWornItems.count > max{
            selectedClosetRecentWornItems.popLast()
        }
        
    }
    ///Takes a container of Items and converts them to a path and sets them as new Recents container
    func setNewRecents(items: [Item]){
        log.info(__FUNCTION__)
        log.verbose("Sets new Recently Worn")
        self.selectedClosetRecentWornItems = self.returnPathsFromArrayOfItems(items)
    }
    ///Populates FavoritedItems with the paths stored in favoriteItemsPaths to pull the item directly from the source insead of keeping copies
    func populateRecentlyWornItems()->[Item]{
        log.info(__FUNCTION__)
        log.verbose("Returning Recenetly worn Item arrays from path array")
        var returningDictionaryPath = [Item]()
        
        for path in selectedClosetRecentWornItems{
            let item = returnItem(path)
            
            if item == nil{
                self.clearAllContainersAndPopulate()
                return self.populateRecentlyWornItems()
                
            }
            
            returningDictionaryPath.append(item!)
        }
        return returningDictionaryPath
    }
    ///If item is favorited it is sent to favorited container and if it already exists in favorites it is deleted
    func  ItemFavorited(item: Item){
        log.info(__FUNCTION__)
        log.verbose("\(item.model) favorited")
        self.removeFromFavoriteList(item.path)
        
        if item.favorited == true{
            updateFavoritedWornCollectiion(item.path)
        }
    }
    ///Puts item in wornCollection if it doesn't exist in array already and if it does its removed from that position and append to the top
    func updateRecentWornCollectiion(path: [String: String]){
        log.info(__FUNCTION__)
        log.info("update RecentWorn Collection")
        //This array is made so an index can be removed from from recentWorn loop without issues
        var arrayToDelete:[[String: String]] = selectedClosetRecentWornItems
        
        defer{
            if arrayToDelete.count >= RECENTLY_WORN_CONTAINER_MAX{
                arrayToDelete.popLast()
            }
            arrayToDelete = arrayToDelete.filter({validatePath($0)})
            
            arrayToDelete.insert(path, atIndex: 0)
            log.info("insetred item to top of container")
            
            selectedClosetRecentWornItems = arrayToDelete
            
            self.sortRecentContainer()
        }
        
        for (count, arrayPath) in selectedClosetRecentWornItems.enumerate(){
            let pathCheck = validatePath(arrayPath)
            
            if pathCheck == true{
                let arrayPathID = arrayPath[PathType.PATHTYPE_ID_STRING]!
                let pathID = path[PathType.PATHTYPE_ID_STRING]!
                
                if arrayPathID == pathID{
                    log.info("item found in container and is being deleted to add new object")
                    arrayToDelete.removeAtIndex(count)
                    return
                }
            }
        }
    }
    ///Removes item from recentWornItems if one exist with the same ID number
    private func removeFromRecentWornCollectiion(path: [String: String]){
        log.info(__FUNCTION__)
        log.verbose("Remove from recent worn collection")
        selectedClosetRecentWornItems = selectedClosetRecentWornItems.filter({$0[PathType.PATHTYPE_ID_STRING]! != path[PathType.PATHTYPE_ID_STRING]!})
    }
    
    //MARK: -Trash
    ///Handles a new trash item being added
    func updateTrashCollectiion(item: Item){
        log.info(__FUNCTION__)
        log.verbose("Update trash collection")
        //If trash is above the max count delete the tail
        if selectedClosetTrashItems.count > RECENTLY_WORN_CONTAINER_MAX{
            selectedClosetTrashItems.popLast()
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        item.dateDeleted = String(NSDate)
        self.selectedClosetTrashItems.insert(item, atIndex: 0)
    }
    ///Removes the last trash item added
    func removeLastTrashedItem(){
        log.info(__FUNCTION__)
        log.verbose("Remove last add trash item")
        if !selectedClosetTrashItems.isEmpty{
            selectedClosetTrashItems.removeAtIndex(0)
            log.info("Last inserted trash item deleted")
        }else{
            log.info("trash empty no items was removed")
        }
    }
    ///Removes all from trash
    private func cleanOutTrash(){
        log.info(__FUNCTION__)
        self.selectedClosetTrashItems.removeAll()
    }
    
    //MARK: -Containers methods
    ///Removes all items from features containers and than repopulates them.  Is used if the system becomes corrupterd
    func clearAllContainersAndPopulate(){
        log.info(__FUNCTION__)
        log.info("Clearing all containers")
        self.myWishListRecentWornItems.removeAll()
        self.myWishListFavoritedItems.removeAll()
        self.myClosetFavoritedItems.removeAll()
        self.myClosetRecentWornItems.removeAll()
        
        log.info("All Containers Cleared/Empty")
        
        self.findAndPopulateContainersAndCleanItems()
        
        log.info("Removing extra items in container")
        self.sortRecentContainer()
        
    }
    ///Populates all feature containers with validated items for that container
    private func findAndPopulateContainersAndCleanItems(){
        log.info(__FUNCTION__)
        log.info("Initiating iteration through all items in \(self.closetSelectionString)")
        log.info("Find and populate containers")
        for (_, category) in self.selectedCloset{
            for (_, subCategory) in category{
                for item in subCategory{
                    if item.favorited == true{
                        self.selectedClosetFavoritedItems.append(item.path)
                    }
                    
                    if item.lastTimeWorn.returnDaysInDate() != UNSET_INT_VALUE{
                        self.selectedClosetRecentWornItems.append(item.path)
                    }
                    
                    item.setItemValuesToProperValues()
                }
            }
        }
        
        log.info("All items was checked and modified if neccessary")
    }
    /**
     Converts item objects into path objects
     
     - parameter items: Container of item s to convert
     
     - returns: Converted items that are now paths
     */
    func returnPathsFromArrayOfItems(items: [Item])-> [[String: String]]{
        log.info(__FUNCTION__)
        log.verbose("Returning paths from given array")
        var returningDictionaryPath = [[String: String]]()
        
        for item in items{
            let path = item.path
            
            returningDictionaryPath.append(path)
        }
        
        return returningDictionaryPath
    }
    
}

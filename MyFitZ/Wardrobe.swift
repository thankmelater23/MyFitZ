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
    var recentWornItems: [Item] = [Item]()
    var favoritedItems: [Item] = [Item]()
    //    var recentWornItemsPath: [(closet: String, id: Int, category: String, subCategory: String, index: Int)]?
    //    var favoritedItemsPath: [(closet: String, id: Int, category: String, subCategory: String, index: Int)]?
    //    var myClosetRecentWornItems: [Item] = [Item]()
    //    var myClosetFavoritedItems: [Item] = [Item]()
    //    var myWishListRecentWornItems: [Item] = [Item]()
    //    var myWishListFavoritedItems: [Item] = [Item]()
    
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
        
        //self.selectedCloset = CLOSET_TYPE()
        
        print(myCloset, myWantsCloset, closetSelectionString, path, brandCollection)
        
    }//Decode data in class
    func encodeWithCoder(coder: NSCoder){
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
    }//Encodes data in class
    /**
    Initializes the Wardrobe class with a basic setup, and no items
    
    - returns: No return
    */
    override init(){
        super.init()
        
        
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
        let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsFolderPath
    }
    /**
     Gets URL path from directory
     
     - parameter filename: String URL path
     
     - returns: NSURL of path to save to
     */
    func fileInDocumentsDirectory(filename: String) -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent(filename)
    }
    /**
     Saves wardrobe file and shows saving prompt
     
     - parameter filePath:       URL path to save to
     - parameter wardrobeToSave: Wardrobe object to save to URL path
     */
    func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
        //TODO: -Redo this to get success or not from saving
        var success = false
        
        
        dispatch_async(GlobalMainQueue, {
            
            SVProgressHUD.show()
            
            let dicOfOptions = [kCRToastTextKey: "File Saving", kCRToastTextAlignmentKey : "NSTextAlignmentCenter",
                kCRToastBackgroundColorKey : UIColor.greenColor(),
                kCRToastAnimationInTypeKey : "CRToastAnimationTypeGravity",
                kCRToastAnimationOutTypeKey : "CRToastAnimationTypeGravity",
                kCRToastAnimationInDirectionKey : "CRToastAnimationDirectionLeft",
                kCRToastAnimationOutDirectionKey : "CRToastAnimationDirectionRight"]
            
            
            CRToastManager .showNotificationWithOptions(dicOfOptions, completionBlock: {
                dispatch_sync(GlobalUtilityQueue, {
                    success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
                    
                    SVProgressHUD.showSuccessWithStatus("Saved")
                    SVProgressHUD.dismiss()
                    
                    print("File Saved Successfully")
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
        
        if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
            
            return wardrobe
        }else{
            let newWardrobe = Wardrobe()
            saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
            return newWardrobe
        }
    }
    /**
     Gets wardrobe object from loadArchiveObject method
     
     - returns: Wardrobe from file directory
     */
    func loadAndCreateCloset() -> Wardrobe{
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
        
        if funcSubCategory.isEmpty == true{throw ItemError.IncorrectSubCategory}
        
        //Checks if new SubCategory is new
        let keysOfCategory = Array(selectedCloset[funcCategory]!.keys)
        let isKeyNew = keysOfCategory.contains(funcSubCategory)
        
        item.category = funcCategory
        item.subCategory = funcSubCategory
        
        //Creates a subcategory if none exist by that name
        if !isKeyNew{
            self.selectedCloset[funcCategory]!.updateValue([Item](), forKey: funcSubCategory)
            print("Subcategory created: \(funcSubCategory)")
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
            
            print("Item Saved: \(item) \nTo: \(funcCategory)/\(funcSubCategory)")
        }else{throw ItemError.missingModelString}
        
        self.sort(funcCategory, funcSubCategory: funcSubCategory)
        
        self.checkItemFavorited(item)
        
        //Saves Wardrobe
        self.quickSave()
        
    }
    /**
     Plays SFX, gets file path to save to, than save Wardrobe object to archive
     */
    func quickSave(){
        playSoundEffects(saveSFX)
        
//        self.wardrobeItemsReset()
        self.removeNonFavoritedItems()
        
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
        defer{
            closetItemCountID! += 1
        }
        if closetItemCountID == nil{
            closetItemCountID = 0
        }
        return closetItemCountID!
    }
    /**
     Returns an ID number that has not been given yet and than increments for the next item to get an ID number for an item in the wish listch
     
     - returns: New ID number
     */
    func countWishlistDown()->Int{
        defer{
            wishListItemCountID! -= 1
        }
        
        if wishListItemCountID == nil || wishListItemCountID == 0{
            wishListItemCountID = 100000
        }
        return wishListItemCountID!
    }
    /**
     Get the number of items in MyCloset
     
     - returns: number of items in MyCloset
     */
    func getsCountOfMyCloset()-> Int{
        var sum = 0
        for (_, value) in myCloset{
            for (_, value) in value{
                for _ in value{
                    sum++
                }
            }
        }
        return sum
    }
    /**
     Get the number of items in Wishlist
     
     - returns: number of items in Wishlist
     */
    func getsCountOfMyWishList()-> Int{
        var sum = 0
        for (_, value) in myWantsCloset{
            for (_, value) in value{
                for _ in value{
                    sum++
                }
            }
        }
        return sum
    }
    /**
     Get count of subCategories in key of Category
     
     - parameter funcCategory: Category Key
     
     - returns: Number of sumCategories
     */
    func getCountOfCategories(funcCategory: String)->Int{
        return selectedCloset[funcCategory]!.count
    }
    /**
     Gets count of all items in a subcategory of categories
     
     - parameter funcCategory: Category Key
     
     - returns: <#return value description#>
     */
    func getCountOfAllItemsInCategory(funcCategory: String)->Int{
        var sum = 0
        for (_, value) in selectedCloset[funcCategory]!{
            sum += value.count
        }
        return sum
    }
    /**
     Gets count of number of items in Subcategory
     
     - parameter funcCategory:    Category Key
     - parameter funcSubCategory: SubCategory Key
     
     - returns: Number of items in array of subcategory
     */
    func getCountOfSubCategories(funcCategory: String, funcSubCategory: String)->Int{
        return selectedCloset[funcCategory]![funcSubCategory]!.count
    }
    /**
     Resets whole wardrobe object and gives fresh id numbers to all items in closet and wishlist, than saves
     */
    func wardrobeItemsReset(){
        self.removeNonFavoritedItems()
        //Gives all Closet items a new ID number
        
        var sum = 0
        var prevClosetSelection = self.closetSelectionString
        self.closetSelectionString = MY_CLOSET
        
        for (catKey, superValue) in self.selectedCloset{
            for (subCatKey, values) in superValue{
                for (arrayIndex, value) in values.enumerate(){
                    
                    value.path[PATHTYPE_CLOSET_STRING] = MY_CLOSET
                    value.path[PATHTYPE_CATEGORY_STRING] = value.category
                    value.path[PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
                    value.path[PATHTYPE_ID_STRING] = String(value.id)
                    value.path[PATHTYPE_INDEX_STRING] = String(arrayIndex)
                    sum++
                    
                    self.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
                    
                    if value.id == values.last!.id{
                        sum = 0
                    }
                }
            }
        }
        
        sum = 0
        
        self.closetSelectionString = MY_WANTS_CLOSET
        //Gives all Wishlist items a new ID number
        for (catKey, superValue) in self.selectedCloset{
            for (subCatKey, values) in superValue{
                for (arrayIndex, value) in values.enumerate(){
                    
                    value.path[PATHTYPE_CLOSET_STRING] = MY_WANTS_CLOSET
                    value.path[PATHTYPE_CATEGORY_STRING] = value.category
                    value.path[PATHTYPE_SUBCATEGORY_STRING] = value.subCategory
                    value.path[PATHTYPE_ID_STRING] = String(value.id)
                    value.path[PATHTYPE_INDEX_STRING] = String(arrayIndex)
                    sum++
                    
                    self.selectedCloset[catKey]![subCatKey]![arrayIndex] = value
                    
                    if value.id == values.last!.id{
                        sum = 0
                    }
                }
            }
        }
        
        //Sets back current closet we're in
        self.closetSelectionString = prevClosetSelection
        self.quickSave()
    }
    
}

    //MARK: -General-Wardrobe Extension
    extension Wardrobe{
        func sort(funcCategory:String, funcSubCategory:String){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .ShortStyle
            
            let unSortedArray = self.selectedCloset[funcCategory]![funcSubCategory]!
            let sorted = unSortedArray.sort({
                $0.lastTimeWorn.returnDaysInDate() < $1.lastTimeWorn.returnDaysInDate()
            })
            
            var sum = 0
            
            //Sets new index for item within array
            for value in sorted{
                value.index = sum++
                value.path[PATHTYPE_INDEX_STRING] = String(value.index)
            }
            
            //Make replace old array with new sorted array
            self.selectedCloset[funcCategory]![funcSubCategory]! = sorted
        }
        /**
         Gets value from Category, sort value, return value to be used in tableView sorted
         
         - parameter funcCategory: Category of selected closet
         
         - returns: Array of an array of Items thats sorted
         */
        func returnCategorySorted(funcCategory:String)->[[Item]]{
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
            let tempArray = self.selectedCloset[category]!
            
            let keyOfSelectedArray = Array(tempArray.keys)
            
            var array = [[Item]]()
            
            if keyOfSelectedArray.count > 1{
                array = Array(tempArray.values)
                
                array.first?.first?.category
                
                array = array.sort({
                    $0.first!.subCategory < $1.first!.subCategory})
            }
            
            var index = 0
            
            for value in array{
                if value.first!.subCategory == keyOfSelectedArray[index]{
                    selectedCloset[category]![keyOfSelectedArray[index]] = value
                }
                index++
            }
            
            return array
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
            let dictionaryOfArray:[String: [Item]] = selectedCloset[funcCategory]!
            
            return dictionaryOfArray
        }
        /**
         Gets array of keys for category subcategories
         
         - parameter funcCategory: Category key
         
         - returns: returns an array of keys*[String]
         */
        func returnArrayOfKeysOfCategory(funcCategory: String)->[String]{
            let keys:[String] = Array(selectedCloset[funcCategory]!.keys)
            
            return keys
        }
        /**
         Gets array of values for category subcategories
         
         - parameter funcCategory: Category key
         
         - returns: A dictionary of arrays of Items: [String: [Item]
         */
        func returnArrayOfValuesOfCategory(funcCategory: String)->[String: [Item]]{
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
            playSoundEffects(deleteSFX)
            
            self.checkItemFavorited(item)
            
            let array = self.selectedCloset[funcCategory]![funcSubCategory]!
            var num = 0
            for index in array{
                if index.isEqual(item){
                    self.selectedCloset[funcCategory]![funcSubCategory]!.removeAtIndex(num)
                    break
                }else{
                    num++
                }
                
            }
            
            
            self.quickSave()
        }
        /**
         Deletes array:[Item] at Category/Sub-Category, plays SFX, than save
         
         - parameter funcCategory:    Category Key
         - parameter funcSubCategory: Sub-Category Key
         */
        func deleteAt(funcCategory: String, funcSubCategory: String){//Deletes subCateogry row
            playSoundEffects(deleteSFX)
            selectedCloset[funcCategory]!.removeValueForKey(funcSubCategory)
            quickSave()
        }
        /**
         Deletes subcategory of category, plays SFX, than save
         
         - parameter funcCategory: Category Key
         - parameter row:          Sub-Category Key
         */
        func deleteAt(funcCategory: String, row: Int){//Deletes category row
            playSoundEffects(deleteSFX)
            
            var array = Array(selectedCloset[funcCategory]!.keys)
            
            let key = array[row]
            selectedCloset[funcCategory]?.removeValueForKey(key)
            
            quickSave()
        }
        
        //MARK: -Appending
        /**
        Add Item to SubCategory
        
        - parameter funcCategory:    Category key
        - parameter funcSubCategory: Sub-Category key
        - parameter newItem:         Item to Add
        */
        func appendItemAt(funcCategory: String, funcSubCategory: String, newItem: Item){
            selectedCloset[funcCategory]![funcSubCategory]!.append(newItem)
            
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
            item: Item){
                let tempItem = item
                
                deleteItem(prevFuncCategory, funcSubCategory: prevFuncSubCategory, item: item)
                
                selectedCloset[funcCategory]![funcSubCategory]?.append(tempItem as! Item)
                
                
        }
        
        //MARK: -Check for availibility
        /**
        Checks if item exist in this SubCategory of Category
        
        - parameter funcCategory:    Category key
        - parameter funcSubCategory: SubCategory key
        - parameter item:            Item to check
        
        - returns: returns true if item exist in subCategory false if it doesn't
        */
        func doesItemExistAt(funcCategory: String, funcSubCategory: String, item: Item)-> Bool{
            let array = self.selectedCloset[funcCategory]![funcSubCategory]!
            
            for index in array{
                if index.isEqual(item){
                    return true
                }
            }
            return false
        }
        /**
         Checks if a array of [Item] is empty
         
         - parameter funcCategory:    Category key
         - parameter funcSubCategory: SubCategory key
         
         - returns: True if array at Category/SubCategory is empty
         */
        func isSubCatCategoryEmptyAt(funcCategory: String, funcSubCategory: String)-> Bool{
            return (selectedCloset[funcCategory]![funcSubCategory]?.isEmpty)!
        }
        /**
         Checks if a Dictionary:[String: [Item]] of a category is empty
         
         - parameter funcCategory:    Category key
         
         - returns: returns true if object at Category is empty
         */
        func isCategoryEmptyAt(funcCategory: String)-> Bool{//Deletes category row
            return (selectedCloset[funcCategory]!.isEmpty)
        }
    }
    
    
    
    //MARK: -Array Modifiers-Wardrobe Extension
    extension Wardrobe{
        //MARK: -Brand
        /**
        Adds brand to BrandCollection if one of the same doesn't already exist
        
        - parameter brand: Brand String to append
        */
        func updateBrandCollectiion(brand: String){
            //Checks if Brand exist if not its added to the list
            if !brandCollection.contains(brand)  && brand.isEmpty != true{
                brandCollection.append(brand)
                
                //TODO: -Fix this sort
                
                
                brandCollection = brandCollection.sort({
                    $0 < $1
                })
            }
        }
        /**
         Removes string from brand if it exists
         
         - parameter brand: Brand string to check
         */
        func removeBrandIfNoBrandItemsExist(brand: String){
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
        //    func updateSizesCollectiion(item: Item){
        //        let size = item.size
        //        if !sizes.contains(size)  && size.isEmpty != true{
        //            sizes.append(size)
        //            sizes = sizes.sort{$0 <  $1}
        //        }
        //    }
        //MARK: -Favorites
        /**
        If item is favorited it is sent to favoritedArrau if not it is removed if it's in favoriteCollection
        
        - parameter item: Item to check for favorited
        */
        func checkItemFavorited(item: Item){
            if item.favorited == true{
                updateFavoritedWornCollectiion(item)
            }else{
                removeFromFavoriteList(item)
            }
        }
        /**
         Puts item in Favorit collection
         
         - parameter item: <#item description#>
         */
        private func updateFavoritedWornCollectiion(item: Item){
            self.removeNonFavoritedItems()
            var count = 0
            
            for itemWithId in favoritedItems{
                if itemWithId.id == item.id{
                    favoritedItems.removeAtIndex(count)
                    favoritedItems.insert(item, atIndex: 0)
                    return
                }
                
                count++
            }
            
            favoritedItems.insert(item, atIndex: 0)
        }
        /**
         Removes item from FavoritedItems if one exist with the same ID number
         
         - parameter item: Item to compare id with
         */
        private func removeFromFavoriteList(item: Item){
            var count = 0
            
            for itemWithId in favoritedItems{
                if itemWithId.id == item.id{
                    favoritedItems.removeAtIndex(count)
                    return
                }
                
                count++
            }
        }
        /**
         Removes any Item from the FavoritedList that's not Favorited
         */
        private func removeNonFavoritedItems(){
            
            favoritedItems = favoritedItems.filter({$0.favorited == true})
        }
        /**
         Populates FavoritedItems with the paths stored in favoriteItemsPaths to pull the item directly from the source insead of keeping copies
         */
        func populateFavoriteItems(){
            for path in favoritedItems{
                let item = Item()//returnItem(path)
                favoritedItems.append(item)
            }
        }
        /**
         Populates FavoritedItems with the paths stored in favoriteItemsPaths to pull the item directly from the source insead of keeping copies
         */
        func populateRecentlyWornItems(){
            for path in recentWornItems{
                let item = Item()//returnItem(path)
                recentWornItems.append(item)
            }
        }
        //MARK: -RecentWorn
        /**
        Puts item in wornCollection if it doesn't exist in array already and if it does its removed from that position and append to the top
        
        - parameter item: Item to insert
        */
        func updateRecentWornCollectiion(item: Item){
            var count = 0
            
            for itemWithId in recentWornItems{
                if itemWithId.id == item.id{
                    recentWornItems.removeAtIndex(count)
                    recentWornItems.insert(item, atIndex: 0)
                    return
                }else{
                    
                }
                count++
            }
            if recentWornItems.count > RECENTLY_WORN_CONTAINER_MAX{
                recentWornItems.popLast()
            }
            recentWornItems.insert(item, atIndex: 0)
        }
}







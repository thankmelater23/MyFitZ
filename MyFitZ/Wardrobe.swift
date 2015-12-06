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
    var closetItemCountID: Int?
    var wishListItemCountID: Int?
    var recentWornItems: [Item] = [Item]()
    var favoritedItems: [Item] = [Item]()
    
    //MARK: -Closets
    var myCloset = CLOSET_TYPE()
    var myWantsCloset: CLOSET_TYPE = CLOSET_TYPE()
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
    }//Encodes data in class
    
    override init(){
        super.init()
        //Puts Categories from array inside both Closet_Types
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
        
        //Saves Wardrobe
        self.quickSave()
    }
    func quickSave(){
        playSoundEffects(saveSFX)
        let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        saveObjectToArchived(pathOfFile.path!, wardrobeToSave: self)
    }
    
}



//MARK: -Counter Methods-Wardrobe Extension
extension Wardrobe{
    func countClosetUp()->Int{
        defer{
            closetItemCountID! += 1
        }
        if closetItemCountID == nil{
            closetItemCountID = 0
        }
        return closetItemCountID!
    }
    func countWishlistDown()->Int{
        defer{
            wishListItemCountID! -= 1
        }
        
        if wishListItemCountID == nil{
            wishListItemCountID = 100000
        }
        return wishListItemCountID!
    }
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
    func getCountOfCategories(funcCategory: String)->Int{
        return selectedCloset[funcCategory]!.count
    }
    func getCountOfAllItemsInCategory(funcCategory: String)->Int{
        var sum = 0
        for (_, value) in selectedCloset[funcCategory]!{
            sum += value.count
        }
        return sum
    }
    func getCountOfSubCategories(funcCategory: String, funcSubCategory: String)->Int{
        return selectedCloset[funcCategory]![funcSubCategory]!.count
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
        
        var sum = 1
        
        //Sets new index for item within array
        for value in sorted{
            value.index = sum++
            value.path[PATHTYPE_INDEX_STRING] = String(value.index)
        }
        
        //Make replace old array with new sorted array
        self.selectedCloset[funcCategory]![funcSubCategory]! = sorted
    }
    func setProgress(){
        //        progress = NSProgress()
        //        progress.totalUnitCount = -1
        //        progress.kind = NSProgressKindFile
        //        progress.setUserInfoObject(NSProgressFileOperationKindCopying, forKey: NSProgressFileOperationKindKey)
        //
        //
        
    }
    //TODO: - Create sorting for
    func updateCategoryOrder(category: String){
        let sortedCategory = self.returnArrayOfValuesOfCategory(category)//.sort({$0.array[0].category < $1.array[0].category})
        selectedCloset[category] = sortedCategory
    }
}



//MARK: -Wardrobe Modification-Wardrobe Extension
extension Wardrobe{
    //MARK: -Return functions
    func returnDictionaryOfCategory(funcCategory: String)-> [String: [Item]]{
        let dictionaryOfArray = selectedCloset[funcCategory]!
        
        return dictionaryOfArray
    }
    func returnArrayOfKeysOfCategory(funcCategory: String)->[String]{
        let keys = Array(selectedCloset[funcCategory]!.keys)
        
        return keys //?? [String]()
    }
    func returnArrayOfValuesOfCategory(funcCategory: String)->[String: [Item]]{
        let values = selectedCloset[funcCategory]!
        
        return values //?? [String]()
    }
    func returnArrayOfItems(funcCategory: String, funcSubCategory: String)->[Item]{
        let array = selectedCloset[funcCategory]![funcSubCategory]!
        
        return array
    }
    
    //MARK: -Delete Functions
    func deleteItem(funcCategory: String, funcSubCategory: String, item: Item){//Deletes item
        playSoundEffects(deleteSFX)
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
        
        selectedCloset[funcCategory]![funcSubCategory]! = array
        
        
        self.quickSave()
    }
    func deleteAt(funcCategory: String, funcSubCategory: String){//Deletes subCateogry row
        playSoundEffects(deleteSFX)
        selectedCloset[funcCategory]!.removeValueForKey(funcSubCategory)
        quickSave()
    }
    func deleteAt(funcCategory: String, row: Int){//Deletes category row
        playSoundEffects(deleteSFX)
        var array = Array(selectedCloset[funcCategory]!.keys)
        
        let key = array[row]
        selectedCloset[funcCategory]?.removeValueForKey(key)
        
        quickSave()
    }
    
    //MARK: -Appending
    func appendItemAt(funcCategory: String, funcSubCategory: String, newItem: Item){
        selectedCloset[funcCategory]![funcSubCategory]!.append(newItem)
        quickSave()
    }
    func appendAt(funcCategory: String, funcSubCategory: String, newArrayForSubCategory: [Item]){
        
        
    }
    func appendAt(funcCategory: String, row: Int, newSubCategory: [String: [Item]]){
        
    }
    
    //MARK: -Swap Item
    func swapItem(funcCategory:     String, funcSubCategory:     String,
        prevFuncCategory: String, prevFuncSubCategory: String,
        item: Item){//Deletes object from one place and adds it to another place
            deleteItem(prevFuncCategory, funcSubCategory: prevFuncSubCategory, item: item)
            
            selectedCloset[funcCategory]![funcSubCategory]?.append(item)
            
            
    }
    
    //MARK: -Check for availibility
    func doesItemExistAt(funcCategory: String, funcSubCategory: String, item: Item)-> Bool{//Deletes item
        let array = self.selectedCloset[funcCategory]![funcSubCategory]!
        
        for index in array{
            if index.isEqual(item){
                return true
            }
        }
        return false
    }
    func isSubCatCategoryEmptyAt(funcCategory: String, funcSubCategory: String)-> Bool{//Deletes subCateogry row
        return (selectedCloset[funcCategory]![funcSubCategory]?.isEmpty)!
    }
    func isCategoryEmptyAt(funcCategory: String)-> Bool{//Deletes category row
        return (selectedCloset[funcCategory]!.isEmpty)
    }
}



//MARK: -Array Modifiers-Wardrobe Extension
extension Wardrobe{
    //MARK: -Brand
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
    func updateSizesCollectiion(item: Item){
        let size = item.size
        if !sizes.contains(size)  && size != ""{
            sizes.append(size)
            sizes = sizes.sort{$0 <  $1}
        }
    }
    //MARK: -Favorites
    func checkItemFavorited(item: Item){
        if item.favorited == true{
            updateFavoritedWornCollectiion(item)
        }else{
            removeFromFavoriteList(item)
        }
    }
    func updateFavoritedWornCollectiion(item: Item){
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
    func removeFromFavoriteList(item: Item){
        var count = 0
        
        for itemWithId in favoritedItems{
            if itemWithId.id == item.id{
                favoritedItems.removeAtIndex(count)
                return
            }
            
            count++
        }
        
        favoritedItems.insert(item, atIndex: 0)
    }
    //MARK: -RecentWorn
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
        if recentWornItems.count == RECENTLY_WORN_CONTAINER_MAX{
            recentWornItems.popLast()
        }
        recentWornItems.insert(item, atIndex: 0)
    }
}

//TODO: Create equatable functions
//MARK: -Equatable-Wardrobe Extension
//extension Wardrobe: Equatable{
//    func ==(lhs: Wardrobe, rhs: Wardrobe){
//
//    }
//}

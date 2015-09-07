//
//  Wardrobe.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 5/21/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

class Wardrobe:NSObject, NSCoding{
    ///Holds entire system items Dictionary-Dictionary-Araay of Items --Path To Root = String-String-Int
//    var myCloset: CLOSET_TYPE = CLOSET_TYPE()
    var myCloset = CLOSET_TYPE()
    var myWantsCloset: CLOSET_TYPE = CLOSET_TYPE()
    var brandCollection: [String] = [String]()
    //var progress: NSProgress
    
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
    //  var allItems = [Item]()
    //  var savedFits      = [Fit]()
    //  var closetTotalPrice:Double! = 0
    //  var numberOfItemsWorn: Int! = 0
    //  var percentOfItemsWorn: Double! = 0
    //  var numberOfItems: Int! = 0
    //  var favoritedItems = [Item]()
    //  var favoritedFits  = [Fit]()
    //  var recentWornFits = [Fit]()
    
    override var description: String {
        return String()
    }
    
    required init?(coder decoder: NSCoder){// probably have to insert "convenience" between required possibly
        super.init()
        self.myCloset = decoder.decodeObjectForKey("1") as! CLOSET_TYPE!
        self.myWantsCloset = decoder.decodeObjectForKey("2") as! CLOSET_TYPE!
        self.closetSelectionString = decoder.decodeObjectForKey("3") as! String!
        self.path = decoder.decodeObjectForKey("4") as! [String: String]!
        self.brandCollection = decoder.decodeObjectForKey("5") as! [String]!
        //self.selectedCloset = CLOSET_TYPE()
        
        print(myCloset, myWantsCloset, closetSelectionString, path, brandCollection)
        
    }//Decode data in class
    func encodeWithCoder(coder: NSCoder){
        coder.encodeObject(self.myCloset, forKey: "1")
        coder.encodeObject(self.myWantsCloset, forKey: "2")
        coder.encodeObject(self.closetSelectionString, forKey: "3")
        coder.encodeObject(self.path, forKey: "4")
        coder.encodeObject(self.brandCollection, forKey: "5")
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


//File System
extension Wardrobe{
    //Used to save to ios directory
    func documentsDirectory() -> NSURL {
        let documentsFolderPath = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentsFolderPath
    }
    func fileInDocumentsDirectory(filename: String) -> NSURL {
        return documentsDirectory().URLByAppendingPathComponent(filename)//stringByAppendingString("/\(filename)")
    }
    func saveObjectToArchived(filePath: String, wardrobeToSave: Wardrobe!){
        
        var success = false
        
        dispatch_async(GlobalUtilityQueue, {
            success = NSKeyedArchiver.archiveRootObject(wardrobeToSave, toFile:filePath)
            //            if success {
            //                ("Saved file successfully to: \(filePath)")
            //            } else{
            //                print("Error saving data file to: \(filePath)")
            //            }
        })
        
    }
    func loadArchivedObject(filePath: NSURL) -> Wardrobe? {
        
        if let wardrobe = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath.path!) as! Wardrobe!{
            
            return wardrobe
        }else{
            let newWardrobe = Wardrobe()
            saveObjectToArchived(filePath.path!, wardrobeToSave: newWardrobe)
            return newWardrobe
        }
    }
    func loadAndCreateCloset() -> Wardrobe{
        let filePath = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        return loadArchivedObject(filePath)!
    }
    func save(funcCategory:String, funcSubCategory:String, item: Item)throws{
        if funcSubCategory == ""{throw ItemError.IncorrectSubCategory}
        
        let keysOfCategory = Array(selectedCloset[funcCategory]!.keys)
        let isKeyNew = keysOfCategory.contains(funcSubCategory)
        
        item.category = funcCategory
        item.subCategory = funcSubCategory
        
        if !isKeyNew{
            self.selectedCloset[funcCategory]!.updateValue([Item](), forKey: funcSubCategory)
            print("Subcategory created: \(funcSubCategory)")
        }
        
        if (item.image == nil){//Add image if one is missing
            item.image = UIImage(named: BLANK_IMAGE_STRING)
        }
        
        if item.model != ""{//Appends item to subCategory else throws
            self.selectedCloset[funcCategory]![funcSubCategory]!.append(item)
            
            
            updateBrandCollectiion(item)
            
            print("Item Saved: \(item) \nTo: \(funcCategory)/\(funcSubCategory)")
        }else{throw ItemError.missingModelString}
        
        //Saves Wardrobe
        self.quickSave()
    }
    func quickSave(){
        let pathOfFile = fileInDocumentsDirectory(MYFITZ_ARCHIVE_FILE_STRING)
        saveObjectToArchived(pathOfFile.path!, wardrobeToSave: self)
    }
}


extension Wardrobe{
    //TODO: - Create sorting of alpabitized for wardrobe
    func sort(){
        //    for (_, value) in selectedCloset as CLOSET_TYPE!{
        //      for (secIndex, secValue) in value{
        //        secValue.sort()
        //        //        for arrayOfItems in secValue{
        //         arrayOfItems
        //        }
        //      }
        //    }
    }
    func setProgress(){
        //        progress = NSProgress()
        //        progress.totalUnitCount = -1
        //        progress.kind = NSProgressKindFile
        //        progress.setUserInfoObject(NSProgressFileOperationKindCopying, forKey: NSProgressFileOperationKindKey)
        //
        //
        
    }
    
    //Return functions
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
    
    //Delete Functions
    func deleteItem(funcCategory: String, funcSubCategory: String, item: Item){//Deletes item
        let array = self.selectedCloset[funcCategory]![funcSubCategory]!
        var num = 0
        for index in array{
            if index.isEqual(item){
                self.selectedCloset[funcCategory]![funcSubCategory]!.removeAtIndex(num++)
            }
        }
        
        selectedCloset[funcCategory]![funcSubCategory]! = array
        
        
        self.quickSave()
    }
    func deleteAt(funcCategory: String, funcSubCategory: String){//Deletes subCateogry row
        selectedCloset[funcCategory]!.removeValueForKey(funcSubCategory)
        quickSave()
    }
    func deleteAt(funcCategory: String, row: Int){//Deletes category row
        var array = Array(selectedCloset[funcCategory]!.keys)
        
        let key = array[row]
        selectedCloset[funcCategory]?.removeValueForKey(key)
        
        quickSave()
    }
    
    //Appending
    func appendItemAt(funcCategory: String, funcSubCategory: String, newItem: Item){
        selectedCloset[funcCategory]![funcSubCategory]!.append(newItem)
        quickSave()
    }
    func appendAt(funcCategory: String, funcSubCategory: String, newArrayForSubCategory: [Item]){
        
        
    }
    func appendAt(funcCategory: String, row: Int, newSubCategory: [String: [Item]]){
        
    }
    
    //Swaps Item from one place to another
    func swapItem(funcCategory:     String, funcSubCategory:     String,
        prevFuncCategory: String, prevFuncSubCategory: String,
        item: Item){//Deletes object from one place and adds it to another place
            selectedCloset[funcCategory]![funcSubCategory]?.append(item)
            
            deleteItem(prevFuncCategory, funcSubCategory: prevFuncSubCategory, item: item)
    }
    
    //Check for availibility
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
    
    //Gets count
    func getCountOfCategories(funcCategory: String)->Int{
        return selectedCloset[funcCategory]!.count
    }
    func getCountOfSubCategories(funcCategory: String, funcSubCategory: String)->Int{
        return selectedCloset[funcCategory]![funcSubCategory]!.count
    }
    func updateBrandCollectiion(item: Item){
        let brand = item.brand
        if !brandCollection.contains(brand)  && brand != ""{
            brandCollection.append(brand)
        }
    }
}

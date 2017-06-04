//
//  User+CoreDataClass.swift
//  MyFitZ
//
//  Created by Andre V on 5/8/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


public class User: NSManagedObject {
    
    func getItems()->NSSet{
        if self.closetType == closetTypeGlobal.closet{
            return (self.wardrobe?.firstObject as! Wardrobe!).items!
            
        }else if self.closetType == closetTypeGlobal.wishList{
            return (self.wardrobe?.lastObject as! Wardrobe!).items!
        }else{
            fatalError("Wrong closet type entered Closet Value:  \(self.closetType)")
        }
        return NSSet()
    }
    
    class func createUsers(){
        let context = DataBaseController.getContext()
        let user1 = User(context: context)
        user1.name = "User1"
        user1.isBoy = true
        user1.age = 18
        user1.name = "User1"
        user1.closetType = closetTypeGlobal.closet
        //User2
        let user2 = User(context: context)
        user2.name = "User2"
        user2.isBoy = false
        user2.age = 13
        user2.name = "User2"
        user2.closetType = closetTypeGlobal.wishList
        
         //Wardrobe Creation
        let wardrobe1 = Wardrobe(context: user1.managedObjectContext!)
        let wardrobe2 = Wardrobe(context: user1.managedObjectContext!)
        
        let wardrobe1b = Wardrobe(context: user2.managedObjectContext!)
        let wardrobe2b = Wardrobe(context: user2.managedObjectContext!)
        
        //Item Creation
        let items1 = Item(context: wardrobe1.managedObjectContext!) as Item
        items1.category = "N/A"
        items1.subCategory = "N/A"
        let items2 = Item(context: wardrobe1.managedObjectContext!)
        items2.category = "N/A"
        items2.subCategory = "N/A"
        let items3 = Item(context: wardrobe1b.managedObjectContext!)
        items3.category = "N/A"
        items3.subCategory = "N/A"
        let items4 = Item(context: wardrobe2b.managedObjectContext!)
        items4.category = "N/A"
        items4.subCategory = "N/A"
        
        
        
        //Entity Bonding
        wardrobe1.addToItems(items1)
        wardrobe2.addToItems(items2)
        wardrobe1b.addToItems(items3)
        wardrobe2b.addToItems(items4)
        
        
        
        user1.addToWardrobe(wardrobe1)
        user1.addToWardrobe(wardrobe2)
        
        user2.addToWardrobe(wardrobe1b)
        user2.addToWardrobe(wardrobe2b)
        
        
        do{
            try context.save()
            
        }catch{
            log.warning("Save failed")
            
        }
//        
//        var users = [NSManagedObject]()
//        
//        do{
//            users = try context.fetch(User.fetchRequest()) as [NSManagedObject]
//            log.info(users)
//            
//        }catch{
//            log.verbose("Context failed")
//            
//        }
        
    }
    
}

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
    
//    @objc func getItems()->NSSet{
//        log.verbose(#function)
//        if self.closetType == closetTypeGlobal.closet{
//            return self.getWardrobe().items!
//            
//        }else if self.closetType == closetTypeGlobal.wishList{
//            return self.getWardrobe().items!
//        }else{
//            fatalError(
//                """
//                Wrong closet entered
//                Closet Value:  \(self.closetType)
//                """
//            )
//        }
//        return NSSet()
//    }
//    @objc func getWardrobe()->Wardrobe{
//        log.verbose(#function)
//        if self.closetType == closetTypeGlobal.closet{
//            //            var warArray = self.wardrobe?.allObjects as [Wardrobe]!
//            //            for currWardrobe in warArray!{
//            //                if currWardrobe.type == WardrobeType.closet.rawValue{
//            //                    return currWardrobe
//            //                }else if currWardrobe.type == WardrobeType.wants.rawValue{
//            //                    return currWardrobe
//            //                }
//            //                            }
//            return self.wardrobe?.firstObject as! Wardrobe
//        }else if self.closetType == closetTypeGlobal.wishList{
//            return self.wardrobe?.lastObject as! Wardrobe
//        }else{
//            log.warning("Shouldn't Happen")
//            return Wardrobe()
//        }
//    }
    
    @objc class func createUsers(){
        log.verbose(#function)
        let context = DataBaseController.getContext()
        let user1 = User(context: context)
        user1.name = "User1"
        user1.position = 0
        user1.isBoy = true
        user1.age = 18
        user1.closetType = closetTypeGlobal.closet
        //User2
        let user2 = User(context: context)
        user2.name = "User2"
        user2.position = 1
        user2.isBoy = false
        user2.age = 13
        user2.closetType = closetTypeGlobal.wishList
        
        //Wardrobe Creation
        let wardrobe1 = Wardrobe(context: user1.managedObjectContext!)
        let wardrobe2 = Wardrobe(context: user1.managedObjectContext!)
        wardrobe1.type = WardrobeType.closet.rawValue
        wardrobe2.type = WardrobeType.wants.rawValue
        
        let wardrobe1b = Wardrobe(context: user2.managedObjectContext!)
        let wardrobe2b = Wardrobe(context: user2.managedObjectContext!)
        wardrobe1b.type = WardrobeType.closet.rawValue
        wardrobe2b.type = WardrobeType.wants.rawValue
//        
        //Item Creation
        let items1 = Item(context: wardrobe1.managedObjectContext!) as Item
        items1.category = "N/A"
        items1.subCategory = "N/A"
        let items2 = Item(context: wardrobe2.managedObjectContext!) as Item
        items2.category = "N/A"
        items2.subCategory = "N/A"
        let items3 = Item(context: wardrobe1b.managedObjectContext!) as Item
        items3.category = "N/A"
        items3.subCategory = "N/A"
        let items4 = Item(context: wardrobe2b.managedObjectContext!) as Item
        items4.category = "N/A"
        items4.subCategory = "N/A"
        

        do{
            try context.save()
        }catch{
            print("Didn't save")
        }

        wardrobe1.addToItems(items1)
        wardrobe2.addToItems(items2)
        wardrobe1b.addToItems(items3)
        wardrobe2b.addToItems(items4)

        user1.addToWardrobe(wardrobe1)
        user1.addToWardrobe(wardrobe2)
        user2.addToWardrobe(wardrobe1b)
        user2.addToWardrobe(wardrobe2b)
        //        wardrobe1.user = user1
        //        wardrobe2.user = user1
        //        wardrobe1b.user = user2
        //        wardrobe2b.user = user2
        
        
        //FIXME: - Fix this core data issue
        //        user1.addToWardrobe(wardrobe1)
        //        user1.addToWardrobe(wardrobe2)
        //
        //        user2.addToWardrobe(wardrobe1b)
        //        user2.addToWardrobe(wardrobe2b)
        
        
        do{
            try context.save() 
            
//            let fetch: NSFetchRequest<User> = User.fetchRequest()
//            fetch.returnsObjectsAsFaults = false
//            let asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetch, completionBlock: nil)//Retrives fetch request Asyncorounously
//            let results = try DataBaseController.getContext().fetch(fetch)
//            print(results)
        }catch{
            log.error("Save failed")
            
        }
        log.debug("Save Succeded")
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

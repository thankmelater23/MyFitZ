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
            return (self.wardrobe?.array[0] as! Wardrobe!).items!
    
        }else if self.closetType == closetTypeGlobal.wishList{
                return (self.wardrobe?.array[1] as! Wardrobe!).items!
        }else{
            fatalError("Wrong closet type entered Closet Value:  \(self.closetType)")
        }
        return NSSet()
    }
    
    func getWardrobe()->Wardrobe{
        if self.closetType == closetTypeGlobal.closet{
            return self.wardrobe?.firstObject as! Wardrobe
            
        }else if self.closetType == closetTypeGlobal.wishList{
            return self.wardrobe?.lastObject as! Wardrobe
        }else{
            fatalError("Wrong closet type entered Closet Value:  \(self.closetType)")
        }
        return Wardrobe()
    }
}

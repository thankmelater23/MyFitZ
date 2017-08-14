//
//  User+CoreDataProperties.swift
//  MyFitZ
//
//  Created by Andre V on 5/7/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var wardrobe: Wardrobe?

}

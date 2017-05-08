//
//  User+CoreDataProperties.swift
//  MyFitZ
//
//  Created by Andre V on 5/8/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var isOver12: Bool
    @NSManaged public var isOver17: Bool
    @NSManaged public var wardrobe: Wardrobe?

}

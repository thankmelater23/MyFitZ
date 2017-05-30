//
//  User+CoreDataProperties.swift
//  MyFitZ
//
//  Created by Andre V on 5/26/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var isBoy: Bool
    @NSManaged public var isOver12: Bool
    @NSManaged public var isOver17: Bool
    @NSManaged public var name: String?
    @NSManaged public var closetType: Int16
    @NSManaged public var wardrobe: NSOrderedSet?

}

// MARK: Generated accessors for wardrobe
extension User {

    @objc(insertObject:inWardrobeAtIndex:)
    @NSManaged public func insertIntoWardrobe(_ value: Wardrobe, at idx: Int)

    @objc(removeObjectFromWardrobeAtIndex:)
    @NSManaged public func removeFromWardrobe(at idx: Int)

    @objc(insertWardrobe:atIndexes:)
    @NSManaged public func insertIntoWardrobe(_ values: [Wardrobe], at indexes: NSIndexSet)

    @objc(removeWardrobeAtIndexes:)
    @NSManaged public func removeFromWardrobe(at indexes: NSIndexSet)

    @objc(replaceObjectInWardrobeAtIndex:withObject:)
    @NSManaged public func replaceWardrobe(at idx: Int, with value: Wardrobe)

    @objc(replaceWardrobeAtIndexes:withWardrobe:)
    @NSManaged public func replaceWardrobe(at indexes: NSIndexSet, with values: [Wardrobe])

    @objc(addWardrobeObject:)
    @NSManaged public func addToWardrobe(_ value: Wardrobe)

    @objc(removeWardrobeObject:)
    @NSManaged public func removeFromWardrobe(_ value: Wardrobe)

    @objc(addWardrobe:)
    @NSManaged public func addToWardrobe(_ values: NSOrderedSet)

    @objc(removeWardrobe:)
    @NSManaged public func removeFromWardrobe(_ values: NSOrderedSet)

}

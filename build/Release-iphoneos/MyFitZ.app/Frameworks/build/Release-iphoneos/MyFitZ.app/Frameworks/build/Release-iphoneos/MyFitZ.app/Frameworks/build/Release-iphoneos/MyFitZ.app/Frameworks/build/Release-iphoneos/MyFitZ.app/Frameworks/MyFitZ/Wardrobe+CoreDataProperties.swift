//
//  Wardrobe+CoreDataProperties.swift
//  MyFitZ
//
//  Created by Andre V on 5/7/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


extension Wardrobe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wardrobe> {
        return NSFetchRequest<Wardrobe>(entityName: "Wardrobe")
    }

    @NSManaged public var items: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for items
extension Wardrobe {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Item)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Item)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

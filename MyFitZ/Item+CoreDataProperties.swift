//
//  Item+CoreDataProperties.swift
//  MyFitZ
//
//  Created by Andre V on 6/4/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var brand: String?
    @NSManaged public var category: String?
    @NSManaged public var dateDeleted: NSDate?
    @NSManaged public var id: Int16
    @NSManaged public var image: NSData?
    @NSManaged public var index: Int16
    @NSManaged public var isFavorite: Bool
    @NSManaged public var itemNotes: String?
    @NSManaged public var lastTimeWorn: NSDate?
    @NSManaged public var model: String?
    @NSManaged public var price: Double
    @NSManaged public var subCategory: String?
    @NSManaged public var timesWorn: Int16
    @NSManaged public var wardrobe: Wardrobe?

}

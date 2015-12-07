//
//  Equatables.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/6/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import Foundation


//MARK: -Equatable-Item Extension
func ==(lhs: Wardrobe, rhs: Wardrobe) -> Bool{
    return (lhs.favoritedItems == rhs.favoritedItems)
}


//MARK: -Equatable-Item Extension
func ==(lhs: Item, rhs: Item) -> Bool{
    return (
            lhs.category == rhs.category &&
            lhs.subCategory == rhs.subCategory &&
            lhs.id == rhs.id &&
            lhs.model == rhs.model
    )
}


//MARK: -Equatable-Fit Extension
func ==(lhs: Fit, rhs: Fit) -> Bool{
    return (
            lhs.p1.id == rhs.p1.id &&
            lhs.p2.id == rhs.p2.id &&
            lhs.p3.id == rhs.p3.id &&
            lhs.p4.id == rhs.p4.id &&
            lhs.p5.id == rhs.p5.id &&
            lhs.p6.id == rhs.p6.id &&
            lhs.p7.id == rhs.p7.id &&
            lhs.p8.id == rhs.p8.id &&
            lhs.p9.id == rhs.p9.id &&
            lhs.p10.id == rhs.p10.id
    )
}
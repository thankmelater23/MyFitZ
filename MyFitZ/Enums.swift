//
//  Enums.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 1/18/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation

//MARK: -App Enums
enum ItemError:Error{
    //    case MissingInfo
    case incorrectSubCategory
    case missingModelString
    case addImage
    //    case Missing(someInt: Int)
}


//MARK: -Modes of Enums
enum WearMode:Int{
    case worn
    case notWorn
}

enum GotMode:Int{
    case gotIt
    case stillDontHaveIt
    case takingIt
}

enum CreateItemStages: Int{
    case stageNoImage
    case stageNoCategory
    case stageNoSubCategory
    case stageNoModel
}

enum WardrobeType: String{
    case closet = "closet"
    case wants = "wants"
}

//
//  Structs.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 1/18/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import UIKit



struct CateogryTypes{
    let TOPS = "Tops"
    let BOTTOMS = "Bottoms"
    let HEADWARE = "Headware"
    let FOOTWARE =  "Footware"
    let ACCESSORIES = "Accessories"
    let UNDERCLOTHING = "Underclothing"
}
let CateogryType = CateogryTypes()


//MARK: -Segue identifiers
struct Segues{
    let SEGUE_MAIN_TO_SELECTION      = "mainToSelection"
    let SEGUE_MAIN_TO_FITMAKER       = "mainToFitMaker"
    let SEGUE_SELECTION_TO_MAKE      = "selectionToMake"
    let SEGUE_SELECTION_TO_MAIN      = "selectionToMain"
    let SEGUE_SELECTION_TO_RECENT    = "selectionToRecent"
    let SEGUE_SELECTION_TO_CREATION  = "selectionToCreation"
    let SEGUE_SELECTION_TO_FAVORITED = "selectionToFavorited"
    let SEGUE_MAKE_TO_MODEL          = "makeToModel"
    let SEGUE_MAKE_TO_SELECTION      = "makeToSelection"
    let SEGUE_MAKE_TO_CREATION       = "makeToCreation"
    let SEGUE_MODEL_TO_DETAIL        = "modelToDetailed"
    let SEGUE_MODEL_TO_MAKE          = "modelToMake"
    let SEGUE_MODEL_TO_CREATION      = "modelToCreation"
    let SEGUE_RECENT_TO_SELECTION    = "recentToSelection"
    let SEGUE_RECENT_TO_DETAIL       = "recentToDetail"
    let SEGUE_FAVORITED_TO_SELECTION = "favoritedToSelection"
    let SEGUE_FAVORITED_TO_DETAIL   = "favoritedToDetail"
    let SEGUE_CREATION_TO_MAIN      = "creationToMain"
    let SEGUE_CREATION_TO_MAKE      = "creationToMake"
    let SEGUE_CREATION_TO_MODEL     = "creationToModel"
    let SEGUE_CREATION_TO_DETAIL    = "creationToDetail"
    let SEGUE_CREATION_TO_SELECTION = "creationToSelection"
    let SEGUE_DETAIL_TO_EDIT        = "detailToEdit"
    let SEGUE_DETAIL_TO_MODEL       = "detailedToModel"
    let SEGUE_DETAIL_TO_CREATION    = "detailedToCreation"
    let SEGUE_DETAIL_TO_SELECTION   = "detailToSelection"
    let SEGUE_DETAILED_TO_FAVORITED = "detailToFavorite"
    let SEGUE_DETAIL_TO_RECENT      = "detailToRecent"
    let SEGUE_DETAILED_TO_IMAGE     = "detailToImage"
    let SEGUE_EDIT_TO_SELECTION     = "editToSelection"
    let SEGUE_TRASH_TO_SELECTION    = "trashToSelection"
    let SEGUE_TRASH_TO_DETAIL       = "trashToDetail"
    let SEGUE_SELECTION_TO_TRASH    = "selectionToTrash"
    let SEGUE_SEARCH_TO_DETAIL        = "searchToDetail"
    let SEGUE_IMAGE_TO_DETAIL         = "imageToDetail"
    let SEGUE_SELECTION_TO_PERCENTAGE = "selectionToPercentage"
    let SEGUE_PERCENTAGE_TO_SELECTION = "percentToSelection"
    let SEGUE_MAIN_TO_OPTIONS         = "mainToOptions"
    let SEGUE_OPTIONS_TO_HELP         = "optionsToHelp"
    let SEGUE_HELP_TO_INSTRUCTIONS    = "helpToInstructions"
    let SEGUE_MAIN_TO_OPTION_INSTRUCTIONS   = "mainToOptionInstructions"
}
let Segue = Segues()


//MARK: -Cell identifiers
struct CELL_IDENTIFIERS{
    let MAKE_CELL                   = "makeCell"
    let MODEL_CELL                  = "modelCell"
    let CREATION_CELL               = "creationCell"
    let DOUBLE_LABEL_CELL           = "doubleLabel"
    let TEXT_INPUT_CELL             = "textInputCell"
    let FAVORITED_CELL              = "favoritedCell"
    let RECENTLY_CELL               = "recentlyWornCell"
    let TRASH_CELL                  = "trashCell"
    let STATS_CELL                  = "statsCell"
}
let CellIdentifier = CELL_IDENTIFIERS()


///MARK: - Item Settings
//MARK: -Required
struct ItemAttributeNames{
    let ITEM_BRAND_STRING        = "Brand"
    let ITEM_MODEL_STRING        = "Model"
    let ITEM_CATEGORY_STRING     = "Category"
    let ITEM_SUBCATEGORY_STRING  = "Sub-Category"
    let ITEM_INDEX_STRING        = "Index"
    let ITEM_PRICE_STRING        = "Original Price"
    let ITEM_IMAGENAME_STRING    = "Image Name"
    let ITEM_FAVORITED_STRING    = "Favorited"
    let ITEM_ISTHISNEW_STRING    = "New Item"
    let ITEM_TIMESWORN_STRING    = "Times Worn"
    let ITEM_LASTTIMEWORN_STRING = "Last Time Worn"
    let ITEM_IMAGE_STRING        = "Image"
    let ITEM_KIND_STRING        = "Kind"
    let ITEM_SIZE_STRING        = "Size"
    let ITEM_ID_STRING        = "ID"
    
    //MARK: -Optional
    let ITEM_DATEPURCHASERD_STRING = "Date Purchased"
    let ITEM_COLOR_STRING          = "Primary Color"
    let ITEM_SECONDARYCOLOR_STRING = "Secondary Color"
    let ITEM_THIRDCOLOR_STRING = "Third Color"
    let ITEM_DATERELEASED_STRING = "Date Released"
    let ITEM_ITEMNOTES_STRING = "Item Note"
    let ITEM_CONDITION_STRING = "Condition"
    let ITEM_PRIMARYMATERIAL_STRING = "Primary Material"
    let ITEM_SECONDAY_MATERIAL_STRING = "Secondary Material"
    let ITEM_RETAILPRICE_STRING = "Payed Price"
    let ITEM_STORELURL_STRING = "Store URL/Website"
    let ITEM_STORELOCATION_STRING = "Store Location"
    let ITEM_SELLERNAME_STRING        = "Seller Name"
    let ITEM_LOCATIONPATH_STRING   = "Location Path"
}
let ItemAttributeName = ItemAttributeNames()


//MARK: -Color Settings
struct UI_OBJECT_COLORS{
    let imageBorder = UIColor.init(patternImage: UIImage(named: "cellRedRedBG")!).CGColor
}
let UIObjectColors: UI_OBJECT_COLORS = UI_OBJECT_COLORS()


struct COMPANY_COLORS{
    let primary = UIColor.greenColor()
    let secondary = UIColor.purpleColor()
    let third = UIColor.blueColor()
}
let CompanyColors = COMPANY_COLORS()


//MARK: -App Path types
struct PathTypes{
    let PATHTYPE_CLOSET_STRING      = "Closet"
    let PATHTYPE_ID_STRING          = "ID"
    let PATHTYPE_CATEGORY_STRING    = "Category"
    let PATHTYPE_SUBCATEGORY_STRING = "SubCategory"
    let PATHTYPE_INDEX_STRING       = "Index"
}
let PathType = PathTypes()
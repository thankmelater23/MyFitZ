//
//  Constants_Colors_And_Textures.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/20/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit

struct HighlightColors{
    let priorityLow = UIColor.yellow
    let priorityMid = UIColor.orange
    let priorityHigh = UIColor.red
    let cleared = UIColor.green
    let completed = UIColor.blue
}
let HighlightColor: HighlightColors = HighlightColors()

//struct BBS_TEXTURES{
let Jean = UIColor.init(patternImage: UIImage(named: "blueJeanTexture")!)
let Jean2 = UIColor.init(patternImage: UIImage(named: "ruffJeanTexture")!)
let BlueJean = UIColor.init(patternImage: UIImage(named: "blueJeanTexture")!)
let DarkBlueJean = UIColor.init(patternImage: UIImage(named: "darkBlueJean")!)
let Cotton = UIColor.init(patternImage: UIImage(named: "blueCotton")!)
let WhiteFur = UIColor.init(patternImage: UIImage(named: "whiteFurTexture")!)
let Stitching = UIColor.init(patternImage: UIImage(named: "leatherStitchingTexture")!)
let HartsPattern = UIColor.init(patternImage: UIImage(named: "hartsPattern")!)
let Gold = UIColor.init(patternImage: UIImage(named: "goldTexture")!)
let DirtyCloth = UIColor.init(patternImage: UIImage(named: "dirtyClothTexture")!)
let WrinkledCloth = UIColor.init(patternImage: UIImage(named: "wrinkledTexture")!)
let BraidedRope = UIColor.init(patternImage: UIImage(named: "braidedRopeTexture")!)
let BlackSued = UIColor.init(patternImage: UIImage(named: "blackSuedTexture")!)
let Polyester = UIColor.init(patternImage: UIImage(named: "bluePolyester")!)
let BlueCotton = UIColor.init(patternImage: UIImage(named: "darkBlueConttonTexture")!)
let FloorTexture = UIColor.init(patternImage: UIImage(named: "floorTexture2")!)
let RawGoldTexture = UIColor.init(patternImage: UIImage(named: "rawGoldTexture")!)
let LeatherTexture = UIColor.init(patternImage: UIImage(named: "leatherTextureCracked")!)
let SpecialLeatherTexture = UIColor.init(patternImage: UIImage(named: "SpecialLeather")!)
let RedClothTexture = UIColor.init(patternImage: UIImage(named: "redCottonTexture")!)
let RedBunchedUpSilkSheet = UIColor.init(patternImage: UIImage(named: "redBunchedupSilkSheets")!)
let SiliverSilkSheet = UIColor.init(patternImage: UIImage(named: "silverSilkTexture")!)
let PaperTexture = UIColor.init(patternImage: UIImage(named: "paperTexture")!)
let BrownLeatherStitching = UIColor.init(patternImage: UIImage(named: "BrownLeatherStitching")!)
let MyFitZBorder = UIColor.init(patternImage: UIImage(named: "MyFitZBorder")!)
let WhiteKnittedTextureVerticle = UIColor.init(patternImage: UIImage(named: "whiteKnittedTextureVerticle")!)
let BlurredGlass = UIColor.init(patternImage: UIImage(named: "greenButton")!)
let DiamondTexture = UIColor.init(patternImage: UIImage(named: "diamondTexture")!)
let GreenWool = UIColor.init(patternImage: UIImage(named: "greenWool")!)
let RedWool = UIColor.init(patternImage: UIImage(named: "redWool")!)
let BlueWool = UIColor.init(patternImage: UIImage(named: "blueWool")!)
let YellowWool = UIColor.init(patternImage: UIImage(named: "yellowWool")!)
let HardSandTexture = UIColor.init(patternImage: UIImage(named: "hardSandTexture")!)
let StarCloudsTexture = UIColor.init(patternImage: UIImage(named: "starCloudsTexture")!)
let PopulatedStarsTexture = UIColor.init(patternImage: UIImage(named: "populatedStarsTexture")!)
//    init(){
//        NSLog("Texures Initialized" + String(self))
//    }
//}
//let Textures: BBS_TEXTURES = BBS_TEXTURES()

class ThemeColors{
    let ViewBackGround = Cotton
    let SubViewBackGround = BraidedRope
    let FeatureButton = Jean
    let OptionButton = Polyester
    let Image = WhiteFur
    let CellBorder = Stitching
    let viewsBorder = Stitching
}
let ThemeColor: ThemeColors = ThemeColors()

class AppImages{
    let tuxedo = UIImage(named: "tuxedo")
}
let AppImage: AppImages = AppImages()

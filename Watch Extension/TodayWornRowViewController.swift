//
//  TodayWornRowViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 5/30/16.
//  Copyright © 2016 Bang Bang Studios. All rights reserved.
//

import Foundation
import WatchKit

class TodayWornRowViewController: NSObject{
    
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var brand: WKInterfaceLabel!
    @IBOutlet var model: WKInterfaceLabel!
    @IBOutlet var category: WKInterfaceImage!
    @IBOutlet var favorited: WKInterfaceButton!
    @IBOutlet var price: WKInterfaceLabel!
    
    var item: WatchItem?{
        didSet{
            if let item = item{
                model.setText(item.model)
                price.setText("$:\(item.payedPrice!)")
                var categoryImage = UIImage()
                
                switch category{
                case TOPS:
                    categoryImage = UIImage(named: "TopImage")!
                case BOTTOMS:
                    categoryImage = UIImage(named: "bottomsImage")!
                case FOOTWARE:
                    categoryImage = UIImage(named: "shoewareImage")!
                case HEADWARE:
                    categoryImage = UIImage(named: "headwareImage")!
                case ACCESSORIES:
                    categoryImage = UIImage(named: "accessoriesImage")!
                case UNDERCLOTHING:
                    categoryImage = UIImage(named: "underclothersImage")!
                default:
                    categoryImage = UIImage(named: "blank image")!
                }
                
                let starImage = (item.favorited != nil) ? UIImage(named: "star_on")! : UIImage(named: "star_off")!
                
                category.setImage(categoryImage)
                image.setImage(categoryImage)
                favorited.setBackgroundImage(starImage)
            }
        }
    }
}
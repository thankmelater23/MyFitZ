//
//  FavoriteListRowController.swift
//
//
//  Created by Andre Villanueva on 5/25/16.
//
//

import Foundation
import WatchKit

class FavoriteListRowController: NSObject{
    
    @IBOutlet var image: WKInterfaceImage!
    @IBOutlet var brand: WKInterfaceLabel!
    @IBOutlet var model: WKInterfaceLabel!
    @IBOutlet var category: WKInterfaceImage!
    @IBOutlet var wear: WKInterfaceButton!
    @IBOutlet var favorited: WKInterfaceButton!
    @IBOutlet var price: WKInterfaceLabel!
    @IBOutlet var lastTimeWorn: WKInterfaceLabel!
    
    var item: WatchItem?{
        didSet{
            if let item = item{
                image.setImage(UIImage(named: "TopImage"))
                model.setText(item.model)
                lastTimeWorn.setText(item.lastTimeWorn)
                price.setText("\(item.payedPrice)")
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
                favorited.setBackgroundImage(starImage)
            }
        }
    }
}

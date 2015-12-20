//
//  ModelCustomCell.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

//MARK: -ModelCustomCell Class
class ModelCustomCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet weak var modelImage: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var timesWornLabel: UILabel!
    @IBOutlet weak var star: UIImageView!
    
    
    
    //MARK: -View Methods
    override func  awakeFromNib(){
        super.awakeFromNib()
        self.animateView()
    }
    override func setSelected(selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
}



//MARK: -Initializers
extension ModelCustomCell{
    func setCell(modelImageText: UIImage, brandLabelText: String , modelLabelText: String, lastTimeWornText: String, favorited: Bool){
        self.modelImage.image    = modelImageText
        self.brandLabel.text     = brandLabelText
        self.modelLabel.text     = modelLabelText
        self.timesWornLabel.text = "Last Time Worn: \(lastTimeWornText)"
        
        self.setFavoritedStar(favorited)
        
    }
    func setFavoritedStar(fav: Bool){
        if fav == true{
            star.image = UIImage(named: "star_on")
        }else{
            star.image = UIImage(named: "star_off")
        }
    }
}



//MARK: -Animations-ViewController Extension
extension ModelCustomCell{
    func animateView(){
        optionViewCustomized(self.star)
    }
}
 
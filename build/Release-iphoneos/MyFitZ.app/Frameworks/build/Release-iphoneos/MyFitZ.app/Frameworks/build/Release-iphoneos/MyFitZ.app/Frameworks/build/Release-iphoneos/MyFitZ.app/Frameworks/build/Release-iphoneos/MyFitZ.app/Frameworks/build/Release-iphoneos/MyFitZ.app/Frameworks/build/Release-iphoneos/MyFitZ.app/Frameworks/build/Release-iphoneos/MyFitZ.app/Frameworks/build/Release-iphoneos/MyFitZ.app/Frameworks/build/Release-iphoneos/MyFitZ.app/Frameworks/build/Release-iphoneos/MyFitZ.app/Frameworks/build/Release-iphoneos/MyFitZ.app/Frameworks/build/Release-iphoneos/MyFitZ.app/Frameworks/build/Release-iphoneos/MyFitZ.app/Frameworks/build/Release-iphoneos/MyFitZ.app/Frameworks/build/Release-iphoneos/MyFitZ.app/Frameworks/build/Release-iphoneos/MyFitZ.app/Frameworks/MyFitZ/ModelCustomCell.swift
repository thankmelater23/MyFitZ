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
    }
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.cgColor
    }
    func customizeView(){
        self.backgroundColor = Jean2
        self.borderCustomization()
    }
    
}



//MARK: -Initializers
extension ModelCustomCell{
    func setCell(_ modelImageText: UIImage, brandLabelText: String , modelLabelText: String, lastTimeWornText: String, favorited: Bool){
        self.modelImage.image    = modelImageText
        self.brandLabel.text     = brandLabelText
        self.modelLabel.text     = modelLabelText
        self.timesWornLabel.text = "Last Time Worn: \(lastTimeWornText)"
        
        self.setFavoritedStar(favorited)
        self.animateView()
        self.customizeView()
        
    }
    func setFavoritedStar(_ fav: Bool){
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
        CellButtons(self.star)
        categoryCellImageCustomization(self.imageView!)
    }
}
 

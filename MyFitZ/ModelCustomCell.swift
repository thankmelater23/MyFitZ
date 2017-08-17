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
<<<<<<< HEAD
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    @objc func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.cgColor
    }
    @objc func customizeView(){
=======
    override func setSelected(selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.ScaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.CGColor
    }
    func customizeView(){
>>>>>>> MyFitZOld/master
        self.backgroundColor = Jean2
        self.borderCustomization()
    }
    
}



//MARK: -Initializers
extension ModelCustomCell{
<<<<<<< HEAD
    @objc func setCell(_ modelImageText: UIImage, brandLabelText: String , modelLabelText: String, lastTimeWornText: String, favorited: Bool){
=======
    func setCell(modelImageText: UIImage, brandLabelText: String , modelLabelText: String, lastTimeWornText: String, favorited: Bool){
>>>>>>> MyFitZOld/master
        self.modelImage.image    = modelImageText
        self.brandLabel.text     = brandLabelText
        self.modelLabel.text     = modelLabelText
        self.timesWornLabel.text = "Last Time Worn: \(lastTimeWornText)"
        
        self.setFavoritedStar(favorited)
        self.animateView()
        self.customizeView()
        
    }
<<<<<<< HEAD
    @objc func setFavoritedStar(_ fav: Bool){
=======
    func setFavoritedStar(fav: Bool){
>>>>>>> MyFitZOld/master
        if fav == true{
            star.image = UIImage(named: "star_on")
        }else{
            star.image = UIImage(named: "star_off")
        }
    }
}



//MARK: -Animations-ViewController Extension
extension ModelCustomCell{
<<<<<<< HEAD
    @objc func animateView(){
=======
    func animateView(){
>>>>>>> MyFitZOld/master
        CellButtons(self.star)
        categoryCellImageCustomization(self.imageView!)
    }
}
<<<<<<< HEAD
 
=======
 
>>>>>>> MyFitZOld/master

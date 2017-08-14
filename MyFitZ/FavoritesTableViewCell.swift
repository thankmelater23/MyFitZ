//
//  FavoritesTableViewCell.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/15/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit


//MARK: -FavoritesTableViewCell Class
class FavoritesTableViewCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var lastTimeWorn: UILabel!
    @IBOutlet weak var row: UILabel!
    @IBOutlet weak var favoritedButton: UIButton!
    
    
    
    //MARK: -View Methods
    override func  awakeFromNib(){
        super.awakeFromNib()
        self.animateView()
    }
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
    @objc func setButtonImage(_ favorited: Bool){
        if favorited == true{
            self.favoritedButton.imageView?.image = UIImage(named: "star_on")
        }else{
            self.favoritedButton.imageView?.image = UIImage(named: "star_off")
        }
    }
    
    @objc func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Gold.cgColor
    }
    
    @objc func customizeView(){
        self.backgroundColor = PopulatedStarsTexture
        self.borderCustomization()
        
        featureCellImageCustomization(self.imageView!)
        CellButtons(self.favoritedButton)
    }
    
    @IBAction func favoritedSwitch() {
    }
}



//MARK: -Initializers
extension FavoritesTableViewCell{
    @objc func setCell(_ Image: UIImage, nameLabelText: String, brandLabelText: String, row: Int, lastTimeWorn: String, favorited: Bool){
        self.cellImage.image = Image
        self.name.text = nameLabelText
        self.brand.text = brandLabelText
        self.lastTimeWorn.text = "Date Worn: " + lastTimeWorn
        self.row.text = String(row + 1) + ":"
        self.setButtonImage(favorited)
        
        self.customizeView()
    }
}



//MARK: -Animations-FavoritesTableViewCell Extension
extension FavoritesTableViewCell{
    @objc func animateView(){
        
       CellButtons(self.favoritedButton)
    }
}

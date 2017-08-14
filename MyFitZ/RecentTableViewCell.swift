//
//  RecentTableViewCell.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/15/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit


//MARK: -RecentTableViewCell Class
class RecentTableViewCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var lastTimeWorn: UILabel!
    @IBOutlet weak var row: UILabel!
    @IBOutlet weak var wear: UIButton!
    
    
    
    //MARK: -View Methods
    override func  awakeFromNib(){
        super.awakeFromNib()
        self.animateView()
    }
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
    @objc func setWearButtonImage(_ worn: Bool){
        if worn == true{
            self.wear.alpha = 0.5
            self.wear.isUserInteractionEnabled = false
        }else{
            self.wear.alpha = 1.0
            self.wear.isUserInteractionEnabled = true
        }
    }
    @IBAction func wearButtonPressed() {
        
    }
    
    @objc func customizeView(){
        self.backgroundColor = WrinkledCloth
        self.borderCustomization()
        
        featureCellImageCustomization(self.imageView!)
        CellButtons(self.wear)
    }
}



//MARK: -Initializers
extension RecentTableViewCell{
    @objc func setCell(_ Image: UIImage, nameLabelText: String, brandLabelText: String, row: Int, lastTimeWorn: String){
        let date = Date()
        
        
        self.cellImage.image = Image
        self.name.text = nameLabelText
        self.brand.text = brandLabelText
        self.lastTimeWorn.text = "Date Worn: " + lastTimeWorn
        self.row.text = String(row + 1) + ":"
        
        if date.returnDaysInDate() > lastTimeWorn.returnDaysInDate(){
            self.setWearButtonImage(true)
        }else{
            self.setWearButtonImage(false)
        }
        
        self.customizeView()
    }
}


//MARK: -Animations-RecentTableViewCell Extension
extension RecentTableViewCell{
    @objc func animateView(){
        optionViewCustomized(self.wear)
    }
}

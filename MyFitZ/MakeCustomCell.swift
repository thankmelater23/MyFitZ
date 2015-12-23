//
//  MakeCustomCell.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit



//MARK: -MakeCustomCell Class
class MakeCustomCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet weak var makeImage: UIImageView!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    
    
    //MARK: -View Methods
    override func  awakeFromNib(){
        super.awakeFromNib()
        self.animateView()
        self.customizeView()
    }
    override func setSelected(selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    func customizeView(){
        self.backgroundColor = DarkBlueJean
        self.borderCustomization()
    }
    
    func borderCustomization(){
//        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.ScaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.CGColor
    }
    
}



//MARK: -Initializers
extension MakeCustomCell{
    func setCell(Image: UIImage, makeLabelText: String, numberOfItemsText: Int){
        self.makeImage.image = Image
        self.makeLabel.text = makeLabelText
        self.numberOfItemsLabel.text = "Items in \(makeLabelText): \(numberOfItemsText)"
        
        self.customizeView()
    }
}



//MARK: -Animations-ViewController Extension
extension MakeCustomCell{
    func animateView(){
        CellImagesButtons(self.makeImage)
    }
}
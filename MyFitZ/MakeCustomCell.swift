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
        
    }
<<<<<<< HEAD
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
    @objc func customizeView(){
=======
    override func setSelected(selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
    func customizeView(){
>>>>>>> MyFitZOld/master
        self.backgroundColor = DarkBlueJean
        self.borderCustomization()
    }
    
<<<<<<< HEAD
    @objc func borderCustomization(){
//        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.cgColor
=======
    func borderCustomization(){
//        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.ScaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.CGColor
>>>>>>> MyFitZOld/master
    }
    
}



//MARK: -Initializers
extension MakeCustomCell{
<<<<<<< HEAD
    @objc func setCell(_ Image: UIImage, makeLabelText: String, numberOfItemsText: Int){
=======
    func setCell(Image: UIImage, makeLabelText: String, numberOfItemsText: Int){
>>>>>>> MyFitZOld/master
        self.makeImage.image = Image
        self.makeLabel.text = makeLabelText
        self.numberOfItemsLabel.text = "Items in \(makeLabelText): \(numberOfItemsText)"
        
        self.animateView()
        self.customizeView()
    }
}



//MARK: -Animations-ViewController Extension
extension MakeCustomCell{
<<<<<<< HEAD
    @objc func animateView(){
        categoryCellImageCustomization(self.imageView!)
    }
}
=======
    func animateView(){
        categoryCellImageCustomization(self.imageView!)
    }
}
>>>>>>> MyFitZOld/master

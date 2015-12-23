//
//  DoubleLabelTableViewCell.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/14/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit



//MARK: -DoubleLabelTableViewCell Class
class DoubleLabelTableViewCell: UITableViewCell {
    //MARK: -Outlets
    ///The second label in the cell that holds the name of the info that will be displayed in the second label
    @IBOutlet var nameLabel: UILabel!
    ///The second label in the cell that holds information of the first labels name
    @IBOutlet var infoLabel: UILabel!
    
    
    
    //MARK: -View Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.ScaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.CGColor
    }
    
    func customizeView(){
        self.backgroundColor = GreenWool
        self.borderCustomization()
    }
}



//MARK: -Initializers
extension DoubleLabelTableViewCell{
    func configure(name name:  String,  infoString: String){
        nameLabel.text = name + ":"
        infoLabel.text = infoString
        self.customizeView()
        
    }
}
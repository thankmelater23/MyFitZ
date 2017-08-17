//  CreationUITableViewCell.swift
//
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit




//MARK: -CreationUITableViewCell Class
class CreationUITableViewCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet var textInputCellLabel: UILabel!
    @IBOutlet var textInputCellTextField: UITextField!
    
    
    
    //MARK: -View Methods
    @objc func configure(text: String?, labelString: String!, tag: Int){
        
        textInputCellTextField.text = String()
        textInputCellTextField.placeholder = labelString
        textInputCellLabel.text = labelString
        self.textInputCellTextField.tag = tag
        self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.unlessEditing
        
        self.customizeView()
    }
    
    @objc func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.cgColor
    }
    
    @objc func customizeView(){
        self.backgroundColor = FloorTexture
        self.borderCustomization()
    }
}

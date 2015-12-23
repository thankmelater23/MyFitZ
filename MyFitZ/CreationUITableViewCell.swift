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
    func configure(text text: String?, labelString: String!, tag: Int){
        
        textInputCellTextField.text = String()
        textInputCellTextField.placeholder = labelString
        textInputCellLabel.text = labelString
        self.textInputCellTextField.tag = tag
        self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.UnlessEditing
        
        self.customizeView()
    }
    
    func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.ScaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.CGColor
    }
    
    func customizeView(){
        self.backgroundColor = FloorTexture
        self.borderCustomization()
    }
}
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
<<<<<<< HEAD
    @objc func configure(text: String?, labelString: String!, tag: Int){
=======
    func configure(text text: String?, labelString: String!, tag: Int){
>>>>>>> MyFitZOld/master
        
        textInputCellTextField.text = String()
        textInputCellTextField.placeholder = labelString
        textInputCellLabel.text = labelString
        self.textInputCellTextField.tag = tag
<<<<<<< HEAD
        self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.unlessEditing
=======
        self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.UnlessEditing
>>>>>>> MyFitZOld/master
        
        self.customizeView()
    }
    
<<<<<<< HEAD
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
=======
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
>>>>>>> MyFitZOld/master

//
//  LongCreationUITableViewCell.swift
//  MyFitZ
//
//  Created by Andre V on 5/21/17.
//  Copyright © 2017 Bang Bang Studios. All rights reserved.
//

import UIKit




//MARK: -CreationUITableViewCell Class
class LongCreationUITableViewCell: UITableViewCell{
    //MARK: -Outlets
    @IBOutlet var textInputCellLabel: UILabel!
    @IBOutlet var textInputCellTextField: UITextField!
    
    
    
    //MARK: -View Methods
    func configure(text: String?, labelString: String!, tag: Int){
        
        textInputCellTextField.text = String()
        textInputCellTextField.placeholder = labelString
        textInputCellLabel.text = labelString
        self.textInputCellTextField.tag = tag
        self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.unlessEditing
        
        self.customizeView()
    }
    
    func borderCustomization(){
        //        self.layer.cornerRadius = self.frame.size.width / 10
        self.contentMode = UIViewContentMode.scaleToFill
        
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = Stitching.cgColor
    }
    
    func customizeView(){
        self.backgroundColor = FloorTexture
        self.borderCustomization()
    }
}

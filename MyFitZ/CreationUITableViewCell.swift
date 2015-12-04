//  CreationUITableViewCell.swift
//
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
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
    }
}
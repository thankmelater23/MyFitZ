//  CreationUITableViewCell.swift
//
//  My_Fitz
//
//  Created by Andre Villanueva on 4/3/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

class CreationUITableViewCell: UITableViewCell{
  @IBOutlet var textInputCellLabel: UILabel!
  @IBOutlet var textInputCellTextField: UITextField!

  func configure(text text: String?, labelString: String!, tag: Int){
    textInputCellTextField.text = text
    textInputCellTextField.placeholder = labelString
    textInputCellLabel.text = labelString
    self.textInputCellTextField.tag = tag
    self.textInputCellTextField.clearButtonMode = UITextFieldViewMode.WhileEditing

    magic("Creating cell: \ntext:\(self.textInputCellTextField.text)\ntag: \(tag)")

  }
}
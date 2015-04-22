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

  func configure(#text: String?, labelString: String!){
    textInputCellTextField.text = ""
    textInputCellTextField.placeholder = labelString
    textInputCellLabel.text = labelString

  }
}
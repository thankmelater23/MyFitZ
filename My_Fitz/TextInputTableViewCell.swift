//
//  TextInputTableViewCell.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 3/25/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell
{
  //MARK: - IBOutlet
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!

  func setCell(#text: String?, placeHolder: String, labelString: String)
  {
    textField.text = text
    textField.placeholder = placeHolder

    textField.accessibilityValue = text
    textField.accessibilityLabel = placeHolder

    label.text = labelString
  }

  func textFieldValue() -> String
  {
    if textField != nil
    {
      return textField.text as String
    }
  
}

  else 
  {
  return "N/A" as String
  }

}

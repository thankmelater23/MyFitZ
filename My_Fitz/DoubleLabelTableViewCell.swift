//
//  DoubleLabelTableViewCell.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 4/14/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit

class DoubleLabelTableViewCell: UITableViewCell {
  ///The second label in the cell that holds the name of the info that will be displayed in the second label
  @IBOutlet var nameLabel: UILabel!
  ///The second label in the cell that holds information of the first labels name
  @IBOutlet var infoLabel: UILabel!


  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }
}


extension DoubleLabelTableViewCell{

  func configure(#name:  String,  infoString: String){
    nameLabel.text = name
    infoLabel.text = infoString

  }
}
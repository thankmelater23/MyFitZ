//
//  ModelCustomCell.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit


class ModelCustomCell: UITableViewCell{
  @IBOutlet weak var modelImage: UIImageView!
  @IBOutlet weak var brandLabel: UILabel!
  @IBOutlet weak var modelLabel: UILabel!
  @IBOutlet weak var timesWornLabel: UILabel!


  override func  awakeFromNib(){
    super.awakeFromNib()
  }
  override func setSelected(selected: Bool, animated: Bool){
    super.setSelected(selected ,  animated: animated)
  }
  func setCell(modelImageText: UIImage, brandLabelText: String , modelLabelText: String, timesWornText: Int){
    self.modelImage.image    = modelImageText
    self.brandLabel.text     = brandLabelText
    self.modelLabel.text     = modelLabelText
    self.timesWornLabel.text = "Times Worn: \(timesWornText)"
  }
}

//
//  MakeCustomCell.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/13/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//

import UIKit


class MakeCustonCell: UITableViewCell
{
    @IBOutlet weak var makeImage: UIImageView!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    
    
    override func  awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected ,  animated: animated)
    }
    
    func setCell(makeImageText: String, makeLabelText: String, numberOfItemsText: Int)
    {
        self.makeImage.image = UIImage(named: makeImageText)
        self.makeLabel.text = makeLabelText
      self.numberOfItemsLabel.text = "Items in \(makeLabelText): \(numberOfItemsText)"
    }
}


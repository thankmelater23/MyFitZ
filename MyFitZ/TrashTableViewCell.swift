//
//  TrashTableViewCell.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/15/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit

//MARK: -TrashTableViewCell Class
class TrashTableViewCell: UITableViewCell{
    //MARK: -Outlets
    


    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var dateDeleted: UILabel!
    @IBOutlet weak var row: UILabel!
    @IBOutlet weak var favorite: UIImageView!
    
    
    
    //MARK: -View Methods
    override func  awakeFromNib(){
        super.awakeFromNib()
    }
<<<<<<< HEAD
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
    @objc func borderCustomization(){
=======
    override func setSelected(selected: Bool, animated: Bool){
        super.setSelected(selected ,  animated: animated)
    }
    
    func borderCustomization(){
>>>>>>> MyFitZOld/master
        CellImagesButtons(self.cellImage)
        
    }
    
<<<<<<< HEAD
    @objc func customizeView(){
=======
    func customizeView(){
>>>>>>> MyFitZOld/master
        self.backgroundColor = DirtyCloth
        self.borderCustomization()
    }
    
}



//MARK: -Initializers
extension TrashTableViewCell{
<<<<<<< HEAD
    @objc func setCell(_ Image: UIImage, nameLabelText: String, brandLabelText: String, row: Int, dateDeleted: String){
=======
    func setCell(Image: UIImage, nameLabelText: String, brandLabelText: String, row: Int, dateDeleted: String){
>>>>>>> MyFitZOld/master
        self.cellImage.image = Image
        self.name.text = nameLabelText
        self.brand.text = brandLabelText
        self.dateDeleted.text = dateDeleted//"Date Deleted: " + "xx-xx-xxxx"
        self.row.text = String(row + 1) + ":"
        
        self.customizeView()
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> MyFitZOld/master

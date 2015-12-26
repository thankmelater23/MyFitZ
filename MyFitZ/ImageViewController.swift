//
//  ImageViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/12/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var nameAndBrandBar: UILabel!
    var imageHolder:UIImage = UIImage()
    var itemName: String = String()
    var itemBrand: String = String()
    var item = Item()
    var path:[String: String] = [:]
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = Cotton
        self.image.image = self.imageHolder
        
        self.nameAndBrandBar.text = grabTitle(self.itemName, view: self.itemBrand)
        
        self.animateAllButtons()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            log.verbose("Segue transfer: \(segue.identifier)")
        }
        
        if segue.identifier == SEGUE_IMAGE_TO_DETAIL{
            let detailedViewController = segue.destinationViewController as! DetailedViewController
            
            detailedViewController.path = self.path
        }
        
}
}



//MARK: - UI-ImageViewController Extension
extension ImageViewController{
    func animateAllButtons(){
        self.animateLabel()
        //    self.animateStarButton()
        self.animateLogo()
        self.animateImage()
        //        self.animateViews()
        
    }
    func animateLogo(){
        
    }
    func animateLabel(){
        nameLabelCustomizer(self.itemLabel)
    }
    func animateImage(){
        imageCustomization(self.image)
    }
}
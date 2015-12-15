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
    
    var imageHolder:UIImage = UIImage()
    var path:[String: String] = [:]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.image.image = self.imageHolder
        
        self.animateAllButtons()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        defer{
            print("Segue transfer: \(segue.identifier)")
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
        //    self.animateSearchButton()
        //    self.animateStarButton()
        //    self.animateHamperButton()
        //    self.animateSearchButton()
        //    self.animatePictureLabels()
        //    self.animatePictureImages()
        //    self.animateNumberLabels()
        //    self.animateTrashButton()
        //    self.animateLogo()
        //        self.animateViews()
        
    }
    func animateLogo(){
        //    logoCustomization(self.logoImage)
    }
}
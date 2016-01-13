//
//  Options-Help-Instructions-PlayerViewController.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit

class Options_Help_Instructions_PlayerViewController: UIViewController {
    @IBOutlet weak var gifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playGif()
    }
    func playGif(){
        gifImage.image = UIImage.gifWithName("ViewItemInstructions")
    }
}

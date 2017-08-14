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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.playGif()
    }
    
    @objc func playGif(){
        let gif = UIImage.gifWithName("Instruction_CreateItem")
        gifImage.image = gif
        gifImage.contentMode = UIViewContentMode.center
        gifImage.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    @objc func playItemView(){
        let gif = UIImage.gifWithName("Instruction_CreateItem")
        gifImage.image = gif
        gifImage.contentMode = UIViewContentMode.center
        gifImage.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    deinit{
        //log.info(#function)
        
    }
}

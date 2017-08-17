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
    
<<<<<<< HEAD
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
=======
    override func viewDidAppear(animated: Bool) {
        self.playGif()
    }
    
    func playGif(){
        let gif = UIImage.gifWithName("Instruction_CreateItem")
        gifImage.image = gif
        gifImage.contentMode = UIViewContentMode.Center
        gifImage.contentMode = UIViewContentMode.ScaleAspectFill
    }
    
    func playItemView(){
        let gif = UIImage.gifWithName("Instruction_CreateItem")
        gifImage.image = gif
        gifImage.contentMode = UIViewContentMode.Center
        gifImage.contentMode = UIViewContentMode.ScaleAspectFill
>>>>>>> MyFitZOld/master
    }
    
    deinit{
        log.info(#function)
        
    }
}

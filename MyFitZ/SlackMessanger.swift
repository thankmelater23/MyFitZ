//
//  SlackMessanger.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 12/1/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import SlackTextViewController

class SlackMessanger: SLKTextViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
    }
    
    override init(tableViewStyle style: UITableViewStyle) {
        super.init(tableViewStyle: UITableViewStyle.Plain)
    }

    required init!(coder decoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  Extensions.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 8/31/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

//extension UIImage{
//    
//    enum AssetIdentifier: String{
//        case Player, Boss
//    }
//    convenience init!(assetIdentifier: AssetIdentifier){
//        self.init(named: assetIdentifier.rawValue)
//    }
//}
//
//let playerAss = UIImage(assetIdentifier: .Player)

extension String{
    func returnDaysInDate()->Int{
        let today = NSDate()
        let dateFormatter = NSDateFormatter()
        
        
        let cal = NSCalendar.currentCalendar()
        let unit:NSCalendarUnit = .Minute
        
        guard let date = dateFormatter.dateFromString(self) else{
            return 10000
        }
        
        let components = cal.components(unit, fromDate: date, toDate: today, options: .WrapComponents)
        
        return components.minute ?? 1000000000
    }
}
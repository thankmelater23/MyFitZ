//
//  Extensions.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 8/31/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func returnDaysInDate()->Int{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        guard let date = dateFormatter.dateFromString(self) else{
            return 10000
        }
        
        return date.returnDaysInDate()
    }
}
    extension NSDate{
        func returnDaysInDate()->Int{
            let today = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .ShortStyle
            
            let cal = NSCalendar.currentCalendar()
            let unit:NSCalendarUnit = .Day
            
            let date = self
            
            let components = cal.components(unit, fromDate: date, toDate: today, options: .WrapComponents)
            
            return components.day ?? 100000
        }
}
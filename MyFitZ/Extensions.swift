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

extension NSUserDefaults{
    func unNilInt(optionalInt: Int?)-> Int!{
        if optionalInt == nil{
            return 0
        }else{
            return optionalInt
        }
    }
    
    func add(num: Int)->Int{
         let number = self.unNilInt(num)
        return number+1
    }
    
    func sendToDefaults(path: String, num: Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(num, forKey: path)
    }
    
    func addAndSend(path: String){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var total:Int? = defaults.valueForKey(path) as! Int?
        if total == nil{
            total = unNilInt(total)
        }
        total = self.add(total!) as Int
        
        sendToDefaults(path, num: total!)
    }
    
    func returnIntValue(path:String)->Int!{
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var number = defaults.valueForKey(path) as! Int?
        number = unNilInt(number)
        return number
    }
}
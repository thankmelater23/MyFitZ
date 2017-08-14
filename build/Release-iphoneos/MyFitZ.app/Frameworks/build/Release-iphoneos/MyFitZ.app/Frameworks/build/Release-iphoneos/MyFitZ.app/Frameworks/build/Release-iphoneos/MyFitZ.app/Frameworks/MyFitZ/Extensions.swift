//
//  Extensions.swift
//  My_Fitz
//
//  Created by Andre Villanueva on 8/31/15.
//  Copyright © 2015 BangBangStudios. All rights reserved.
//

import Foundation
import UIKit



//MARK: -Extensions

//MARK: -String Extension
extension String{
    /**
     Transforms string into NSDate
     
     - returns: An integer of days between the strings date and today
     */
    func returnDaysInDate()->Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        guard let date = dateFormatter.date(from: self) else{
            return -1
        }
        
        return date.returnDaysInDate()
    }
}
extension Date{
    /**
     Gets amount of days from self(date) to now date
     
     - returns: The amount of days
     */
    func returnDaysInDate()->Int{
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let cal = Calendar.current
        let unit:NSCalendar.Unit = .day
        
        let date = self
        
        let components = (cal as NSCalendar).components(unit, from: date, to: today, options: .wrapComponents)
        
        return components.day ?? 100000
    }
}



//MARK: -NSUserDefaults Extensions
extension UserDefaults{
    /**
     Checks if int is nil
     
     - parameter optionalInt: An optional Integer
     
     - returns: The value from parameter or 0
     */
    func unNilInt(_ optionalInt: Int?)-> Int!{
        if optionalInt == nil{
            return 0
        }else{
            return optionalInt
        }
    }
    /**
     Removes nil if nil than add 1 to that value
     
     - parameter num: Number to increment value 1
     
     - returns: <#return value description#>
     */
    func add(_ num: Int)->Int{
         let number = self.unNilInt(num)
        return number!+1
    }
    /**
     Puts num value into path in NSUserDefaults
     
     - parameter path: String value to save to NSDefaults
     - parameter num:  Value to store in NSDefaults
     */
    func sendToDefaults(_ path: String, num: Int){
        
        
        defaults.set(num, forKey: path)
        
    }
    /**
     Gets value at path in NSUserDefaults and increment and put back at path
     
     - parameter path: String key to NSUserDefault
     */
    func addAndSend(_ path: String){
        
        
        var total:Int? = defaults.value(forKey: path) as! Int?
        if total == nil{
            total = unNilInt(total)
        }
        total = self.add(total!) as Int
        
        sendToDefaults(path, num: total!)
    }
    /**
     Returns value of Int at key for path in NSUserDefaults
     
     - parameter path: String key to NSUserDefaults
     
     - returns: Int from key of path in NSUserDefaults
     */
    func returnIntValue(_ path:String)->Int!{
        
        
        var number = defaults.value(forKey: path) as! Int?
        number = unNilInt(number)
        return number
    }
}

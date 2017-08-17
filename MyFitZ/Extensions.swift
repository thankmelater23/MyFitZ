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
<<<<<<< HEAD
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        guard let date = dateFormatter.date(from: self) else{
=======
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        guard let date = dateFormatter.dateFromString(self) else{
>>>>>>> MyFitZOld/master
            return -1
        }
        
        return date.returnDaysInDate()
    }
}
<<<<<<< HEAD
extension Date{
=======
extension NSDate{
>>>>>>> MyFitZOld/master
    /**
     Gets amount of days from self(date) to now date
     
     - returns: The amount of days
     */
    func returnDaysInDate()->Int{
<<<<<<< HEAD
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        let cal = Calendar.current
        let unit:NSCalendar.Unit = .day
        
        let date = self
        
        let components = (cal as NSCalendar).components(unit, from: date, to: today, options: .wrapComponents)
=======
        let today = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        
        let cal = NSCalendar.currentCalendar()
        let unit:NSCalendarUnit = .Day
        
        let date = self
        
        let components = cal.components(unit, fromDate: date, toDate: today, options: .WrapComponents)
>>>>>>> MyFitZOld/master
        
        return components.day ?? 100000
    }
}



//MARK: -NSUserDefaults Extensions
<<<<<<< HEAD
extension UserDefaults{
=======
extension NSUserDefaults{
>>>>>>> MyFitZOld/master
    /**
     Checks if int is nil
     
     - parameter optionalInt: An optional Integer
     
     - returns: The value from parameter or 0
     */
<<<<<<< HEAD
    func unNilInt(_ optionalInt: Int?)-> Int!{
=======
    func unNilInt(optionalInt: Int?)-> Int!{
>>>>>>> MyFitZOld/master
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
<<<<<<< HEAD
    @objc func add(_ num: Int)->Int{
         let number = self.unNilInt(num)
        return number!+1
=======
    func add(num: Int)->Int{
         let number = self.unNilInt(num)
        return number+1
>>>>>>> MyFitZOld/master
    }
    /**
     Puts num value into path in NSUserDefaults
     
     - parameter path: String value to save to NSDefaults
     - parameter num:  Value to store in NSDefaults
     */
<<<<<<< HEAD
    @objc func sendToDefaults(_ path: String, num: Int){
        
        
        defaults.set(num, forKey: path)
=======
    func sendToDefaults(path: String, num: Int){
        
        
        defaults.setInteger(num, forKey: path)
>>>>>>> MyFitZOld/master
        
    }
    /**
     Gets value at path in NSUserDefaults and increment and put back at path
     
     - parameter path: String key to NSUserDefault
     */
<<<<<<< HEAD
    @objc func addAndSend(_ path: String){
        
        
        var total:Int? = defaults.value(forKey: path) as! Int?
=======
    func addAndSend(path: String){
        
        
        var total:Int? = defaults.valueForKey(path) as! Int?
>>>>>>> MyFitZOld/master
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
<<<<<<< HEAD
    func returnIntValue(_ path:String)->Int!{
        
        
        var number = defaults.value(forKey: path) as! Int?
        number = unNilInt(number)
        return number
    }
}
=======
    func returnIntValue(path:String)->Int!{
        
        
        var number = defaults.valueForKey(path) as! Int?
        number = unNilInt(number)
        return number
    }
}
>>>>>>> MyFitZOld/master

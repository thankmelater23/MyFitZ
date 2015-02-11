//
//  SelectionViewController.swift
//  myFitz
//
//  Created by Andre Villanueva on 1/19/15.
//  Copyright (c) 2015 BangBangStudios. All rights reserved.
//
import UIKit

class SelectionViewController: UIViewController
{
    @IBAction func selectionType(sender: AnyObject)
    {
        var selectorString: String = sender.currentTitle as String!
        
        userDefaultsSetObjectForKey("selectorString", userDefValue: selectorString)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
    }
  
  func userDefaultsValueForKey(userDefaultKey: String) ->String
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as! String
    println("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")
    
    return selectorString
  }
  
  func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
  {
    var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.removeObjectForKey(userDefaultKey)
    userDefaults.setValue(userDefValue, forKey: userDefaultKey)
    NSUserDefaults.standardUserDefaults().synchronize()
    var selectorString: String = userDefaults.objectForKey(userDefaultKey) as! String
    
    println("userDefaultsSetObjectForKey: \(selectorString)")
    println("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
  }
}

//    func userDefaultsValueForKey(userDefaultKey: String) ->String
//    {
//        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        var selectorString: String = userDefaults.objectForKey("selectorString") as String
//        println("Key: \(userDefaultKey) forValue: \(selectorString) syncronized()")
//        
//        return selectorString
//    }
//    
//    func userDefaultsSetObjectForKey(userDefaultKey: String, userDefValue: String)
//    {
//        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        var selectorString: String = userDefaults.objectForKey("selectorString") as String
//        
//        println("userDefaultsSetObjectForKey Selector String: \(selectorString)")
//        userDefaults.removeObjectForKey(userDefaultKey)
//        NSUserDefaults.setValue(userDefValue, forKey: userDefaultKey)
//        NSUserDefaults.standardUserDefaults().synchronize()
//        println("Key: \(userDefaultKey) forValue: \(userDefValue) syncronized()")
//    }
//}

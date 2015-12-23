//
//  AppDelegate.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 10/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
//import Appsee//This is possibly crashing since its not working(issue found in crashylytics)



//MARK: -AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//MARK: -Variables
    var window: UIWindow?


    
//MARK: -Methods
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //MARK: -Crashylitics
        Fabric.with([Crashlytics.self])
        //MARK: -Appsee-Crashylitics
//        Fabric.with([Crashlytics.self, Appsee.self])p
//
//        Appsee.setUserID("Thankmelater23")
        
        
        
        var font: UIFont = UIFont(name: "ChalkDuster", size: 15)!
        let foreGroundcolor = RawGoldTexture
        let backGroundcolor = LeatherTexture
        let strokeColor = RedBunchedUpSilkSheet
        let titeColor = Stitching
        let underLineColor = Stitching
        let textEffect = NSTextEffectLetterpressStyle
        let titeFont = UIFont(name: "Chalkboard SE", size: 20)!
        let underLineStyle = NSUnderlineStyle.StyleThick.rawValue
        var textShadow = NSShadow()
        textShadow.shadowColor = RedBunchedUpSilkSheet
        textShadow.shadowOffset = CGSize(width: 0, height: 2)
        textShadow.shadowBlurRadius = 3.0
        
        var allCommonAttributes = [:]
        var customLeftAttributes = [:]
        var customRightAttributes = [:]
        
        
        
        UINavigationBar.appearance().titleTextAttributes =
            [NSFontAttributeName: titeFont,
            NSBackgroundColorAttributeName: titeColor,
            NSForegroundColorAttributeName: backGroundcolor,
            NSUnderlineStyleAttributeName: underLineStyle,
            NSStrokeColorAttributeName: strokeColor,
            NSShadowAttributeName: textShadow,
            NSTextEffectAttributeName: textEffect,
            NSUnderlineColorAttributeName: underLineColor]
        
        UINavigationBar.appearance().topItem?.rightBarButtonItem?.tintColor = RawGoldTexture
        
        UINavigationBar.appearance().topItem?.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: font,
            NSBackgroundColorAttributeName: foreGroundcolor,
            NSForegroundColorAttributeName: backGroundcolor,
            NSUnderlineStyleAttributeName: underLineStyle,
            NSStrokeColorAttributeName: strokeColor,
            NSShadowAttributeName: textShadow,
            NSTextEffectAttributeName: textEffect,
            NSUnderlineColorAttributeName: underLineColor], forState: .Normal)
        UINavigationBar.appearance().topItem?.leftBarButtonItem?.tintColor = RawGoldTexture
        
        UINavigationBar.appearance().topItem?.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: font,
            NSBackgroundColorAttributeName: foreGroundcolor,
            NSForegroundColorAttributeName: backGroundcolor,
            NSUnderlineStyleAttributeName: underLineStyle,
            NSStrokeColorAttributeName: strokeColor,
            NSShadowAttributeName: textShadow,
            NSTextEffectAttributeName: textEffect,
            NSUnderlineColorAttributeName: underLineColor], forState: .Normal)
        
        return true
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


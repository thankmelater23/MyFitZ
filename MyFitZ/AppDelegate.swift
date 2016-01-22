//
//  AppDelegate.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 10/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.
// let log = SwiftyBeaver.self

import UIKit
import Fabric
import Crashlytics
import Appsee//This is possibly crashing since its not working(issue found in crashylytics)
import Siren
import SwiftyBeaver
import Parse
import Bolts
//import AppInfo

let log = SwiftyBeaver.self

//MARK: -AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: -Variables
    var window: UIWindow?
    
    //MARK: -Methods
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        log.info(__FUNCTION__)
        //        self.printAppInfo()
        self.loadResources()
        self.SwiftBeaverSetUp()
        self.removeConstraintFromLogger()
        self.parseSetUp(launchOptions)
        self.sirenInitilization()
        self.createAndRegisterNotificationSettings()
        self.setNotifications()
        self.parseSetUp()
        initializeSounds()
        
        
        // Override point for customization after application launch.
        //MARK: -Crashylitics
        Fabric.with([Crashlytics.self])
        //MARK: -Appsee-Crashylitics
        Fabric.with([Crashlytics.self, Appsee.self])
        
        Appsee.setUserID("Andre Testers Test:1-17-15")
        Appsee.start("c8b52b639c1648dc953b5f55d4d3511f")
        
        
        
        let font: UIFont = UIFont(name: "ChalkDuster", size: 15)!
        let foreGroundcolor = RawGoldTexture
        let backGroundcolor = LeatherTexture
        let strokeColor = RedBunchedUpSilkSheet
        let titeColor = Stitching
        let underLineColor = Stitching
        let textEffect = NSTextEffectLetterpressStyle
        let titeFont = UIFont(name: "Chalkboard SE", size: 20)!
        let underLineStyle = NSUnderlineStyle.StyleThick.rawValue
        let textShadow = NSShadow()
        textShadow.shadowColor = RedBunchedUpSilkSheet
        textShadow.shadowOffset = CGSize(width: 0, height: 2)
        textShadow.shadowBlurRadius = 3.0
        
        
        
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
    func sirenInitilization(){
        log.info(__FUNCTION__)
        /* Siren code should go below window?.makeKeyAndVisible() */
        
        // Siren is a singleton
        let siren = Siren.sharedInstance
        
        // Required: Your app's iTunes App Store ID
        siren.appID = APP_ID
        
        // Optional: Defaults to .Option
        
        
        /*
        Replace .Immediately with .Daily or .Weekly to specify a maximum daily or weekly frequency for version
        checks.
        */
        siren.checkVersion(.Daily)
        
        siren.alertType = SirenAlertType.Option
    }
    func SwiftBeaverSetUp(){
        log.info(__FUNCTION__)
        let console = ConsoleDestination()
        log.addDestination(console)
        // Now let’s log!
        log.verbose("Verbose Test")  // prio 1, VERBOSE in silver
        log.debug("Debug Test")  // prio 2, DEBUG in blue
        log.info("Info Test")   // prio 3, INFO in green
        log.warning("Warning Test")  // prio 4, WARNING in yellow
        log.error("Error Test")  // prio 5, ERROR in red
    }
    func removeConstraintFromLogger(){
        log.info(__FUNCTION__)
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    func loadResources(){
        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
    }
    func parseSetUp(launchOptions: [NSObject: AnyObject]?){
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios/guide#local-datastore
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("hVnVJ06MB3aY5repQZyeqQxEGH9YyDPMknMso2I5",
            clientKey: "c1JavCFdSYyDQMEDwOYUnCeovHGzwkovqLg68KRX")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
    }
    func createAndRegisterNotificationSettings(){
        log.info("Notifications are being set")
        //Noitfications
        let notifytypes:UIUserNotificationType = [.Alert, .Badge, .Sound]
        
        let notifSettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: notifytypes, categories: nil)

        UIApplication.sharedApplication().registerUserNotificationSettings(notifSettings)
    }
    func setNotifications(){
        log.info("Notifications are being set")
        let today = NSDate()
        
        let dateComp = NSDateComponents()
        dateComp.day = 7
        
        let cal = NSCalendar.currentCalendar()
        let fireDate:NSDate = cal.dateByAddingComponents(dateComp, toDate: today, options: NSCalendarOptions())!
        
        
        let notification: UILocalNotification = UILocalNotification()
        notification.alertBody = "Hey it's been a while since you been on, come check out MyFitZ"
        notification.alertTitle = "REMINDER"
        notification.alertLaunchImage = "icon1"
        
        notification.fireDate = fireDate
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        log.info("Notifications are set")
    }
    func parseSetUp(){
        let parseUser = PFObject(className: "User")
        parseUser["Opened App"] = true
        parseUser.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            log.info("Object has been saved.")
        }
        
        
    }
}
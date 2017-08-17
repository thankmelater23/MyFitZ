<<<<<<< HEAD
         //
         //  AppDelegate.swift
         //  MyFitZ
         //
         //  Created by Andre V on 4/22/17.
         //  Copyright © 2017 Bang Bang Studios. All rights reserved.
         //
         
         import UIKit
         import Fabric
         //         import Answers
         import CoreData
         import Crashlytics
         import Appsee
         //         import IQKeyboardManagerSwift
         import Firebase
         //import Appsee//This is possibly crashing since its not working(issue found in crashylytics)
         import Siren
         import SwiftyBeaver
         //import Parse
         //import Bolts
         //import HeapInspector
         //import WatchConnectivity
         
         
         
         let log = SwiftyBeaver.self
         
         
         @UIApplicationMain
         class AppDelegate: UIResponder, UIApplicationDelegate {
            var window: UIWindow?
            
            
            func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                setupApplication()
                //        self.parseSetUp(launchOptions)
                //        self.setNotifications()
                //        self.parseSetUp()
                //        self.setUpApperrance()
                //        initializeSounds()
                self.sirenInit()
                Fabric.with([Crashlytics.self, Answers.self])//Appsee.self
                FirebaseApp.configure()
                Database.database().isPersistenceEnabled = true
                
                return true
            }
            
            func applicationWillResignActive(_ application: UIApplication) {
                // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
                // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
            }
            
            func applicationDidEnterBackground(_ application: UIApplication) {
                // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
                // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
            }
            
            func applicationWillEnterForeground(_ application: UIApplication) {
                // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
            }
            
            func applicationDidBecomeActive(_ application: UIApplication) {
                // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
            }
            
            func applicationWillTerminate(_ application: UIApplication) {
                // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
                // Saves changes in the application's managed object context before the application terminates.
                DataBaseController.saveContext()
            }
            
            //MARK: - Settings
            
            
            //MARK: - 3rd Pary Methods
            @objc func swiftBeaverSetUp(){
                log.info(#function)
                let console = ConsoleDestination()
                log.addDestination(console)
                let file = FileDestination()
                log.addDestination(file)
                log.verbose("Verbose Test")  // prio 1, VERBOSE in silver
                log.debug("Debug Test")  // prio 2, DEBUG in blue
                log.info("Info Test")   // prio 3, INFO in green
                log.warning("Warning Test")  // prio 4, WARNING in yellow
                log.error("Error Test")  // prio 5, ERROR in red
                let platform = SBPlatformDestination(appID: "B1Q8QX", appSecret: "nwrivhWudvqSisnMhhdb31ds4olncntc", encryptionKey: "f76j2vyjjaaiK4yQzOvgtwpRaaxIeqti")
                log.addDestination(platform)
            }
            //             @objc func iqKeyboardInitilize(){
            //                IQKeyboardManager.sharedManager().enable = true
            //            }
            
            @objc func removeConstraintFromLogger(){
                log.info(#function)
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
            
            
            //MARK: - Custom Methods
            @objc func ifFirstStart(){
                //TODO: - Make a global define
                //DoBeforeCommit: - Do Deeze Nuttz
                let name = "isFirstStart"
                let firstStart: Bool? = UserDefaults.standard.object(forKey: name) as? Bool
                
                if(firstStart == nil){
                    log.info("This is the first start")
                    UserDefaults.standard.set(false, forKey: name)
                    self.createSampleDatabase()
                    
                    
                }else{
                    //Do nothing
                    log.verbose("This is not first start")
                    //Load data
                }
            }
            
            //MARK: - Core Data
            fileprivate func createSampleDatabase(){
                //                User.createUsers()
            }
            
            //MARK: - Notifications
            //            @objc func createAndRegisterNotificationSettings(){
            //                log.info("Notifications are being set")
            //                //Noitfications
            //                let notifytypes:UIUserNotificationType = [.alert, .badge, .sound]
            //
            //                let notifSettings: UIUserNotificationSettings = UIUserNotificationSettings(types: notifytypes, categories: nil)
            //
            //                UIApplication.shared.registerUserNotificationSettings(notifSettings)
            //            }
            //            @objc func setNotifications(){
            //                let daysTillFire = 7
            //                let today = Date()
            //
            //                let lastFiredDateString = "lastFiredDate"
            //                var lastFiredDate = defaults.value(forKey: lastFiredDateString) as? NSDate
            //
            //                if lastFiredDate == nil{
            //                    lastFiredDate = today as NSDate
            //                    defaults.set(today, forKey: lastFiredDateString)
            //                    log.debug("First fired Date: \(lastFiredDate)")
            //                }else{
            //
            //                    var dateComp = DateComponents()
            //                    dateComp.day = daysTillFire
            //                    let cal = Calendar.current
            //
            //                    let fireDate:Date = (cal as NSCalendar).date(byAdding: dateComp, to: lastFiredDate as! Date, options: NSCalendar.Options())!
            //
            //                    let daysBetweenLastFiredAndNow = calicuateDaysBetweenTwoDates(start: today, end: fireDate )
            //
            //                    if(daysBetweenLastFiredAndNow < 1){
            //                        let notification: UILocalNotification = UILocalNotification()
            //                        notification.alertBody = "Hey it's been a while since you been on, come check out MyFitZ"
            //                        notification.alertTitle = "REMINDER"
            //                        notification.alertLaunchImage = "icon1"
            //
            //                        let newFireDate:Date = (cal as NSCalendar).date(byAdding: dateComp, to: today , options: NSCalendar.Options())!
            //                        notification.fireDate = newFireDate
            //
            //                        UIApplication.shared.scheduleLocalNotification(notification)
            //                        defaults.set(NSDate(), forKey: lastFiredDateString)
            //                        log.debug("Notification Fired")
            //                        log.debug("Updated Last Time Fired Date : \(newFireDate)")
            //
            //                    }else{
            //                        log.warning("Wont fire notification")
            //                        log.info("Only \(daysBetweenLastFiredAndNow) since last fire date")
            //                    }
            //                }
            //            }
            
            //MARK: - Application Methods
            fileprivate func setupApplication() {
                // Override point for customization after application launch.
                
                self.swiftBeaverSetUp()
                self.removeConstraintFromLogger()
                self.ifFirstStart()
                //                self.createAndRegisterNotificationSettings()
                //                self.setNotifications()
                //                self.iqKeyboardInitilize()
            }
            func sirenInit(){
                log.info(#function)
                /* Siren code should go below window?.makeKeyAndVisible() */
                
                // Siren is a singleton
                let siren = Siren.shared
                
                // Required: Your app's iTunes App Store ID
                //        siren.appID = APP_ID
                
                // Optional: Defaults to .Option
                
                
                /*
                 Replace .Immediately with .Daily or .Weekly to specify a maximum daily or weekly frequency for version
                 checks.
                 */
                siren.checkVersion(checkType: .daily)
                
                siren.alertType = .option
            }
//            func createAndRegisterNotificationSettings(){
//            log.info("Notifications are being set")
//            //Noitfications
//                let notifytypes:UIUserNotificationType = [.alert, .badge, .sound]
//
//            let notifSettings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: notifytypes, categories: nil)
//
//            UIApplication.sharedApplication().registerUserNotificationSettings(notifSettings)
//            }
//            func setNotifications(){
//                log.info("Notifications are being set")
//                let today = NSDate()
//
//                let dateComp = NSDateComponents()
//                dateComp.day = 7
//
//                let cal = NSCalendar.currentCalendar()
//                let fireDate:NSDate = cal.dateByAddingComponents(dateComp, toDate: today, options: NSCalendarOptions())!
//
//
//                let notification: UILocalNotification = UILocalNotification()
//                notification.alertBody = "Hey it's been a while since you been on, come check out MyFitZ"
//                notification.alertTitle = "REMINDER"
//                notification.alertLaunchImage = "icon1"
//
//                notification.fireDate = fireDate
//
//                UIApplication.sharedApplication().scheduleLocalNotification(notification)
//                log.info("Notifications are set")
//            }
            
         }
         
         
         
         //FRAMEWORKTOIMPLEMENT: - NIMBLE: https://github.com/Quick/Nimble
         //FRAMEWORKTOIMPLEMENT: - RXSWIFT: https://github.com/ReactiveX/RxSwift
         //FRAMEWORKTOIMPLEMENT: - SwwiftyBeaver(Was incompaitable with swift 4)
=======
//
//  AppDelegate.swift
//  MyFitZ
//
//  Created by Andre Villanueva on 10/27/15.
//  Copyright © 2015 Bang Bang Studios. All rights reserved.

import UIKit
import Fabric
import Crashlytics
import Appsee//This is possibly crashing since its not working(issue found in crashylytics)
import Siren
import SwiftyBeaver
//import Parse
//import Bolts
import HeapInspector
import WatchConnectivity

//import AppInfo

let log = SwiftyBeaver.self

//MARK: -AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: -Variables
    var window: UIWindow?
    
    weak var session: WCSession?{
        didSet{
            if let session = session{
                session.delegate = self
                session.activateSession()
            }
        }
    }
    
    //MARK: -Methods
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        log.info(#function)
        //        HeapInspector.start()
        //        self.printAppInfo()
        self.loadResources()
        self.SwiftBeaverSetUp()
        self.removeConstraintFromLogger()
        self.parseSetUp(launchOptions)
        self.sirenInitilization()
        self.createAndRegisterNotificationSettings()
        self.setNotifications()
        self.parseSetUp()
        self.setUpApperrance()
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
        log.info(#function)
        /* Siren code should go below window?.makeKeyAndVisible() */
        
        // Siren is a singleton
        let siren = Siren.sharedInstance
        
        // Required: Your app's iTunes App Store ID
//        siren.appID = APP_ID
        
        // Optional: Defaults to .Option
        
        
        /*
         Replace .Immediately with .Daily or .Weekly to specify a maximum daily or weekly frequency for version
         checks.
         */
        siren.checkVersion(.Daily)
        
        siren.alertType = SirenAlertType.Option
    }
    func SwiftBeaverSetUp(){
        log.info(#function)
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
        log.info(#function)
        NSUserDefaults.standardUserDefaults().setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    func loadResources(){
        Users_Wardrobe = Users_Wardrobe.loadAndCreateCloset()
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
        }
    }
    func parseSetUp(launchOptions: [NSObject: AnyObject]?){
        // [Optional] Power your app with Local Datastore. For more info, go to
//        // https://parse.com/docs/ios/guide#local-datastore
//        Parse.enableLocalDatastore()
//        
//        // Initialize Parse.
//        Parse.setApplicationId("hVnVJ06MB3aY5repQZyeqQxEGH9YyDPMknMso2I5",
//                               clientKey: "c1JavCFdSYyDQMEDwOYUnCeovHGzwkovqLg68KRX")
//        
//        // [Optional] Track statistics around application opens.
//        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
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
//        let parseUser = PFObject(className: "User")
//        parseUser["Opened App"] = true
//        parseUser.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            log.info("Object has been saved.")
//        }
        
        
    }
    func setUpApperrance(){
        let navStyle = UINavigationBar.appearance()
        navStyle.barTintColor = UIColor.whiteColor()
        navStyle.tintColor = UIColor.blackColor()
        navStyle.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
    }
}

//MARK: -WCSessionDelegate
extension AppDelegate: WCSessionDelegate{
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        func covertItemToDictionary(item: Item)-> [String: AnyObject]{
            var itemDic = [String: AnyObject]()
            //            itemDic["image"] =  UIImagePNGRepresentation(item.image)
            itemDic["category"] = item.category
            itemDic["brand"] = item.brand
            itemDic["dateDeleted"] = item.dateDeleted
            itemDic["timesWorn"] = item.timesWorn
            itemDic["payedPrice"] = item.payedPrice
            itemDic["favorited"] = item.favorited
            itemDic["lastTimeWorn"] = item.lastTimeWorn
            
            return itemDic
        }
        func returnArrayOfWatchItems(items: [Item])->[WatchItem]{
            defer{
                print("\(sizeofValue(itemsToReturn))")
            }
            
            var itemsToReturn = [WatchItem]()
            
            for item in items{
                let dic = covertItemToDictionary(item)
                let watchItem = WatchItem()
                watchItem.setItemFromDic(dic)
                itemsToReturn.append((watchItem))
                
            }
            return itemsToReturn
        }
        
        if let _ = message[FavList] as? String{
            let payLoad = returnArrayOfWatchItems(Users_Wardrobe.favoritedItems)
            let replyMessage = [FavList : payLoad]
            replyHandler(replyMessage)
        }
        
        if let _ = message[RecentList] as? String{
            let payLoad = returnArrayOfWatchItems(Users_Wardrobe.recentWornItems)
            let replyMessage = [RecentList : payLoad]
            replyHandler(replyMessage)
            
        }
        
        if let _ = message[TrashList] as? String{
            let payLoad = returnArrayOfWatchItems(Users_Wardrobe.selectedClosetTrashItems)
            let payloadArchived = NSKeyedArchiver.archivedDataWithRootObject(payLoad)
//            let replyMessage = [TrashList : payloadArchived]
            do{
                
                try self.session?.sendMessageData(payloadArchived, replyHandler: nil, errorHandler: nil)
            }catch{
                print(error)
            }
//            let replyMessage = [TrashList : "here"]-=
//            replyHandler(replyMessage)
        }
        
        
        if let _ = message[StatsList] as? String{
            let payLoad = returnArrayOfWatchItems(Users_Wardrobe.recentWornItems)
            let replyMessage = [StatsList : payLoad]
            replyHandler(replyMessage)
            
        }
    }
}
>>>>>>> MyFitZOld/master

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

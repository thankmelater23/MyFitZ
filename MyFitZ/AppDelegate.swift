        //
        //  AppDelegate.swift
        //  MyFitZ
        //
        //  Created by Andre V on 4/22/17.
        //  Copyright © 2017 Bang Bang Studios. All rights reserved.
        //
        
        import UIKit
        //import Fabric
        //import Crashlytics
        //import Appsee//This is possibly crashing since its not working(issue found in crashylytics)
        //import Siren
        import SwiftyBeaver
        //import Parse
        //import Bolts
        import HeapInspector
        import WatchConnectivity
        import CoreData
        
        let log = SwiftyBeaver.self
        
        
        @UIApplicationMain
        class AppDelegate: UIResponder, UIApplicationDelegate {
            var window: UIWindow?
 
            
            //MARK: - Application Methods
            func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                // Override point for customization after application launch.
                
                self.SwiftBeaverSetUp()
                self.removeConstraintFromLogger()
                
                //        self.parseSetUp(launchOptions)
                //        self.sirenInitilization()
                //        self.createAndRegisterNotificationSettings()
                //        self.setNotifications()
                //        self.parseSetUp()
                //        self.setUpApperrance()
                //        initializeSounds()
                
                
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
            
            
            //MARK: - 3rd Pary Methods
            
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
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
            
            //    func sirenInitilization(){
            //        log.info(#function)
            //        /* Siren code should go below window?.makeKeyAndVisible() */
            //
            //        // Siren is a singleton
            //        let siren = Siren.sharedInstance
            //
            //        // Required: Your app's iTunes App Store ID
            //        //        siren.appID = APP_ID
            //
            //        // Optional: Defaults to .Option 
            //
            //
            //        /*
            //         Replace .Immediately with .Daily or .Weekly to specify a maximum daily or weekly frequency for version
            //         checks.
            //         */
            //        siren.checkVersion(.daily)
            //
            //        siren.alertType = SirenAlertType.option
            //    }
            
            //MARK: - Custom Methods
        }

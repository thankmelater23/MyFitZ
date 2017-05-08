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
                self.saveContext()
            }
            
            // MARK: - Core Data stack
            
            lazy var persistentContainer: NSPersistentContainer = {
                /*
                 The persistent container for the application. This implementation
                 creates and returns a container, having loaded the store for the
                 application to it. This property is optional since there are legitimate
                 error conditions that could cause the creation of the store to fail.
                 */
                let container = NSPersistentContainer(name: "MyFitZ")
                container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        
                        /*
                         Typical reasons for an error here include:
                         * The parent directory does not exist, cannot be created, or disallows writing.
                         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                         * The device is out of space.
                         * The store could not be migrated to the current model version.
                         Check the error message to determine what the actual problem was.
                         */
                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
                return container
            }()
            
            // MARK: - Core Data Saving support
            
            func saveContext () {
                let context = persistentContainer.viewContext
                if context.hasChanges {
                    do {
                        try context.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    }
                }
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
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
            func setStack(){
                let context = self.persistentContainer.viewContext
                do{
                    //                    let user = try context.fetch(User.fetchRequest())
                    
                }catch let error{
                    log.error("Fetching error \(error)")
                    
                    abort()
                    
                }
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
        }
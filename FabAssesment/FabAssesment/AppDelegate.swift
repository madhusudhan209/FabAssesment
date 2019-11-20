//
//  AppDelegate.swift
//  FabAssesment
//
//  Created by Madhusudhan on 19/11/19.
//  Copyright © 2019 BankFab. All rights reserved.
//

import UIKit
import Reachability

/**
 The purpose of the `AppDelegate` is handling all the `UIApplication` methods and its delagate methods to handle `UIApplication` configurations
 
 This class will be fired from `UIApplicationMain` interface implementaion
 
 The `AppDelegate` class is a subclass of the `UIResponder`,
 */
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /// root object for the current application
    var window: UIWindow?
    
    /// The reachability for the internet Reachability.
    let internetReachability = Reachability()!
    
    /// The Bool for the internet availablity.
    var internetAvailability : Bool = false
    
    /// This method is the initial method which is called after opening the application. In this method all the initialization of object required globally for reusing in entire app will be done
    /// - Parameters:
    ///   - application: application object
    ///   - launchOptions: launchOptions objects
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /**
         Reachability to find out whether internet is availble or not in a device for calling web api's
         */
        if internetReachability.connection != .none {
            internetAvailability = true
            print("Internet connection OK")
        }
        
        /**
         For find out Internet when goes On or Off automatically
         */
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(note:)),name: Notification.Name.reachabilityChanged,object: internetReachability)
        do{
            try internetReachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
        return true
    }
    
    /// Application local database is closed when application is terminated
    /// - Parameter application: application object
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    // MARK: - Network Finder
    
    /**
     It triggers the breaking of the fullname being in the `txtFullName` textfield into its components.
     
     If the `reachability` *does contain any wifi* then netAvailability true. In the other case, the `reachability` *does contain any cellular*  then netAvailability true. In the other case, the `reachability` *does contain none means no interner*  then netAvailability false.
     
     
     If the `reachability` *does contain any text* then nothing happens. In the opposite case, the fullname is broken into its parts (first name and last name) and each value is set to the `txtFirstName` and `txtLastName` respectively.
     
     - Parameter sender: The NSNotifcation inovkes this Reachability
     
     - SeeAlso: `reachabilityChanged(_:)`
     */
    @objc func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            internetAvailability = true
            print(ServiceManager.shared.checkInternetAvailability())
        case .cellular:
            print("Reachable via Cellular")
            internetAvailability = true
            print(ServiceManager.shared.checkInternetAvailability())
        case .none:
            print("Network not reachable")
            internetAvailability = false
            print(ServiceManager.shared.checkInternetAvailability())
        }
        
    }
    
}

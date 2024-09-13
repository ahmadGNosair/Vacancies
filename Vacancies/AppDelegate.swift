//
//  AppDelegate.swift
//  Vacancies
//
//  Created by Ahmad Nosair on 13/09/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Set Proxima Nova Condensed as the global font for UILabel
            UILabel.appearance().font = UIFont(name: "ProximaNovaCond-Bold", size: 18)
            
            // Set Proxima Nova Condensed as the global font for UIButton
            UIButton.appearance().titleLabel?.font = UIFont(name: "ProximaNova-Regular", size: 18)
            
            // Set Proxima Nova Condensed as the global font for UITextField
            UITextField.appearance().font = UIFont(name: "ProximaNovaCond-Light", size: 14)
            
            // Set Proxima Nova Condensed as the global font for UITextView
            UITextView.appearance().font = UIFont(name: "ProximaNovaCond-Light", size: 14)

            return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


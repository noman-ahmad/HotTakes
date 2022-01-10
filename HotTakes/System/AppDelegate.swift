//
//  AppDelegate.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/8/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // fix tab bar issues


        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            let tabAppearance = UITabBarItemAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = AppColors.shared.primaryPurple
            tabAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColors.shared.primaryPurple]
            tabAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AppColors.shared.primaryPurple]
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
        // fix nav bar issues
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = AppColors.shared.primaryPurple
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
        
        
        
        // launch firebase
        FirebaseApp.configure()
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


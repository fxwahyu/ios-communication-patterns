//
//  AppDelegate.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 18/07/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let navigation = UINavigationController()
        let mainView = MainViewController()
        navigation.viewControllers = [mainView]
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        return true
    }
}


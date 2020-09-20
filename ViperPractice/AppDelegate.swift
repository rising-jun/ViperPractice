//
//  AppDelegate.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/14.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let splash = SplashWireframe.createSpalshModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splash
        window?.makeKeyAndVisible()
        return true
    }

}


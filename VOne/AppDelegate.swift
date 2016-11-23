//
//  AppDelegate.swift
//  VOne
//
//  Created by 王正一 on 16/7/19.
//  Copyright © 2016年 FsThatOne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = FSMainViewController()
        window!.makeKeyAndVisible()
        
        return true
    }
}

// 3D Touch
extension AppDelegate {
}

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
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        window!.rootViewController = FSMainViewController()
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "WelcomeBGM", ofType: "mp4")!)
        let WelcomeVC = WelcomeViewController(vFrame: UIScreen.main.bounds, sTime: 2.0)
        WelcomeVC.contentURL = url
        WelcomeVC.alwaysRepeat = true
        window!.rootViewController = WelcomeVC
        window!.makeKeyAndVisible()
        
        
        return true
    }
}

// 3D Touch
extension AppDelegate {
}


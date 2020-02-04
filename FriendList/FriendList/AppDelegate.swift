//
//  AppDelegate.swift
//  FriendList
//
//  Created by Techmaster on 5/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(Friend.DocumentsDirectory)
        return true
    }

   


}


//
//  AppDelegate.swift
//  SalemanChecking
//
//  Created by hieu nguyen van on 9/6/19.
//  Copyright © 2019 hieunv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    //dùng để truyền userdefaut từ lúc active
    private var userdef : UserDefaults?
    func passData(_ vuserdef : UserDefaults) {
        self.userdef = vuserdef
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //begin reset để test active
            //UserDefaults.standard.set("abc" , forKey: "Link")
            //UserDefaults.standard.set(false, forKey: "isLogedin")
        // end reset để test active
        
        var mylink = UserDefaults.standard.object(forKey: "Link") as? String ?? "abc"
        
        //chưa kích hoạt thì vào form này để kích hoạt
//        if (!mylink.isValidURL){
//
//            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ActiveViewController") as! ActiveViewController
//            UIApplication.shared.windows.first?.rootViewController = ViewController
//        //đã kích hoạt rồi thì vào form đăng nhập
//        } else{
//
//            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//            let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SigninViewController") as! ViewController
//            UIApplication.shared.windows.first?.rootViewController = ViewController
//
//        }
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SigninViewController") as! ViewController
        mylink = UserDefaults.standard.set("", forKey: "Link") as! String
        UIApplication.shared.windows.first?.rootViewController = ViewController
 
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
    }


}


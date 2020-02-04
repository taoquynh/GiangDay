//
//  AppDelegate.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
@available(iOS 13.0, *)
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared = UIApplication.shared.connectedScenes.first?.delegate as? AppDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0, *){
            
        }else{
            let login = UserDefaults.standard.string(forKey: "login") ?? ""
            if !login.isEmpty {
                print(login)
                AppDelegate.shared?.startMain()
//                let homeVC = HomeViewController()
//                let navigation = UINavigationController(rootViewController: homeVC)
//                window?.rootViewController = navigation
//                window?.makeKeyAndVisible()
            }else{
                AppDelegate.shared?.startLogIn()
//                let loginVC = LoginViewController()
//                window?.rootViewController = loginVC
//                window?.makeKeyAndVisible()
            }

        }
        return true
    }
    
    func startLogIn(){
        let loginVC = LoginViewController()
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }
    
    func startMain(){
        let homeVC = HomeViewController()
        let navigation = UINavigationController(rootViewController: homeVC)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
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


//
//  HomeViewController.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func onLogOut(_ sender: Any) {
        let manager = FirebaseAuthManager()
        manager.logout{ [weak self] (success) in
            guard let strongSelf = self else {return}
            if success {
                UserDefaults.standard.removeObject(forKey: "login")
                AppDelegate.shared?.startLogIn()
            } else {
                let message = "Đăng xuất không thành công"
                AlertHelper.showAlert(message: message, viewController: strongSelf)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

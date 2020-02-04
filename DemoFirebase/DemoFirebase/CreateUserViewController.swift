//
//  CreateUserViewController.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let manager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.register(email: email, password: password) { (status) in
                var message: String = ""
                if status {
                    let userDefault = UserDefaults.standard
                    userDefault.setValue("login", forKey: "login")
                    AppDelegate.shared?.startMain()
                } else {
                    message = "Lỗi khi tạo tài khoản"
                    AlertHelper.showAlert(message: message, viewController: self)
                }
                
            }
        }
    }
    
    @IBAction func orLogIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

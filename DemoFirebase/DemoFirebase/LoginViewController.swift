//
//  LoginViewController.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onLogIn(_ sender: Any) {
        let manager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { (status) in
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
    @IBAction func orRegister(_ sender: Any) {
        let registerVC = CreateUserViewController()
        present(registerVC, animated: true, completion: nil)
    }
}

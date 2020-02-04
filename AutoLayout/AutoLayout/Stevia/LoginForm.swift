//
//  LoginForm.swift
//  AutoLayout
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class LoginForm: UIViewController {
    let email = UITextField()
    let password = UITextField()
    let login = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.sv(
            email,
            password,
            login
        )
        
        // Vertical + Horizontal Layout in one pass
        // With type-safe visual format
        view.layout(
            100,
            |-email-| ~ 80,
            8,
            |-password-| ~ 80,
            "",
            |login| ~ 80,
            0
        )
        
        // Styling 🎨
        view.backgroundColor = .gray
        email.style(commonFieldStyle)
        password.style(commonFieldStyle).style { f in
            f.isSecureTextEntry = true
            f.returnKeyType = .done
        }
        login.backgroundColor = .lightGray
        
        // Content 🖋
        email.placeholder = "Email"
        password.placeholder = "Password"
        login.setTitle("Login", for: .normal)
    }
    
    // Style can be extracted and applied kind of like css \o/
    // but in pure Swift though!
    func commonFieldStyle(_ f:UITextField) {
        f.borderStyle = .roundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .next
    }
}

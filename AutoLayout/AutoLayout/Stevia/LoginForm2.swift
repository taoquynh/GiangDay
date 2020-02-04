//
//  LoginForm2.swift
//  AutoLayout
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class LoginForm2: UIViewController {

    let email = UITextField()
    let password = UITextField()
    let forgot = UIButton()
    let login = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.sv (
            email,
            password,
            forgot,
            login
        )
        
        view.layout(
           100,
           |-email-| ~ 80,
           8,
           |-password.width(50%)-forgot-| ~ 80,
           >=20,
           |login| ~ 80,
           100
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
        forgot.setTitle("Forgot", for: .normal)
        login.setTitle("Login", for: .normal)
    }
    
    // Style can be extracted and applied kind of like css \o/
    // but in pure Swift though!
    func commonFieldStyle(_ f:UITextField) {
        f.borderStyle = .roundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        f.returnKeyType = .next
    }  

}

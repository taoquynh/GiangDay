//
//  Notification3Screen.swift
//  DemoPassData
//
//  Created by Taof on 9/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class Notification3Screen: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

            title = "Màn 3 gửi thông báo"
    }

    @IBAction func sendNotiPress(_ sender: Any) {
        
        let person = Person.init(name: nameTextField.text!, age: Int(ageTextField.text!) ?? 0)
        
        NotificationCenter.default.post(name: .notificationNamePerson, object: person)
    }
}

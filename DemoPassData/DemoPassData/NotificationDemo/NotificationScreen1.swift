//
//  NotificationScreen1.swift
//  DemoPassData
//
//  Created by Taof on 9/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class NotificationScreen1: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        title = "Màn 1 nhận thông báo"
        
        // đăng kí nhận Thông báo
        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .notificationNamePerson, object: nil)
    }

    @objc func notification(_ notification: Notification){
        // lấy dữ liệu từ thông báo ép về kiểu Person đổ vào label
        if let object = notification.object as? Person{
            nameLabel.text = object.name
            ageLabel.text = String(object.age)
        }
    }

    @IBAction func nextPress(_ sender: Any) {
        let sceen2 = NotificationScreen2()
        navigationController?.pushViewController(sceen2, animated: true)
        
    }
}

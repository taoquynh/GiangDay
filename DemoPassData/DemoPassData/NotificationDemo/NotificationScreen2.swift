//
//  NotificationScreen2.swift
//  DemoPassData
//
//  Created by Taof on 9/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class NotificationScreen2: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

            title = "Màn 2 nhận thông báo"
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
        let screen3 = Notification3Screen()
        navigationController?.pushViewController(screen3, animated: true)
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

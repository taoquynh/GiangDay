//
//  DelegateScreen1.swift
//  DemoPassData
//
//  Created by Taof on 10/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DelegateScreen1: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Next(_ sender: Any) {
        let screen2 = DelegateScreen2()
        
        // Bước 5: sử dụng delegate
        screen2.myDelegate = self
        present(screen2, animated: true, completion: nil)
    }
}

// Bước 6: viết extension lấy dữ liệu
extension DelegateScreen1: MyDelegate{
    func getData(name: String, address: String) {
        nameLabel.text = name
        addressLabel.text = address
    }
}

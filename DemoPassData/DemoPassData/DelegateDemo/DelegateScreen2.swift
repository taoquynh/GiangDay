//
//  DelegateScreen2.swift
//  DemoPassData
//
//  Created by Taof on 10/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

// Bươc 1: khai báo protocol
protocol MyDelegate {
    // B2: tạo phương thức bắt buộc
    func getData(name: String, address: String)
}

class DelegateScreen2: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // Bước 3: tạo một biến delegate
    var myDelegate: MyDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        // Bước 4: truyền dữ liệu vào delegate
        myDelegate?.getData(name: nameTextField.text!, address: addressTextField.text!)
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

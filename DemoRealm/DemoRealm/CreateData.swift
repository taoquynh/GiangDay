//
//  CreateData.swift
//  DemoRealm
//
//  Created by Taof on 11/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import RealmSwift

class CreateData: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lưu", style: .done, target: self, action: #selector(saveData))
        
    }
    
    @objc func saveData(){
        guard let name = nameTextField.text, !name.isEmpty else {
            alert("Cảnh báo", message: "Vui lòng nhập tên")
            return
        }
        
        guard let content = contentTextView.text, !content.isEmpty else {
            alert("Cảnh báo", message: "Vui lòng nhập nội dung")
            return
        }
        
        let item = Item()
        item.name = name
        item.content = content
        
        DBManager.sharedInstance.addData(object: item)
        navigationController?.popViewController(animated: true)
    }

    func alert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Ok", style: .cancel) { _ in
//            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(cancelAlert)
        present(alertController, animated: true, completion: nil)
    }
}

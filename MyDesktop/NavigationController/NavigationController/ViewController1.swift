//
//  ViewController1.swift
//  NavigationController
//
//  Created by Quynh on 4/16/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "View Controller 1"
        
        let popButton = UIBarButtonItem(title: "Pop", style: .done, target: self, action: #selector(popViewController))
        
        navigationItem.rightBarButtonItems = [popButton, addButton]
    }
    
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }

}

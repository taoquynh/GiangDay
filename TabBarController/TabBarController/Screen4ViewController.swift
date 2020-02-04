//
//  Screen4ViewController.swift
//  TabBarController
//
//  Created by Taof on 9/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class Screen4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }
    
    // ẩn navigationBar
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

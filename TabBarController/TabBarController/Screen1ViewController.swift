//
//  Screen1ViewController.swift
//  TabBarController
//
//  Created by Taof on 9/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class Screen1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Screen1"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nextScreen))
    }
    
    @objc func nextScreen(){
        let screen4 = Screen4ViewController()
        // ẩn thanh tab bar
//        screen4.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(screen4, animated: true)
    }

}

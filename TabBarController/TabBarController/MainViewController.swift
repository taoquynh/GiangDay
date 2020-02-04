//
//  MainViewController.swift
//  TabBarController
//
//  Created by Taof on 9/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressButton(_ sender: Any) {
        let tabBC = AppDelegate.setupTabBarController()
        present(tabBC, animated: true, completion: nil)
    }
    

}

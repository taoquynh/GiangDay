//
//  ViewController.swift
//  NavigationController
//
//  Created by Quynh on 4/16/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        let heartButton = UIBarButtonItem(image: UIImage(named: "heart"), style: .done, target: self, action: nil)
            
        let goButton = UIBarButtonItem(title: "Go", style: .done, target: self, action: #selector(goPress))
        
        navigationItem.leftBarButtonItems = [heartButton, searchButton]
        navigationItem.rightBarButtonItem = goButton
    }
      
    @objc func goPress(){
        let vc1 = ViewController1()
        self.navigationController?.pushViewController(vc1, animated: true)
    }
}


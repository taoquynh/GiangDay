//
//  SecondViewController.swift
//  HocUINavigationController
//
//  Created by Taof on 8/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = UIColor(red:0.00, green:0.60, blue:0.60, alpha:1.0)
//        view.backgroundColor = .red
//        navigationController?.navigationBar.barTintColor = UIColor.green
        navigationItem.title = "SecondViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .done, target: self, action: #selector(veman1))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .done, target: self, action: #selector(plusFunc))
    }
    
    @objc func veman1(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func plusFunc(){
        print("plus")
        let thirdVC = ThirdViewController()
        thirdVC.navigationItem.title = "ThirdViewController"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationController?.pushViewController(thirdVC, animated: true)
        
//        present(thirdVC, animated: true, completion: nil)
    }
}

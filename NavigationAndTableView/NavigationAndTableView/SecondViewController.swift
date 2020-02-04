//
//  SecondViewController.swift
//  NavigationAndTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nextThirdVC))
        
        presentButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(presentButton)
        presentButton.backgroundColor = UIColor.blue
        presentButton.setTitle("Present ThirdVC", for: .normal)
        presentButton.addTarget(self, action: #selector(presentThirdVC), for: .touchUpInside)
    }
    
    @objc func nextThirdVC(){
        let thirdVC = ThirdViewController()
        thirdVC.title = "Third VC"
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @objc func presentThirdVC(){
        let thirdVC = ThirdViewController()
        present(thirdVC, animated: true, completion: nil)
    }
}

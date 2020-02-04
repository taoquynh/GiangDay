//
//  ThirdViewController.swift
//  HocUINavigationController
//
//  Created by Taof on 8/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red:0.00, green:0.80, blue:0.60, alpha:1.0)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .done, target: self, action: #selector(plusFunc))
        
        dismissButton.frame = CGRect(x: 150, y: 250, width: 100, height: 50)
        dismissButton.backgroundColor = UIColor.red
        dismissButton.setTitle("Dismiss", for: .normal)
        view.addSubview(dismissButton)
        
        dismissButton.addTarget(self, action: #selector(dismissFunction), for: .touchUpInside)
    }
    
    @objc func dismissFunction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func plusFunc(){
        print("plus")
        let fourVC = FourViewController()
        fourVC.navigationItem.title = "FourViewController"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationController?.pushViewController(fourVC, animated: true)
    }

}

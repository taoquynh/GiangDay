//
//  FourViewController.swift
//  HocUINavigationController
//
//  Created by Taof on 8/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    let backToButton = UIButton()
    let backToSecondVCButton = UIButton()
    let backToRootVC = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red:0.80, green:0.60, blue:1.00, alpha:1.0)
    
        backToButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        backToSecondVCButton.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        backToRootVC.frame = CGRect(x: 50, y: 400, width: 300, height: 50)
        
        backToButton.setTitle("Back về màn trước", for: .normal)
        backToSecondVCButton.setTitle("Back về màn 2", for: .normal)
        backToRootVC.setTitle("Back về màn đầu tiên", for: .normal)
        
        backToButton.backgroundColor = UIColor.orange
        backToSecondVCButton.backgroundColor = UIColor.blue
        backToRootVC.backgroundColor = .black
        
        view.addSubview(backToButton)
        view.addSubview(backToSecondVCButton)
        view.addSubview(backToRootVC)
        
        // thêm action
        backToButton.addTarget(self, action: #selector(backFunc), for: .touchUpInside)
        
        backToSecondVCButton.addTarget(self, action: #selector(backToSecond), for: .touchUpInside)
        
        backToRootVC.addTarget(self, action: #selector(backToRoot), for: .touchUpInside)
    }
    
    @objc func backFunc(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backToSecond(){
        // cách 1:
//        if let secondVC = navigationController?.viewControllers[1] as? SecondViewController {
//            navigationController?.popToViewController(secondVC, animated: true)
//        }
        
        // cách2:
        for vc in navigationController!.viewControllers{
            if let secondVC = vc as? SecondViewController {
                navigationController?.popToViewController(secondVC, animated: true)
            }
        }
    }
    
    @objc func backToRoot(){
        navigationController?.popToRootViewController(animated: true)
    }
}

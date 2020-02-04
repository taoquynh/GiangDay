//
//  ThirdViewController.swift
//  NavigationAndTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let dismiss = UIButton()
    let backRoot = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        
        dismiss.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        view.addSubview(dismiss)
        dismiss.backgroundColor = UIColor.blue
        dismiss.setTitle("Dismiss", for: .normal)
        dismiss.addTarget(self, action: #selector(dismissFunc), for: .touchUpInside)
        
        backRoot.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        view.addSubview(backRoot)
        backRoot.backgroundColor = UIColor.red
        backRoot.setTitle("Back", for: .normal)
        backRoot.addTarget(self, action: #selector(backRootFunc), for: .touchUpInside)
    }
    
    @objc func dismissFunc(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func backRootFunc(){
        //back về màn trước nó
        //        navigationController?.popViewController(animated: true)
        
        // từ đâu cũng back về màn đầu tiên (màn root)
        navigationController?.popToRootViewController(animated: true)
        
        // back về màn bất kì trước nó
//        C1
//        if let secondVC = navigationController?.viewControllers[1] as? SecondViewController{
//            navigationController?.popToViewController(secondVC, animated: true)
//        }
        
        
//        C2
        for vc in navigationController!.viewControllers{
            if let secondVC = vc as? SecondViewController{
                navigationController?.popToViewController(secondVC, animated: true)
            }
        }
    }
    
}

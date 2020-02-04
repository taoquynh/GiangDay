//
//  MainViewController.swift
//  NavigationAndTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        //c1:
//        title = "Main Screen"
        
        // c2:
        navigationItem.title = "Main View Controller"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFunction))
        
//        let secondeVCButton = UIBarButtonItem(title: "SecondVC", style: .done, target: self, action: #selector(addFunction))
        
//        let homeButton = UIBarButtonItem(image: UIImage(named: "home"), style: .plain, target: self, action: #selector(addFunction))
        
        // đổi màu button
        addButton.tintColor = UIColor.init(white: 0.9, alpha: 1)
        addButton.tintColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0, alpha: 1)
        addButton.tintColor = UIColor.init(red: 0.3, green: 0.2, blue: 0, alpha: 1)
        
        navigationItem.rightBarButtonItem = addButton
//        navigationItem.rightBarButtonItems = [secondeVCButton]
        
    }
    
    @objc func addFunction(){
        let secondVC = SecondViewController()
        
        secondVC.navigationItem.title = "Second VC"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(secondVC, animated: true)
    }

}

//
//  MainViewController.swift
//  HocUINavigationController
//
//  Created by Taof on 8/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let nextButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.frame = CGRect(x: 150, y: 250, width: 100, height: 50)
        nextButton.backgroundColor = UIColor.red
        nextButton.setTitle("Sang màn 2", for: .normal)
        view.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextFunction), for: .touchUpInside)
    
    
    
        view.backgroundColor = UIColor(red:0.80, green:0.90, blue:1.00, alpha:1.0)
        
        // Cách 1:
//        title = "Main ViewController"
        
        // Cách 2:
        navigationItem.title = "Main ViewController"
        
        // thêm UIBarButtonItem bên trái
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraFunc))
        
        // thêm một nút bên phải
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addFunc))
        
        let plusButton = UIBarButtonItem(image: UIImage(named: "plus"), style: .done, target: self, action: #selector(plusFunc))
        
        plusButton.tintColor = UIColor.red
        navigationItem.rightBarButtonItems = [plusButton, addButton]
    }
    
    @objc func nextFunction(){
        let secondVC = SecondViewController()
        let navigationVC = UINavigationController(rootViewController: secondVC)
        
        present(navigationVC, animated: true, completion: nil)
    }
    
    @objc func cameraFunc(){
        print("camera")
    }
    
    @objc func addFunc(){
        print("add")
    }
    
    @objc func plusFunc(){
        print("plus")
        let secondVC = SecondViewController()
        secondVC.navigationItem.title = "SecondViewController"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationController?.pushViewController(secondVC, animated: true)
    }

}

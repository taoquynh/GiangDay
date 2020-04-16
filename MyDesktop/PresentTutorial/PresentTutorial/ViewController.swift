//
//  ViewController.swift
//  PresentTutorial
//
//  Created by Quynh on 4/16/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goPress(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let screen2VC = storyboard.instantiateViewController(withIdentifier: "ScreenTwoViewController") as! ScreenTwoViewController
        screen2VC.name = "Anna"
        screen2VC.modalPresentationStyle = .fullScreen
        self.present(screen2VC, animated: true, completion: nil)
    }
    
}


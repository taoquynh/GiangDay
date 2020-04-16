//
//  ScreenTwoViewController.swift
//  PresentTutorial
//
//  Created by Quynh on 4/16/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ScreenTwoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = name {
            nameLabel.text = name
        }
    }
    
    @IBAction func dismissPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

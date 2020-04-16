//
//  Screen2ViewController.swift
//  DieuHuongManHinh
//
//  Created by Quynh on 3/24/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class Screen2ViewController: UIViewController {

    var text: String = ""
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        print(text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = "ABC"
    }
}



//
//  PawWagVC.swift
//  AutoLayout
//
//  Created by Techmaster on 3/27/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class PawWagVC: UIViewController {
    
    let pawwag = PawWagView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv (
            pawwag
        )
        
        //pawwag.text = "Cuong"
        pawwag.centerInContainer()
    }
}

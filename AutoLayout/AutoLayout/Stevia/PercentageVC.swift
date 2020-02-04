//
//  PercentageVC.swift
//  AutoLayout
//
//  Created by Techmaster on 8/12/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class PercentageVC: UIViewController {
    let view1 = UIView(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(view1)
        view1.backgroundColor = UIColor.blue
        view1.top(20%)
        view1.left(15%)
        view1.bottom(50%)
        view1.right(15%)
        
        //view1.Height == 47 % button.Width
    }



}

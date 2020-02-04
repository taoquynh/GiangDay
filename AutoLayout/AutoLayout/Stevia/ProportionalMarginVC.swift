//
//  ProportionalMarginVC.swift
//  AutoLayout
//
//  Created by Techmaster on 8/11/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class ProportionalMarginVC: UIViewController {

    let red_rect1 = UIView(frame: CGRect.zero)
    let red_rect2 = UIView(frame: CGRect.zero)
    let red_rect3 = UIView(frame: CGRect.zero)
    let spacer1 = UIView(frame: CGRect.zero)
    let spacer2 = UIView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        red_rect1.backgroundColor = UIColor.red
        red_rect2.backgroundColor = UIColor.green
        red_rect3.backgroundColor = UIColor.brown
        
        view.sv(
            red_rect1,
            spacer1,
            red_rect2,
            spacer2,
            red_rect3
        )
        let margin: CGFloat = 10.0
     
        view.layout(
            |-(16)-red_rect1-(16)-| ~ 80,
            spacer1.width(0),
            |-(16)-red_rect2-(16)-| ~ 80,
            spacer2.width(0),
            |-(16)-red_rect3-(16)-| ~ 80
        )
    
        red_rect1.Top == view.safeAreaLayoutGuide.Top + margin
        red_rect3.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        spacer1.Height == spacer2.Height * 2.0
    }
}

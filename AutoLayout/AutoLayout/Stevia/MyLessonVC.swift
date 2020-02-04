//
//  MyLessonVC.swift
//  AutoLayout
//
//  Created by Techmaster on 8/12/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class MyLessonVC: UIViewController {
    let bigView = UIView(frame: CGRect.zero)
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
            bigView.sv(
                red_rect1,
                spacer1,
                red_rect2,
                spacer2,
                red_rect3
            )
        )
        view.layout(
            |-(0)-bigView-(0)-|
        )
        
        bigView.Top == view.safeAreaLayoutGuide.Top
        bigView.Bottom == view.safeAreaLayoutGuide.Bottom
        
        bigView.layout(
            |-red_rect1.size(80)-(0)-spacer1.height(10)-(0)-red_rect2.size(80)-(0)-spacer2.height(10)-(0)-red_rect3.size(80)-|
        )
        spacer2.Width == spacer1.Width * 3.0
        
        red_rect1.centerVertically()
        red_rect2.centerVertically()
        red_rect3.centerVertically()
    }
    

    
}

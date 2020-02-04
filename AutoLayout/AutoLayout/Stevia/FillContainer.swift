//
//  FillContainer.swift
//  AutoLayout
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class FillContainer: UIViewController {
    let rec1 = UIView()
    let rec2 = UIView()
    let rec3 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(
            rec1.sv(
                rec2.sv(
                    rec3
                )
            )
        )
        rec1.Top == view.safeAreaLayoutGuide.Top + 20
        view.layout (
            |-20-rec1-20-|,    
            20
        )
        //rec1.fillContainer(20)
        rec2.fillContainer(20)
        rec3.fillContainer(20)
       
        rec1.backgroundColor = UIColor.gray
        rec2.backgroundColor = UIColor.blue
        rec3.backgroundColor = UIColor.orange
    }
    

}

//
//  FourRects.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class FourRects: UIViewController {

    let rec1 = UIView()
    let rec2 = UIView()
    let rec3 = UIView()
    let rec4 = UIView()
    let circle = UIView()
    let margin: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(
            rec1,
            rec2,
            rec3,
            rec4,
            circle
        )
        
        rec1.Top == view.safeAreaLayoutGuide.Top + margin
        rec2.Top == view.safeAreaLayoutGuide.Top + margin
   
        rec3.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        rec4.Bottom == view.safeAreaLayoutGuide.Bottom - margin
       
        //width(80).height(80) có thể viết lại thành size(80)
        view.layout (
            |-margin-rec1-(0)-rec2.size(40)-margin-|,
            |-margin-rec3.size(40)-(>=20)-rec4.size(40)-margin-|
        )
        
        //circle.width(80).height(80).centerVertically().centerHorizontally()
        circle.size(80).centerVertically().centerHorizontally()
        
        rec1.backgroundColor = UIColor.gray
        rec2.backgroundColor = UIColor.blue
        rec3.backgroundColor = UIColor.red
        rec4.backgroundColor = UIColor.orange
        circle.backgroundColor = UIColor.black
        circle.layer.cornerRadius = 40
    }

}

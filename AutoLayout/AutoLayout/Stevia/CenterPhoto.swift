//
//  Stevia.swift
//  AutoLayout
//
//  Created by Techmaster on 3/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class CenterPhoto: UIViewController {

    let photo = UIImageView(image: UIImage.init(named: "stefania"))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.sv(
            photo
        )
        /*
        photo.centerHorizontally()
        photo.centerVertically()
        */
        
        //Có thể thay bằng lệnh này
        photo.centerInContainer()
    }    
}

//
//  GrapeVine.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class GrapeVine: UIViewController {

    let logo = UIImageView.init(image: UIImage.init(named: "grapevine"))
    let skip = UILabel()
    let pageControl = UIPageControl()
    let teaser = UIImageView.init(image: UIImage.init(named: "teaser"))
    let welcome = UILabel()
    let margin: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        //https://www.uicolor.xyz/#/hex-to-ui
        view.backgroundColor = UIColor(red:0.17, green:0.40, blue:0.24, alpha:1.0)
        view.sv(logo, skip, teaser, welcome, pageControl)
        
        skip.text = "Skip"
        skip.textColor = UIColor.white
        skip.font = UIFont.boldSystemFont(ofSize: 18)
        
        logo.Top == view.safeAreaLayoutGuide.Top + margin
        //skip.Top == logo.Top
        align(tops: skip, logo)
        
        welcome.attributedText = "<h1 align='center'>Welcome to GrapeVine</h1><p align='center'><br> in all over the world</p>".htmlAttributed(using: UIFont.init(name: "Helvetica", size: 14)!, color: UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        
        
        welcome.numberOfLines = 0
        pageControl.numberOfPages = 8
       
        pageControl.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        
        view.layout(
            |-margin-logo.size(40)-(>=30)-skip.width(40)-margin-|,
            teaser.centerHorizontally().centerVertically(),
            (>=4),
            welcome.centerHorizontally(),
            (>=4),
            pageControl.centerHorizontally()
        )
       
    }
    


}

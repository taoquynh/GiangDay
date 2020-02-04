//
//  IconLabel.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class IconLabel: UIView {
    public let icon = UIImageView()
    public let label = UILabel()
    convenience init(text: String, image: UIImage) {
        self.init(frame:CGRect.zero)
        
        icon.image = image
        label.text = text
        
        sv(icon, label)
       
        self.height(60)
        layout(|-icon.size(40)-(>=5)-label-|)
        icon.centerVertically()
        label.centerVertically()
    
        backgroundColor = UIColor.lightGray
        layer.cornerRadius = 5
        layer.shadowOffset = CGSize(width: 2, height:2)
        layer.shadowOpacity = 0.5

    }
}

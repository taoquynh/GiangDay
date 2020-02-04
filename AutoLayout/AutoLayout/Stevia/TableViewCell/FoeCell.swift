//
//  FoeCell.swift
//  AutoLayout
//
//  Created by Techmaster on 8/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class FoeCell: UITableViewCell {

    let avatar = UIImageView()
    let name = UILabel()
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.lightGray
        sv(
            name.style(nameStyle),
            avatar
        )
        self.height(90)
        
        avatar.size(80).centerVertically()
        align(horizontally: |-20-name-avatar-20-|)
        avatar.layer.cornerRadius = 40        
        avatar.clipsToBounds = true
    }
    
    func nameStyle(l:UILabel) {
        l.font = .systemFont(ofSize: 24)
        l.textColor = .blue
    }

}

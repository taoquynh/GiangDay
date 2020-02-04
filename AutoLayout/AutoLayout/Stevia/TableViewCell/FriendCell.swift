//
//  FriendCell.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import Stevia
class FriendCell: UITableViewCell {
    
    let avatar = UIImageView()
    let name = UILabel()
    let age = UILabel()
    let rightView = UIView()
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            avatar,
            rightView.sv(
                name.style(nameStyle),
                age.style(nameStyle)
            )
            
        )
        self.height(90)
        
        
        self.layout(|-20-avatar.size(80).centerVertically()-rightView.height(80).centerVertically()-20-|)
        
        rightView.layout(
            8,
            |-name,
            (>=10),
            |-age,
            8
        )
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        age.text = "100"
    }
    
    func nameStyle(l:UILabel) {
        l.font = .systemFont(ofSize: 24)
        l.textColor = .blue
    }
}

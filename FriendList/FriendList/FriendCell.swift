//
//  FriendCell.swift
//  FriendList
//
//  Created by Techmaster on 5/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        photo.layer.cornerRadius = photo.bounds.width * 0.5
        photo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

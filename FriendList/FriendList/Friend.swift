//
//  Friend.swift
//  FriendList
//
//  Created by Techmaster on 5/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class Friend: NSObject, NSCoding {
    var fullName: String!
    var mobile: String!
    var photo: UIImage?

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("friends")
    
    init(fullName: String, mobile: String, photo: UIImage?) {
        self.fullName = fullName
        self.mobile = mobile
        self.photo = photo
    }

    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let mobile = "mobile"
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(fullName, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(mobile, forKey: PropertyKey.mobile)
    }


    required convenience init?(coder aDecoder: NSCoder) {

        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String, let mobile = aDecoder.decodeObject(forKey: PropertyKey.mobile) as? String else {
            return nil
        }

        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage

        self.init(fullName: name, mobile: mobile, photo: photo)

    }

}


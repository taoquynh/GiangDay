//
//  Item.swift
//  DemoRealm
//
//  Created by Taof on 11/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var ID = 0
    @objc dynamic var name = ""
    @objc dynamic var content = ""
    
    // Khoá chính của đối tượng Item
    override static func primaryKey() -> String? {
        return "ID"
    }
}

//
//  CheckNumber.swift
//  Information
//
//  Created by Taof on 4/10/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class CheckNumber {
    static func checkNumber(content: String) -> Bool {
        let number = Int(content)
        if number != nil {
            return true
        }
        
        return false
    }
}

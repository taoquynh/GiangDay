//
//  File.swift
//  Information
//
//  Created by Taof on 4/10/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let string = formatter.string(from: date)
        
        return string
    }
}

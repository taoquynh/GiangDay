//
//  Extensions.swift
//  MVC
//
//  Created by Quynh on 2/19/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import Foundation

extension String {
    func split() -> [String]{
        return self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines).filter({$0 != ""})
    }
}

extension Array {
    func unique<T: Equatable>() -> [T] {
        var uniqueValues = [T]();
        
        for value in self {
//            if !contains(uniqueValues, value as! T) {
//                uniqueValues.append(value as! T);
//            }
            if contains(where: uniqueValues){
                
            }
        }
        return uniqueValues;
    }
    
    func first<T>(test:(T) -> Bool) -> T? {
        for value in self {
            if test(value as! T) {
                return value as? T;
            }
        }
        return nil;
    }
}

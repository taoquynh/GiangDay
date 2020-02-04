//
//  File.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthManager {
    // hàm đăng kí
    // @escaping là để truyền vào tham số một closure
    func register(email: String, password: String, completionBlock: @escaping ((_ success: Bool) -> Void)){
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            if let user = userResult?.user {
                print(user)
                completionBlock(true)
            }else{
                print(error)
                completionBlock(false)
            }
        }
    }
    
    // đăng nhập
    func login(email: String, password: String, completionBlock: @escaping ((_ success: Bool) -> Void)){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completionBlock(false)
                print(error)
            } else {
                completionBlock(true)
            }
        }
    }
    
    // đăng xuất
    func logout(completionBlock: @escaping ((_ success: Bool) -> Void)){
        do {
            try Auth.auth().signOut()
            completionBlock(true)
        } catch let signOutError as NSError {
            print("Lỗi: \(signOutError)")
            completionBlock(false)
        }
    }
}

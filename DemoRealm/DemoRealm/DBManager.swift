//
//  DBManager.swift
//  DemoRealm
//
//  Created by Taof on 11/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    // Khai báo biến tham chiếu tới cơ sở dữ liệu Realm
    private var database: Realm
    
    // Biến toàn cục chứa thực thể duy nhất của lớp DBManager
    static let sharedInstance = DBManager()
    static var autoID: Int = 0
    var userData: UserDefaults!
    
    // Hàm khởi tạo
    private init() {
        // Khởi tạo database realm
        database = try! Realm()
        print(database.configuration.fileURL)
        
        userData = UserDefaults.standard
        // Đọc thông tin auID đã lưu nếu có
        DBManager.autoID = userData.integer(forKey: "autoID")
    }
    
    // Hàm lấy về danh sách dữ liệu có trong cơ sở dữ liệu
    func getDataFromDB() -> Results<Item> {
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    // Hàm insert dữ liệu
    func addData(object: Item) {
        try! database.write {
//            database.add(object, update: true)
            print("Add new object")
            userData.set(DBManager.autoID, forKey: "autoID")
            DBManager.autoID += 1
            object.ID = DBManager.autoID
            database.add(object)
        }
    }
    
    // Hàm xoá tất cả dữ liệu
    func deleteAllFromDatabase() {
        try! database.write {
            database.deleteAll()
        }
    }
    
    //  Hàm xoá 1 đối trượng trong cơ sở dữ liệu
    func deleteFromDb(object: Item) {
            try! database.write {
                database.delete(object)
        }
    }
}

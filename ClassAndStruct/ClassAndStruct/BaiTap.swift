//
//  File.swift
//  ClassAndStruct
//
//  Created by Taof on 10/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class NhanVien {
    var name: String
    var age: Int
    var salary: Float
    var totalHourWorked: Int
    var totalIncome: Float = 0.0
    
    init(name: String, age: Int, salary: Float, totalHourWorked: Int) {
        self.name = name
        self.age = age
        self.salary = salary
        self.totalHourWorked = totalHourWorked
    }
}


func tinhTienThuong(){
    let nv1 = NhanVien(name: "Hường", age: 18, salary: 3200000, totalHourWorked: 100)
    let nv2 = NhanVien(name: "Quang", age: 18, salary: 3400000, totalHourWorked: 120)
    let nv3 = NhanVien(name: "Dương", age: 18, salary: 5000000, totalHourWorked: 205)
    let nv4 = NhanVien(name: "Khang", age: 18, salary: 4600000, totalHourWorked: 180)
    let nv5 = NhanVien(name: "Nhung", age: 18, salary: 3000000, totalHourWorked: 220)
    
    var nhanViens = [NhanVien]()
    
    nhanViens = [nv1, nv2, nv3, nv4, nv5]
    
    for item in nhanViens {
        switch item.totalHourWorked {
        case 0..<100:
            item.totalIncome = item.salary
        case 100..<200:
            item.totalIncome = item.salary + item.salary * 0.1
        case 200...:
            item.totalIncome = item.salary + item.salary * 0.2
        default:
            return
        }
    }
    
    print("STT | Tên NV | Tuổi | Lương     | Tổng giờ làm | Tổng thu nhập")
    for (index, item) in nhanViens.enumerated(){
        print("\(index + 1)   | \(item.name)  | \(item.age)   | \(item.salary) | \(item.totalHourWorked)          | \(item.totalIncome)")
    }
}

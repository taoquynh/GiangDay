////
////  main.swift
////  ClassAndStruct
////
////  Created by Taof on 10/22/19.
////  Copyright © 2019 Taof. All rights reserved.
////
//
//import Foundation
//
//// khai báo class
//class Animal {
//
//    // deinit được sử dụng để giải phóng bộ nhớ khi đối tượng bị huỷ
//    deinit {
//        print("Đã huỷ")
//    }
//    // nếu như các thuộc tính đã khởi tạo giá trị ban đầu, thì có thể bỏ qua khởi tạo class
//    var name: String = ""
//    var color: String = ""
//    var numberOfFeeds: Int = 0
//
//    // có thể viết hàm khởi tạo class
//    init() { // khởi tạo rỗng
//    }
//
//    init(name: String) { // khởi tạo truyền vào một tham số
//        self.name = name
//    }
//
//    init(name: String, color: String, numberOfFeeds: Int) { // khởi tạo đầy đủ
//        self.name = name
//        self.color = color
//        self.numberOfFeeds = numberOfFeeds
//    }
//
//    func sounds(){
//        print("Tiếng của động vật")
//    }
//}
//
//var dog: Animal = Animal()
//dog.name = "Ki"
//print(dog.name)
//
//var cat: Animal = Animal(name: "Mèo mun")
//var chicken = Animal(name: "Gà Đông Tảo", color: "Màu vàng", numberOfFeeds: 2)
//
//print(chicken.name, chicken.color, chicken.numberOfFeeds)
//
//
//// khai báo struct
//struct Classroom {
//    var numberOfRoom: Int
//    var area: Float
//    var countTable: Int
//
//    init(numberOfRoom: Int, area: Float, countTable: Int) {
//        self.numberOfRoom = numberOfRoom
//        self.area = area
//        self.countTable = countTable
//    }
//}
//
//var room1 = Classroom.init(numberOfRoom: 201, area: 60, countTable: 24)
//var room2 = Classroom(numberOfRoom: 101, area: 30, countTable: 12)
//
//print(room1.numberOfRoom)
//
//
//// class là kiểu tham trị
//// các đối tượng được khởi tạo bằng hình thức gán giá trị thì đều tham chiếu đến một ô nhớ
//var animal1 = Animal(name: "cá", color: "xanh", numberOfFeeds: 0)
//var animal2: Animal? = animal1
//// trước khi đổi thuộc tính name của animal2
//print(animal1.name)
//print(animal2?.name)
//animal2?.name = "heo"
//// sau khi đổi thuộc tính name của animal2
//print(animal1.name)
//print(animal2?.name)
//
//print(animal1.sounds())
//
////animal2 = nil
//var animal: Animal? = Animal(name: "cá")
//print(animal?.name)
//animal = nil
//
//
////print("-----struct---")
//// struct là kiểu tham số
////var room3 = Classroom(numberOfRoom: 1, area: 10.4, countTable: 4)
////var room4 = room3
////
////print(room3.numberOfRoom)
////print(room4.numberOfRoom)
////
////room4.numberOfRoom = 10
////print(room3.numberOfRoom)
////print(room4.numberOfRoom)
//
//
//

tinhTienThuong()

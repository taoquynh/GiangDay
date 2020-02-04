//
//  ViewController.swift
//  HuongDanTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // khởi tạo tableView
    let tableView = UITableView()
    var topHeight: CGFloat = 0
    var bottomHeight: CGFloat = 0
    var barHeight: CGFloat = 0
    
    let cellID = "cell"
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        // tính chiều cao navigation bar
        barHeight = navigationController?.navigationBar.frame.height ?? 0.0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            
            // tính chiều cao phần ngoài safe area
            topHeight = window?.safeAreaInsets.top ?? 0.0
            bottomHeight = window?.safeAreaInsets.bottom ?? 0.0
        }
        
        title = "Todo List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newData))
        setupTableView()
    }
    
    @objc func newData(){
        // khởi tạo màn 2
        let createVC = CreateItemViewController()
        createVC.title = "Thêm thông tin"
        
        // hứng closure (hứng dữ liệu từ màn 2)
        createVC.passObject = {
            [weak self] data in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.items.append(data)
            strongSelf.tableView.reloadData()
            
        }
        // chuyển sang màn 2
        navigationController?.pushViewController(createVC, animated: true)
    }

    func setupTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: barHeight + topHeight).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // gán delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        // đăng kí cell
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellID) // dùng cho cell mặc định
        
        // đặt chiều cao tối thiểu cho cell
        tableView.estimatedRowHeight = 64
        // đặt chiều cao tự động theo nội dung
        tableView.rowHeight = UITableView.automaticDimension
        // tắt chế độ nảy của scroll
        tableView.bounces = false
        // gán cho table footer view bằng một UIView trắng
        tableView.tableFooterView = UIView()
        // separatorStyle là đường line giữa các cell
//        tableView.separatorStyle = .none
    }
    
    func createData(){
        let item1 = Item(name: "Hà Văn Lâu", address: "Việt Nam - Hải Dương", photo: UIImage(named: "burger-bk"))
        let item2 = Item(name: "Lê Quang Anh", address: "Việt Nam - Ninh Bình", photo: UIImage(named: "burger-bk"))
        
        items = [item1, item2]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // hàm này trả về số dòng trong một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // hàm trả về nội dung của một cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        
        // gán giá trị cho các thành phần trong cell
        cell.photoImageView.image = items[indexPath.row].photo
        cell.nameLabel.text = items[indexPath.row].name
        cell.addressLabel.text = items[indexPath.row].address
        
        return cell
    }
    
    // hàm edit action của cell, delete, edit
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // khởi tạo nút delete kiểu UITableViewRowAction
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            print("delete")
            self.items.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        // khởi tạo nút edit kiểu UITableViewRowAction
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            print("edit")
            let newItemVC = CreateItemViewController()
            
            newItemVC.photoImageView.image = self.items[indexPath.row].photo
            newItemVC.nameTextField.text = self.items[indexPath.row].name
            newItemVC.addressTextView.text = self.items[indexPath.row].address
            
            newItemVC.passObject = {
                [weak self] newData in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.items[indexPath.row].photo = newData.photo
                strongSelf.items[indexPath.row].name = newData.name
                strongSelf.items[indexPath.row].address = newData.address
                strongSelf.tableView.reloadData()
                
            }
            self.navigationController?.pushViewController(newItemVC, animated: true)
        }
        
        delete.backgroundColor = UIColor.red
        edit.backgroundColor = UIColor.blue
        
        // trả về mảng gồm 2 nút
        return [delete, edit]
    }
    
    // hàm chọn cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("đã chọn cell")
    }
}

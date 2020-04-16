//
//  ViewController.swift
//  DemoRealm
//
//  Created by Taof on 11/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        navigationItem.title = "Danh sách item"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createItem))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @objc func createItem(){
        let createItem = CreateData()
        createItem.title = "Tạo mới item"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationController?.pushViewController(createItem, animated: true)
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func onDeleteAll(_ sender: Any) {
        DBManager.sharedInstance.deleteAllFromDatabase()
        tableView.reloadData()
    }
    
    func ConvertImageToBase64String (img: UIImage) -> String {
        let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        return imgString
    }
    
    func ConvertBase64StringToImage (imageBase64String:String) -> UIImage? {
        guard let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0)) else {
            return nil
        }
        let image = UIImage(data: imageData)
        return image
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = DBManager.sharedInstance.getDataFromDB()[indexPath.row] as Item
        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "abc"
//        print(item.myDog?.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let data = DBManager.sharedInstance.getDataFromDB()[indexPath.row]
            DBManager.sharedInstance.deleteFromDb(object: data)
            tableView.reloadData()
        }
    }
}

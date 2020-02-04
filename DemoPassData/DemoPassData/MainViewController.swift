//
//  MainViewController.swift
//  DemoPassData
//
//  Created by Taof on 9/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let itemNames = ["Notification", "Delegate", "Closure"]
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .groupTableViewBackground
        title = "Pass Data"
        
        // gán delegate và datasource cho tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // đăng kí cell mặc định
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = itemNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print(itemNames[indexPath.row])
            let noti1 = NotificationScreen1()
            navigationController?.pushViewController(noti1, animated: true)
        case 1:
            print(itemNames[indexPath.row])
        case 2:
            print(itemNames[indexPath.row])
        default:
            break
        }
    }
}

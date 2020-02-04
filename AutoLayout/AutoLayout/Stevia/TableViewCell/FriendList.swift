//
//  FriendList.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
class Friend {
    var avatar: String
    var name: String
    var love: Float
    init (avatar: String, name: String, love: Float) {
        self.avatar = avatar
        self.name = name
        self.love = love
    }
}

class Foe {
    var avatar: String
    var name: String
    var hate: Float
    init (avatar: String, name: String, hate: Float) {
        self.avatar = avatar
        self.name = name
        self.hate = hate
    }
}


class FriendList: UITableViewController {
    var friends = [
        Friend(avatar: "ferarrio_ava", name: "Stefania Ferarrio", love: 4),
        Foe(avatar: "unchained", name: "Unchained Django", hate: 4),
        Friend(avatar: "burno_ava", name: "Burno Thawonse", love: 3),
        Friend(avatar: "john_ava", name: "John Bolta", love: 2),
        Foe(avatar: "tyson", name: "Mike Tyson", hate: 5),
        Friend(avatar: "bradpitt", name: "Brad Pitt", love: 5)
        ] as [Any]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        tableView.register(FoeCell.self, forCellReuseIdentifier: "FoeCell")
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell: UITableViewCell?
        
        let who = friends[indexPath.row]
        if who is Friend {
            let friendcell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
            let friend = who as! Friend
            friendcell.avatar.image = UIImage(named: friend.avatar)
            friendcell.name.text = friend.name
            //cell = friendcell
            return friendcell
        } else {
            let foecell = tableView.dequeueReusableCell(withIdentifier: "FoeCell", for: indexPath) as! FoeCell
            let foe = who as! Foe
            foecell.avatar.image = UIImage(named: foe.avatar)
            foecell.name.text = foe.name
            return foecell
            //cell = foecell
        }

        //return cell!
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}

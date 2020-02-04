//
//  FriendTableVC.swift
//  FriendList
//
//  Created by Techmaster on 5/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class FriendTableVC: UITableViewController {
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        friends = loadFriends() ?? []
    }

    // MARK: - Table view data source

    @IBAction func onCreateNewFriend(_ sender: UIBarButtonItem) {
        let addFriendVC = storyboard?.instantiateViewController(withIdentifier: "AddFriendVC") as! AddFriendVC

        addFriendVC.delegate = self

        navigationController?.pushViewController(addFriendVC, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCell
        let friend = friends[indexPath.row]
        cell.photo.image = friend.photo
        cell.fullName.text = friend.fullName
        cell.mobile.text = friend.mobile
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            friends.remove(at: indexPath.row)
            saveFriends()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    private func saveFriends() {
        /*let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(friends, toFile: Friend.ArchiveURL.path)
        if isSuccessfulSave {
            print("Saving friends success")
        } else {
            print("Saving friends failed")
        }*/
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: friends, requiringSecureCoding: false)
            try data.write(to: URL(fileURLWithPath: Friend.ArchiveURL.path))
        } catch {
            print("Couldn't write file")
        }
    }

    fileprivate func loadFriends() -> [Friend]? {
       // return NSKeyedUnarchiver.unarchiveObject(withFile: Friend.ArchiveURL.path) as? [Friend]
        if let nsData = NSData(contentsOfFile: Friend.ArchiveURL.path) {
            do {
                let data = Data(referencing:nsData)
                if let loadedFrieds = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Friend]
                {
                    return loadedFrieds
                }
            }
            catch {
                print("Couldn't read file.")
            }
        }
        return nil
    }
}

extension FriendTableVC: AddFriendVCDelegate {

    func saveObject(_ friend: Friend) {
        friends.append(friend)
        saveFriends()
        tableView.reloadData()
    }

}

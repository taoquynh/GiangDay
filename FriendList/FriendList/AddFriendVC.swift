//
//  AddFriendVC.swift
//  FriendList
//
//  Created by Techmaster on 5/10/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

protocol AddFriendVCDelegate: class {
    func saveObject(_ friend: Friend)
}

class AddFriendVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var previewPhoto: UIImageView!
    weak var delegate: AddFriendVCDelegate?

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    fileprivate let imageName = UUID().uuidString

    lazy var saveBarButton: UIBarButtonItem = {
        let saveBarButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveObject(_:)))
        return saveBarButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Friend"
        self.navigationItem.rightBarButtonItem = saveBarButton
    }


    @objc fileprivate func saveObject(_ sender: UIBarButtonItem) {

        guard let fullName = fullNameTextField.text, let mobile = mobileTextField.text, fullName.count > 0, mobile.count > 0 else {
            return
        }

        let newFriend = Friend(fullName: fullName, mobile: mobile, photo: previewPhoto.image)

        delegate?.saveObject(newFriend)

        navigationController?.popViewController(animated: true)
    }

    @IBAction func onSelectPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        previewPhoto.image = image
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}

//
//  CreateItemViewController.swift
//  HuongDanTableView
//
//  Created by Taof on 8/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
// import thư viện photo để kiểm tra trạng thái uỷ quyền truy cập thư viện ảnh, camera
import Photos

class CreateItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    // vậy bên này
    // k dùng giao diện, em khởi tạo là được à
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.lightGray
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    let addressTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.lightGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "burger-breslin")
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        button.setTitle("Lưu Thông Tin", for: .normal)
        return button
    }()
    
    // Khởi tạo
    let imagePicker = UIImagePickerController()
    
    // khai báo closure
    var passObject: ((Item) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        // nó ở đây này, chạy viewdidload mới dựng giao diện
        // nếu gán còn trước khi có giao diện thì chả lỗi
        // vậy là gọi khởi tạo let newVC = CreateVC() như thế này thì nó đã chạy viewDidLoad đâu
        // có ai bảo chạy đâu? k chạy thì nó cũng chưa dụng layout
        // đúng rồi, print ra là thấy, nên mới có mẹo load trước khi push là vc.view kia.
        // ok, để e test rồi giải thích với học viên
        // rõ nhất là cứ print ra ở các bước mà test -  
        setupLayout()
    
        configControl()
        
        // gán delegate cho imagePicker
        // để delegate của imagePicker hoạt động thì class này phải kế thừa UINavigationControllerDelegate và UIImagePickerControllerDelegate
        imagePicker.delegate = self
    }
    
    func setupLayout(){
        view.addSubview(nameTextField)
        view.addSubview(addressTextView)
        view.addSubview(photoImageView)
        view.addSubview(saveButton)
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        
        addressTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        addressTextView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        addressTextView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        addressTextView.heightAnchor.constraint(equalTo: nameTextField.heightAnchor, multiplier: 3).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: addressTextView.bottomAnchor, constant: 16).isActive = true
        photoImageView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        
    }
    
    func configControl() {
        // gesture cho ảnh
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        photoImageView.addGestureRecognizer(tapGesture)
        
        // action cho nuts
        saveButton.addTarget(self, action: #selector(saveItem), for: .touchUpInside)
    }
    
    @objc func selectImage(){
        print("selected")
        let alert = UIAlertController(title: "App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            // gọi hàm mở camera
            self.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            // gọi hàm mở thư viện
            self.fromGallery()
        })
        
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func saveItem(){
        print("saved")
        // truyền dữ liệu vào trong closure
        passObject?(Item(name: nameTextField.text!, address: addressTextView.text!, photo: photoImageView.image!))
        // popViewController: back về màn trước nó
        navigationController?.popViewController(animated: true)
    }
    
    // mở setting của thiết bị, được gọi khi cần phải thay đổi quyền truy cập library hoặc
    
    func setting(){
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.openURL(settingsUrl)
            } else {
                UIApplication.shared.openURL(settingsUrl)
            }
        }
    }
    
    // mở thư viện
    private func fromGallery(){
        func choosePhoto(){
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.imagePicker.modalPresentationStyle = .popover
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            print("photo denied")
            setting()
            
        }else if (status == PHAuthorizationStatus.notDetermined) {
            
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    self.setting()
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            print("Restricted access")
            setting()
        }
    }
    
    // mở camera
    private func fromCamera(){
        func takePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.cameraDevice = .front
                self.imagePicker.modalPresentationStyle = .fullScreen
                self.present(self.imagePicker, animated: true,completion: nil)
            }else{
                let alert = UIAlertController(title: "Sorry", message: "Không tìm thấy camera", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                takePhoto()
            } else {
                print("camera denied")
                self.setting()
            }
        }
    }
    
    // hàm này xử lý sau khi đã chọn được ảnh thì làm gì
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        
        self.photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
}

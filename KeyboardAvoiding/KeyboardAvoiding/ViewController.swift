//
//  ViewController.swift
//  KeyboardAvoiding
//
//  Created by Taof on 11/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_bg_doimatkhau"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let oldPassWordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "txt_pass_gv")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Mật khẩu cũ"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private let newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "txt_pass_gv")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Mật khẩu mới"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.background = UIImage(named: "txt_pass_gv")
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 56))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 56))
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.placeholder = "Nhập lại mật khẩu"
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupLayout(){
        // Background
        view.backgroundColor = UIColor.white
        view.addSubview(backgroundImageView)
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        // Scrollview
        let scrollView = TPKeyboardAvoidingScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *){
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }else{
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
        }
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // ContainerView
        let containerView = UIView()
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20.0).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // old, new, confirm password
        containerView.addSubview(oldPassWordTextField)
        containerView.addSubview(newPasswordTextField)
        containerView.addSubview(confirmPasswordTextField)
        
        oldPassWordTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        oldPassWordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        oldPassWordTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32).isActive = true
        oldPassWordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        newPasswordTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        newPasswordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        newPasswordTextField.topAnchor.constraint(equalTo: oldPassWordTextField.bottomAnchor, constant: 256).isActive = true
        newPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 280).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 256).isActive = true
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmPasswordTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        oldPassWordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        oldPassWordTextField.becomeFirstResponder()
        setToolBar()
    }
    
    func setToolBar(){
        //khởi tạo toolBar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        // tạo một khoảng trắng (flexible) - tự động dãn theo các thành phần cố định
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        //setting toolbar as inputAccessoryView
        self.confirmPasswordTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
       self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        return true
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == oldPassWordTextField {
//            newPasswordTextField.becomeFirstResponder()
//        }else if textField == newPasswordTextField {
//            confirmPasswordTextField.becomeFirstResponder()
//        }else{
//            self.view.endEditing(true)
//        }
//        return true
//    }
    
    // return fasle để không cho phép chỉnh sửa
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // trạng thái phản hồi đầu tiên
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    // return true để cho phép chỉnh sửa dừng lại và từ bỏ trạng thái phản hồi đầu tiên
    // return false để không cho phép phiên chỉnh sửa kết thúc
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // có thể được gọi nếu bị ép buộc ngay cả khi shouldEndEditing return false hoặc kết thúc chỉnh sửa
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    // nếu được gọi, hàm này sẽ xử lý thay hàm textFieldDidEndEditing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing and reason")
    }
    
    // return false để không thay đổi text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            print(updatedText)
            
            // chỉ nhập 10 kí tự
            if updatedText.count > 10 {
                return false
            }
        }
        return true
    }
    
    // được gọi khi nhấn nút xoá
    // return false để bỏ qua
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    
    // được gọi khi nhấn phím RETURN
    // return false để bỏ qua
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
}


//
//  ViewController.swift
//  Information
//
//  Created by Taof on 4/10/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Name:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let userNameTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Click here"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        return textField
    }()

    let dateOfBird: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date Of Birth:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let dateTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Click here"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = UITextField.BorderStyle.none
        return textField
    }()
    
    let phoneNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone Number:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let phoneTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Click here"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = UITextField.BorderStyle.line
        return textField
    }()
    
    let borderView: UIView = {
        let borderView = UIView()
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.backgroundColor = .lightGray
        return borderView
    }()
    
    let colorFavorite: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorite Color:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let colorTextFiled: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Click here"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        return textField
    }()
    
    let register: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Register", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        
        return picker
    }()
    var colorPicker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    let dateLabel = UILabel()
    var pickerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout(){
        //username
        view.addSubview(userName)
        userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        userName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        //username textfield
        view.addSubview(userNameTextFiled)
        userNameTextFiled.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8).isActive = true
        userNameTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        userNameTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        userNameTextFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //dateOfBirth
        view.addSubview(dateOfBird)
        dateOfBird.topAnchor.constraint(equalTo: userNameTextFiled.bottomAnchor, constant: 16).isActive = true
        dateOfBird.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        dateOfBird.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        //dateOfBirth textfield
        view.addSubview(dateTextFiled)
        dateTextFiled.topAnchor.constraint(equalTo: dateOfBird.bottomAnchor, constant: 8).isActive = true
        dateTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        dateTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        dateTextFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //border View
        view.addSubview(borderView)
        borderView.topAnchor.constraint(equalTo: dateTextFiled.bottomAnchor, constant: 0).isActive = true
        borderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        borderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        borderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //phoneNumber
        view.addSubview(phoneNumber)
        phoneNumber.topAnchor.constraint(equalTo: borderView.bottomAnchor, constant: 16).isActive = true
        phoneNumber.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        phoneNumber.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        phoneNumber.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //phone TextField
        view.addSubview(phoneTextFiled)
        phoneTextFiled.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 8).isActive = true
        phoneTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        phoneTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        phoneTextFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //favoriteColor
        view.addSubview(colorFavorite)
        colorFavorite.topAnchor.constraint(equalTo: phoneTextFiled.bottomAnchor, constant: 16).isActive = true
        colorFavorite.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        colorFavorite.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        colorFavorite.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        //colorTextField
        view.addSubview(colorTextFiled)
        colorTextFiled.topAnchor.constraint(equalTo: colorFavorite.bottomAnchor, constant: 8).isActive = true
        colorTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        colorTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        colorTextFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //button
        view.addSubview(register)
        register.topAnchor.constraint(equalTo: colorTextFiled.bottomAnchor, constant: 32).isActive = true
        register.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        register.widthAnchor.constraint(equalToConstant: 100).isActive = true
        register.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

}


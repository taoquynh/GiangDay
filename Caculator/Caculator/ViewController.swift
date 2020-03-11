//
//  ViewController.swift
//  Caculator
//
//  Created by Quynh on 3/4/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

// định nghĩa các trường hợp phép tính
enum Operation: String {
    case Devide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Empty = "Empty"
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    // khai báo các biến
    var currentOperation: Operation = .Empty // lưu phép tính hiện tại
    var runningNumber = "" // lưu số được chọn
    var leftValue = "" // lưu số bên trái biểu thức
    var rightValue = "" // lưu số bên phải biểu thức
    
    var result = "" // để lưu kết quả phép tính sau mỗi lần tính
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberButton(_ sender: UIButton) {
        runningNumber += "\(sender.tag)"
        resultLabel.text = runningNumber
    }
    
    @IBAction func equalButton(_ sender: Any) {
        thucHienPhepTinh(currentOperation)
    }
    
    @IBAction func addButton(_ sender: Any) {
        thucHienPhepTinh(.Add)
    }
    
    @IBAction func subButton(_ sender: Any) {
    }
    
    @IBAction func multiButton(_ sender: Any) {
    }
    
    @IBAction func devideButton(_ sender: Any) {
    }
    
    @IBAction func clearButton(_ sender: Any) {
        thucHienPhepTinh(.Empty)
        resultLabel.text = "0"
        leftValue = ""
        rightValue = ""
        result = ""
        runningNumber = ""
    }
    
    // viết hàm để tính toán
    func thucHienPhepTinh(_ operation: Operation) {
        if currentOperation != .Empty { // nếu có phép tính được chọn thì nhảy vào đây
            if runningNumber != "" { // nếu runningNumber có giá trị thì nhảy vào đây
                rightValue = runningNumber
                runningNumber = ""
                
                switch operation {
                case .Add:
                    result = "\((Double(leftValue)!) + (Double(rightValue))!)"
                default:
                    return
                }
                
                resultLabel.text = result
                leftValue = result
            }
        } else { // nếu không có phép tính được chọn thì nhảy vào đây
            leftValue = runningNumber
            runningNumber = ""
        }
        
        // gán lại cho phép tính hiện tại
        currentOperation = operation
    }
}


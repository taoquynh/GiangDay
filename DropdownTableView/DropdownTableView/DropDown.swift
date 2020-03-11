//
//  SceneDelegate.swift
//  DropdownTableView
//
//  Created by Quynh on 3/6/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

protocol DropDownDelegate {
    // hàm bắt buộc đối tượng kế thừa phải thực thi
    func recievedSelectedValue(name: String, imageName: String)
}

class DropDown: UIView, UITableViewDataSource, UITableViewDelegate{
    let KCell = "cell"
    var dropDelegate: DropDownDelegate?
    var tableView: UITableView?
    var senderButton = UIButton()
    var arrayDataList : [String] = []
    var arrayImageList : [String] = []
    var animationDirection  = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTable()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // khởi tạo tableView
    open func initTable(){
        self.tableView = UITableView()
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: KCell)
        self.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    // show tableView
    open func showDropDown(senderObject: UIButton, height: CGFloat, arrayList: [String], arrayImages: [String], buttonFrame: CGRect, direction: String){
        self.senderButton = senderObject
        let frameButton = senderObject.frame
        arrayDataList = arrayList
        arrayImageList = arrayImages
        animationDirection = direction
        
        self.frame = CGRect(x: buttonFrame.origin.x, y: buttonFrame.origin.y+buttonFrame.size.height, width: buttonFrame.size.width, height: 0)
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.1
        self.tableView?.separatorInset = .zero
        self.tableView?.tableFooterView = UIView()
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.bounces = false
        if direction == "down" {
            self.frame = CGRect(x: buttonFrame.origin.x, y:  buttonFrame.origin.y + buttonFrame.size.height ,  width:frameButton.width, height: height)
        }
        else {
            self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y - buttonFrame.size.height ,  width: frameButton.width, height: height)
        }
        self.tableView?.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:0)
        self.tableView?.reloadData()
        senderObject.superview?.addSubview(self)
        
        // trượt để show menu
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            if direction == "down" {
                self.frame = CGRect(x: buttonFrame.origin.x, y:  buttonFrame.origin.y + buttonFrame.size.height ,width: frameButton.width, height: height)
            }
            else {
                self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y - height ,  width:frameButton.width, height:height)
            }
            self.tableView?.frame = CGRect(x:0, y:0, width: buttonFrame.width, height: height)
        }, completion: nil)
    }
    
    // ẩn menu
    open func hideDropDown(senderObject:UIButton,buttonFrame: CGRect){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            
            if self.animationDirection == "down" {
                self.frame = CGRect(x:buttonFrame.origin.x, y: buttonFrame.origin.y + senderObject.frame.height, width:buttonFrame.width, height:0)
            }
            else {
                self.frame = CGRect(x:buttonFrame.origin.x, y:buttonFrame.origin.y, width:buttonFrame.width, height:0)
                
            }
            self.tableView?.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:0)
        }, completion:{ (_) in
            self.removeFromSuperview()
        })
    }
    
    // trả về số cell
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDataList.count
    }
    
    // trả về nội dung mỗi cell
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KCell)!
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.textAlignment = .center
        if arrayImageList.count == arrayDataList.count {
            cell.textLabel?.text = arrayDataList[indexPath.row]
            cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
        }
        else if arrayImageList.count > arrayDataList.count {
            cell.textLabel?.text = arrayDataList[indexPath.row]
            if indexPath.row < arrayImageList.count {
                cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
            }
        }
        else if arrayImageList.count < arrayDataList.count {
            cell.textLabel?.text = arrayDataList[indexPath.row]
            if indexPath.row < arrayImageList.count {
                cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
            }
        }
        return cell
    }
    
    // xử lý khi chọn cell
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for subview: UIView in senderButton.subviews {
            if (subview is UIImageView) {
                subview.removeFromSuperview()
            }
        }
        if indexPath.row < arrayImageList.count {
            dropDelegate?.recievedSelectedValue(name: arrayDataList[indexPath.row], imageName: arrayImageList[indexPath.row])
            return
        }
        
        dropDelegate?.recievedSelectedValue(name: arrayDataList[indexPath.row], imageName: "")
    }
}

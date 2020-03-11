//
//  ViewController.swift
//  DropdownTableView
//
//  Created by Quynh on 3/6/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DropDownDelegate {
    
    @IBOutlet weak var buttonSelect: UIButton!
    var buttonFrame: CGRect?
    var dropDownObject: DropDown!
    var arrayName: [String] = ["Edit","Love","Music","Location"]
    let imageArray = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonFrame = buttonSelect.frame
    }
    
    @IBAction func onShowMenu(_ sender: UIButton) {
        if dropDownObject == nil {
            dropDownObject = DropDown()
            dropDownObject.dropDelegate = self
            dropDownObject.showDropDown(senderObject: buttonSelect, height: 150, arrayList: arrayName, arrayImages: imageArray, buttonFrame: buttonFrame!, direction : "down")
            view.addSubview(dropDownObject)
        } else {
            dropDownObject.hideDropDown(senderObject: buttonSelect,buttonFrame:buttonFrame!)
            dropDownObject = nil
        }
    }
    
    func recievedSelectedValue(name: String, imageName: String) {
        dropDownObject.hideDropDown(senderObject: buttonSelect, buttonFrame: buttonFrame!)
        dropDownObject = nil
        buttonSelect.setTitle(name, for: .normal)
        var imageView : UIImageView?
        imageView = UIImageView(image: UIImage(named:imageName))
        imageView?.frame = CGRect(x: 20, y: 5, width: 25, height: 25)
        buttonSelect.addSubview(imageView!)
    }
}


//
//  DemoIconLabel.swift
//  AutoLayout
//
//  Created by Techmaster on 3/22/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia
class DemoIconLabel: UIViewController {
    
    let sex_forbidden = IconLabel(text: "Sex is forbidden here", image: UIImage.init(named: "sex")!)
    let pee_allow = IconLabel(text: "Pee is welcomed here", image: UIImage.init(named: "pee")!)
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //Trường hợp này bắt buộc phải dùng stackView để nhóm các control nhỏ lại
        view.sv(stackView)
        
        stackView.addArrangedSubview(sex_forbidden)
        stackView.addArrangedSubview(pee_allow)
        
        stackView.centerInContainer()
        stackView.axis = .vertical //Xếp iconlabel dọc trục đứng
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        //Tham khảo ví dụ này https://github.com/freshOS/Stevia/issues/49
        
    }
    


}

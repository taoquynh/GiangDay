//
//  BootLogic.swift
//  BootStrap
//
//  Created by Techmaster on 3/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit
class BootLogic {
    
    class func boot(window: UIWindow) {
        let mainScreen = MainScreen.init(style: .grouped)
        mainScreen.title = "Autolayout"
        mainScreen.about = "Written by Cuong@techmaster.vn"
        mainScreen.sections = [
            
            Section(title: "Stevia Layout",
                    menu: [
                        Menu(title: "Center Photo", identifier: "CenterPhoto"),
                        Menu(title: "Proportional Height", identifier: "ProportionalHeightVC"),
                        Menu(title: "Proportional Margin", identifier: "ProportionalMarginVC"),
                        Menu(title: "My Lesson", identifier: "MyLessonVC"),
                        
                        
                        Menu(title: "FillContainer", identifier: "FillContainer"),
                        Menu(title: "FourRects", identifier: "FourRects"),
                        Menu(title: "Percentage Layout", identifier: "PercentageVC"),
                        
                        Menu(title: "GrapeVine", identifier: "GrapeVine"),
                        Menu(title: "Icon Label", identifier: "DemoIconLabel"),
                        Menu(title: "UITableViewCell", identifier: "FriendList"),
                        Menu(title: "PawWagVC", identifier: "PawWagVC")
                ]),
            
            Section(title: "Snap Kit", menu: [
                        Menu(title: "SnapKit Basic", identifier: "SnapKitBasic")
                ])
            
        ]
                
        let navigationController = UINavigationController.init(rootViewController: mainScreen)
        window.rootViewController = navigationController
    }
}

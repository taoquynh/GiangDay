//
//  AlertHelper.swift
//  DemoFirebase
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    class func showAlert(message: String, viewController: UIViewController?){
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alertController = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}

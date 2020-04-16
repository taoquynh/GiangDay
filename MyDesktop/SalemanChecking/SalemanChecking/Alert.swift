//
//  Alert.swift
//  SalemanChecking
//
//  Created by hieu nguyen van on 9/6/19.
//  Copyright © 2019 hieunv. All rights reserved.
//

import Foundation
import UIKit
func displayMessage(message: String, title: String, vw: UIViewController)
{
    DispatchQueue.main.async {
        let alertView = UIAlertController(title: title, message: message,preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) {(action: UIAlertAction) in
            DispatchQueue.main.async {
                vw.dismiss(animated: true, completion: nil)
            }
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController{
            presenter.sourceView = vw.view
            presenter.sourceRect = vw.view.bounds
        }
        vw.present(alertView, animated: true, completion: nil)
        
    }
    
}
func alertValidationTextField(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: {_ in
        toFocus.becomeFirstResponder()
    });
    alert.addAction(action)
    ViewController.present(alert, animated: true, completion:nil)
}

func alertValidationAndPoptoView(title: String!, message: String, storyBoard: String, ViewController: UIViewController) {
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let vc = mainStoryBoard.instantiateViewController(withIdentifier: storyBoard)
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: {_ in appDelegate.window?.rootViewController = vc
    });
    alert.addAction(action)
    ViewController.present(alert, animated: true, completion:nil)
}
extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
extension UIView {
    func addBackground() {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "ipbackground")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }}
extension UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
}

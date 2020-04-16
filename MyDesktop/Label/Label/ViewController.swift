//
//  ViewController.swift
//  Label
//
//  Created by Quynh on 4/16/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.font = UIFont.systemFont(ofSize: 24)
        
        let quote = "Haters gonna hate"
        //        let font = UIFont.systemFont(ofSize: 30)
        //        let attributes = [NSAttributedString.Key.font: font]
        let font = UIFont.systemFont(ofSize: 30)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0
        paragraphStyle.tailIndent = 10.0

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue,
            .paragraphStyle: paragraphStyle,

        ]

//        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
//        label5.attributedText = attributedQuote
        let attributedQuote = NSMutableAttributedString(string: quote, attributes: attributes)
        
        let firstAttributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.green, NSAttributedString.Key.kern: 10]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        let firstString = NSMutableAttributedString(string: "Haters ", attributes: firstAttributes)
        attributedQuote.addAttributes(firstAttributes, range: NSRange(location: 0, length: 6))
        let secondString = NSAttributedString(string: "gonna ", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: "hate")

        firstString.append(secondString)
        firstString.append(thirdString)
        label5.attributedText = attributedQuote
    }
    
    
}


//
//  ViewController.swift
//  OnlyTest
//
//  Created by Quynh on 3/24/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAnchorPoint(aView: questionImageView, point: CGPoint(x: 0.5, y: 1))
        
        UIView.animate(withDuration: 1, animations: {
            self.questionImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/16)
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 0.2, options: [.repeat, .autoreverse], animations: {
                self.questionImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/16)
            }, completion: nil)
        }
    }
    
    func setAnchorPoint(aView: UIView, point: CGPoint){
        aView.layer.anchorPoint = point
    }

}


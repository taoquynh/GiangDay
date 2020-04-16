//
//  ViewController.swift
//  DieuHuongManHinh
//
//  Created by Quynh on 3/24/20.
//  Copyright © 2020 Quynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate {

    let name : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen2 = segue.destination as! Screen2ViewController
//        screen2.presentationController?.delegate = self
        screen2.isModalInPresentation = true
        screen2.text = "Hello Screen 2"
    }
    
    @IBAction func unWindToVC(_ sender: UIStoryboardSegue){
        print("abc")
        if sender.source is Screen2ViewController {
            if let sen = sender.source as? Screen2ViewController {
                print(sen.name)
            }
        }
    }
    
//    func presentationControllerDidAttemptToDismiss(UIPresentationController) // Function này khi user cố gắng swipe để dismiss Present ViewController
//    func presentationControllerDidDismiss(UIPresentationController) // Func này được gọi khi Present ViewController đã dismiss
//    func presentationControllerShouldDismiss(UIPresentationController) -> Bool // Function này để chúng ta có thể set điều kiện để dismiss Present ViewController
//    func presentationControllerWillDismiss(UIPresentationController) // Func này được gọi trước khi Present ViewController được dismiss
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print("abc")
    }
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("Đã dismiss")
        
    }
}


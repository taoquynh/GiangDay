//
//  ViewController.swift
//  DemoDongHo
//
//  Created by Taof on 10/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kimGiayView: UIView!
    
    @IBOutlet weak var kimPhutView: UIView!
    
    @IBOutlet weak var kimGioView: UIView!
    
    var timerClock: Timer!
    var currentDate = NSDate()
    var calendar = NSCalendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dongho()
    }
    
    func setTime() -> (hour: CGFloat, minute: CGFloat, second: CGFloat){
        let hour = calendar.component(.hour, from: currentDate as Date)
        let minute = calendar.component(.minute, from: currentDate as Date)
        let second = calendar.component(.second, from: currentDate as Date)
        
        print("Giờ: \(hour) phút: \(minute) giây \(second)")
        let hourInSecond = hour*60*60 + minute*60 + second
        let minuteInSecond = minute*60 + second
        
        print("hourInSecond: \(hourInSecond) minuteInSecond: \(minuteInSecond)")
        
        let firstAlphaHour = CGFloat(Double.pi)*(2*CGFloat(hourInSecond)/12/60/60 - 0.5)
        let firstAlphaMinute = CGFloat(Double.pi)*(2*CGFloat(minuteInSecond)/60/60 - 0.5)
        let firstAlphaSecond = CGFloat(Double.pi)*(2*CGFloat(second)/60 - 0.5)
        
        print("góc Giờ: \(firstAlphaHour) góc phút: \(firstAlphaMinute) góc giây \(firstAlphaSecond)")
        return (firstAlphaHour, firstAlphaMinute, firstAlphaSecond)
    }
    
    func dongho(){
        getLocation(kimView: kimGiayView, alpha: setTime().second)
        getLocation(kimView: kimPhutView, alpha: setTime().minute)
        getLocation(kimView: kimGioView, alpha: setTime().hour)
        timerClock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runClock), userInfo: nil, repeats: true)
    }
    
    func getLocation(kimView: UIView, alpha: CGFloat){
        let r = kimView.bounds.size.height/2
        kimView.center = CGPoint(x: view.center.x, y: view.center.y)
        kimView.layer.cornerRadius = r
        
        setAnchorPoint(aView: kimView, point: CGPoint(x: kimView.bounds.height/2/kimView.bounds.width, y: 0.5))
        
        kimView.transform = CGAffineTransform(rotationAngle: alpha)
    }
    
    @objc func runClock(){
        let omegaGiay = CGAffineTransform(rotationAngle: CGFloat.pi*2/60)
        kimGiayView.transform = kimGiayView.transform.concatenating(omegaGiay)
        
        let omegaPhut = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2/60/60))
        kimPhutView.transform = kimPhutView.transform.concatenating(omegaPhut)
        
        let omegaGio = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2/60/60/12))
        kimGioView.transform = kimGioView.transform.concatenating(omegaGio)
    }
    
    func setAnchorPoint(aView: UIView, point: CGPoint){
        var newPoint = CGPoint(x: aView.bounds.size.width * point.x, y: aView.bounds.size.height * point.y)
        var oldPoint = CGPoint(x: aView.bounds.size.width * aView.layer.anchorPoint.x, y: aView.bounds.size.height * aView.layer.anchorPoint.y);
        
        newPoint = newPoint.applying(aView.transform)
        oldPoint = oldPoint.applying(aView.transform)
        
        var position = aView.layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        aView.layer.position = position
        aView.layer.anchorPoint = point
    }
}


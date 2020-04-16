//
//  HomeViewController.swift
//  SalemanChecking
//
//  Created by hieu nguyen van on 9/7/19.
//  Copyright © 2019 hieunv. All rights reserved.
//

import UIKit
import CoreLocation

struct TimeChecking: Decodable{
    let success: Bool
    let valid: Bool
    let distance: Float!
    let updated_date: String!
    let msg: String!
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case valid = "valid"
        case distance = "distance"
        case updated_date = "updated_date"
        case msg = "msg"
    }
}

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    var fullname: String!
    var usr_id: String!
    var access_token: String!
    var app_token: String!
    var usr_icon: String!
    var curr_long: String!
    var curr_lat: String!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var myIconView: UIImageView!
    
    @IBOutlet weak var myNavigationItem: UINavigationItem!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
            //UserDefaults.standard.set(usr_icon, forKey: "Usr_icon")
            //print(usr_icon!)
            //let leftName = UIButton(type: .system)
            //leftName.setTitle("Xin chào \(fullname!)", for: .normal)
            //myNavigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftName)
            //right bar button
            //myNavigationItem.rightBarButtonItem = UIBarButtonItem(title: "Thoát", style: .plain, target: self, action: #selector(btnSignout))
        //set icon của
        //let image: UIImage = UIImage(named: "titleimg")!
        //let titleImage = UIImageView(image: image)
        
        //titleImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        //titleImage.contentMode = .scaleAspectFit
        //myNavigationItem.titleView = titleImage
        
        self.view.addBackground()
        
        myNavigationItem.title = "Xin chào \(fullname!)"
        let myicon: UIImage = UIImage(named: "titleimg")!
        myIconView.image = myicon
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    @IBAction func btnSignout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogedin")
        UserDefaults.standard.set(fullname, forKey: "udf_name")// trả ra màn hình login
        UserDefaults.standard.set(usr_icon, forKey: "Usr_icon")
        let siginView = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! ViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = siginView
    }
    /*
    @objc func btnSignout() {
        UserDefaults.standard.set(false, forKey: "isLogedin")
        UserDefaults.standard.set(fullname, forKey: "udf_name")// trả ra màn hình login
        UserDefaults.standard.set(usr_icon, forKey: "Usr_icon")
        let siginView = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as! ViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = siginView
    }
    */
    
    @IBAction func btnTest(_ sender: Any) {
        
        //Get current location
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            //print("mobile locations = \(location.latitude) \(location.longitude)")
            curr_lat = String(location.latitude)
            curr_long = String(location.longitude)
        }
        var mylink = UserDefaults.standard.object(forKey: "Link") as! String
        mylink += "api/timekeeping_checkin"
        //print(mylink)
        let myUrl = URL(string: mylink)
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "POST"
        //app_token và access_token được gửi về từ ViewDidLoad của ViewController.swift
        let postString = "&access_token=\(access_token!)&app_token=\(app_token!)&usr_long=\( curr_long!)&usr_lat=\(curr_lat!)"
    
        //print(postString)
        let postData = postString.data(using: .utf8) // convert to utf8 string
        request.httpBody = postData
        do
        {
            let uploadJob = URLSession.shared.uploadTask(with: request, from: postData){responseData, response, error in
                if error != nil {
                    
                    DispatchQueue.main.async
                        {
                            displayMessage(message: "Looks like the connection to the server didn't work.  Do you have Internet access?", title: "Alert", vw: self)
                    }
                }else
                {
                    do{
                        let jsonresData = try JSONDecoder().decode(TimeChecking.self, from: responseData!)
                        
                        if (jsonresData.valid)
                        {
                            displayMessage(message: jsonresData.msg + " Khoảng cách sai số: " + String(jsonresData.distance), title: "Alert", vw: self)
                        }
                        else
                        {
                            DispatchQueue.main.async
                                {
                                    displayMessage(message: jsonresData.msg, title: "Alert", vw: self)
                            }
                        }
                        
                    } catch{
                        displayMessage(message: error as! String, title: "Alert", vw: self)
                    }
                }
            }
            uploadJob.resume()
        }
        
    }
    
}

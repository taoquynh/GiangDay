//
//  MainViewController.swift
//  LearnGoogleMaps
//
//  Created by Taof on 10/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MainViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        _locationManager.activityType = .automotiveNavigation
        // đi khoảng cách bao nhiêu thì cập nhật toạ độ
        _locationManager.distanceFilter = 10.0
        return _locationManager
    }()
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var diemDiTextField: UITextField!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var diemDenTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        setupMap()
        setupLayout()
    }
    
    func setupMap(){
        // vị trí của tôi được kích hoạt
        mapView.isMyLocationEnabled = true
        // nút vị trí của tôi
        mapView.settings.myLocationButton = true
        //
//        mapView.delegate = self
    }
    
    func moveCamera(lat: Double, long: Double){
        let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: lat, longitude: long), zoom: 6)
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat, longitude: long))
//        marker.title = "A"
//        marker.snippet = "B"
        marker.map = mapView
        self.mapView.animate(to: camera)
    }
    
    func setupLayout(){
        searchView.backgroundColor = UIColor.white
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.lightGray.cgColor
        searchView.layer.cornerRadius = 5
        searchView.layer.masksToBounds = true
        
        let getstureTop = UITapGestureRecognizer(target: self, action: #selector(chonDiemDi(_:)))
        let gesttureBottom = UITapGestureRecognizer(target: self, action: #selector(chonDiemDen(_:)))
        
        topView.addGestureRecognizer(getstureTop)
        bottomView.addGestureRecognizer(gesttureBottom)
    }
    
    @objc func chonDiemDi(_ gesture: UITapGestureRecognizer){
        print("chon diem di")
        let searchVC = SearchViewController()
        let navigation = UINavigationController(rootViewController: searchVC)
        
        present(navigation, animated: true, completion: nil)
    }
    
    @objc func chonDiemDen(_ gesture: UITapGestureRecognizer){
        print("chon diem den")
        let searchVC = SearchViewController()
        let navigation = UINavigationController(rootViewController: searchVC)
        
        present(navigation, animated: true, completion: nil)
    }

}

extension MainViewController: CLLocationManagerDelegate{
    // thay đổi quyền truy cập
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            print("denied")
            break
        case .restricted:
            print("restricted")
            break
        }
    }
    
    // hàm này cập nhật toạ độ người dùng
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        
        moveCamera(lat: coordinate.latitude, long: coordinate.longitude)
        locationManager.stopUpdatingLocation()
        print("Lat: \(coordinate.latitude) - Long: \(coordinate.longitude)")
    }

}

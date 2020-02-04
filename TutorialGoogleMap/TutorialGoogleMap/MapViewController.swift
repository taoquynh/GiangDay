//
//  MapViewController.swift
//  TutorialGoogleMap
//
//  Created by Taof on 10/2/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire

class MapViewController: UIViewController{
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var diemDiTextField: UITextField!
    @IBOutlet weak var diemDenTextField: UITextField!
    @IBOutlet weak var directionButton: UIButton!
    
    var placeFrom: Place!
    var placeTo: Place!
    
    static var startLocation: CLLocation? = nil
    static var endLocation: CLLocation? = nil
    
    var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        _locationManager.activityType = .automotiveNavigation
        // đi khoảng cách bao nhiêu thì cập nhật toạ độ
        _locationManager.distanceFilter = 10.0
        return _locationManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupGoogleMaps()
        // yêu cầu quyền truy cập vị trí
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        directionButton.isHidden = true
    }
    
    @IBAction func directionAction(_ sender: Any) {
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
        let searchVC = SearchViewController()
        searchVC.passObject = { [weak self] item in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.diemDiTextField.text = item.address + "," + item.fullAdress
            strongSelf.placeFrom = item
            MapViewController.startLocation = CLLocation(latitude: item.lat, longitude: item.long)
            strongSelf.mapView.clear()
            strongSelf.drawPath()
        }
        let navigation = UINavigationController(rootViewController: searchVC)
        present(navigation, animated: true, completion: nil)
    }
    
    @objc func chonDiemDen(_ gesture: UITapGestureRecognizer){
        let searchVC = SearchViewController()
        searchVC.passObject = { [weak self] item in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.diemDenTextField.text = item.address + "," + item.fullAdress
            strongSelf.placeTo = item
            MapViewController.endLocation = CLLocation(latitude: item.lat, longitude: item.long)
            print("endLocation \(MapViewController.endLocation)")
            strongSelf.mapView.clear()
            strongSelf.drawPath()
        }
        let navigation = UINavigationController(rootViewController: searchVC)
        present(navigation, animated: true, completion: nil)
    }
    
    // cấu hình map
    func setupGoogleMaps(){
        // vị trí của tôi được kích hoạt
        mapView.isMyLocationEnabled = true
        // nút vị trí của tôi
        mapView.settings.myLocationButton = true
        //
        mapView.delegate = self
    }
    
    // di chuyển camera
    func moveCamera(lat: Double, long: Double){
        let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: lat, longitude: long), zoom: 15)
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat, longitude: long))
        marker.title = "A"
        marker.snippet = "B"
        marker.map = mapView
        self.mapView.animate(to: camera)
    }
    
    // vẽ đường
    func drawPath(){
        guard let startLocation = MapViewController.startLocation, let endLocation = MapViewController.endLocation else {
            return
        }
        
        print("vẽ đường")
        
        let origin = "\(startLocation.coordinate.latitude),\(startLocation.coordinate.longitude)"
        let destination = "\(endLocation.coordinate.latitude),\(endLocation.coordinate.longitude)"
        
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&key=\(AppDelegate.noibaiTaxiKey)&mode=driving"
        Alamofire.request(url).responseJSON { (response) in
            
            print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result as Any)   // result of response serialization
            
            do {
                let json = try JSON(data: response.data!)
                let routes = json["routes"].arrayValue
                print(routes)
                // print route using Polyline
                for route in routes
                {
                    let routeOverviewPolyline = route["overview_polyline"].dictionary
                    let points = routeOverviewPolyline?["points"]?.stringValue
                    let path = GMSPath.init(fromEncodedPath: points!)
                    let polyline = GMSPolyline.init(path: path)
                    polyline.strokeWidth = 4
                    polyline.strokeColor = UIColor.red
                    polyline.map = self.mapView
                    
                    print(polyline)
                }
            } catch {
                return
            }
            
        }
    }
    

}

extension MapViewController: CLLocationManagerDelegate{
    // hàm check quyền
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
    
    // hàm này cập nhật toạ độ người dùng (khi di chuyển)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else {
            return
        }
        
        moveCamera(lat: coordinate.latitude, long: coordinate.longitude)
        locationManager.stopUpdatingLocation()
        print("Lat: \(coordinate.latitude) - Long: \(coordinate.longitude)")
    }
}

// để extension GMSMapViewDelegate hoạt động cần gán mapView.delegate = self
extension MapViewController: GMSMapViewDelegate{
    // in ra toạ độ mà người dùng tap vào bản đồ
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        
        return view
    }
}

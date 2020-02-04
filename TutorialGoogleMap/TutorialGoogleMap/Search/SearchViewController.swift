//
//  SearchViewController.swift
//  Noibai
//
//  Created by Hiếu Tào on 3/15/19.
//  Copyright © 2019 Bentic. All rights reserved.
//

import UIKit
import GooglePlaces

class SearchViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var notfoundImageView: UIImageView!
	
	var placeClient = GMSPlacesClient()
    var passObject: ((Place) -> ())?
	var type = 0
    var locations = [Place]()
	
	deinit {
		print("*** deinit SearchViewController")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dimissFunc))
		title = "Chọn địa điểm"
		setup()
    }
    
    @objc func dimissFunc(){
        self.dismiss(animated: true, completion: nil)
    }
	
	// Lấy vị trí theo từ khoá
	func getLocations(searchText: String){
		if !searchText.isEmpty{
				let filter = GMSAutocompleteFilter()
				filter.type = .noFilter
				filter.country = "VN"
				placeClient.autocompleteQuery(searchText, bounds: nil, filter: filter) { (results, error) in
					if let results = results{
						self.locations.removeAll()
						for result in results{
							var secondaryText = result.attributedFullText.string
							if let a = result.attributedSecondaryText{
								secondaryText = a.string.replacingOccurrences(of: ", Vietnam", with: "")
							}
                            let location = Place(placeID: result.placeID, address: result.attributedPrimaryText.string, fullAdress: secondaryText, lat: 0, long: 0)
                            self.locations.append(location)
						}
						self.tableView.reloadData()
					}else{
                        print("result nil")
					}
				}
		}else{
			self.tableView.reloadData()
		}
	}
	
	func setup(){
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
		tableView.tableFooterView = UIView()
		tableView.keyboardDismissMode = .onDrag
		
		searchBar.layer.borderColor = UIColor.lightGray.cgColor
		searchBar.layer.borderWidth = 1
		searchBar.layer.cornerRadius = 5
		searchBar.layer.masksToBounds = true
        searchBar.placeholder = "Nhập địa điểm bạn muốn tìm"
		searchBar.becomeFirstResponder()
	}
}

extension SearchViewController: UISearchBarDelegate{
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
		self.view.endEditing(true)
	}
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
		getLocations(searchText: searchText.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: " ")))
	}
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return locations.count
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 56
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
		
		cell.textLabel?.text = locations[indexPath.row].address + "," + locations[indexPath.row].fullAdress
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var location = locations[indexPath.row]
            placeClient.lookUpPlaceID(location.placeID) { (result, error) in
                if let place = result{
                    print("Lat: ", place.coordinate.latitude)
                    print("Long: ", place.coordinate.longitude)
                    location.lat = place.coordinate.latitude
                    location.long = place.coordinate.longitude
                    
                    print(location.long, print(location.lat))
                    self.passObject?(location)
                    self.dismiss(animated: true, completion: nil)
                }else{
                    print("Không tìm thấy địa chỉ")
                }
            }
	}
}

//
//  MainViewController.swift
//  OilMap
//
//  Created by dave76 on 15/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class MainViewController: UIViewController {
  
  // MARK:- Properties
  var mapView: MKMapView = {
    let map = MKMapView()
    return map
  }()
  
  /// menu button
  let menuButton: CustomButton = {
    let button = CustomButton(type: .system)
    button.textLable.text = "메뉴"
    button.textLable.isHidden = true
    button.layer.cornerRadius = 26
    button.addTarget(self, action: #selector(handleMenuTouched), for: .touchUpInside)
    return button
  }()
  
  /// coordinateLabel
  var coordinateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .darkGray
    label.alpha = 0.8
    label.textColor = .white
    return label
  }()
  
  /// list view button
  var displayListButton: CustomButton = {
    let button = CustomButton(type: .system)
    button.textLable.text = "주유소 목록"
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(handleMenuTouched), for: .touchUpInside)
    return button
  }()
  
  /// current location button
  var currentLocationButton: CustomButton = {
    let button = CustomButton(type: .system)
    button.textLable.text = "현재 위치"
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(handleCurrentLocationButtonTouched), for: .touchUpInside)
    return button
  }()
  
  // setting button
  var settingButton: CustomButton = {
    let button = CustomButton(type: .system)
    button.textLable.text = "설정"
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(handleMenuTouched), for: .touchUpInside)
    return button
  }()
  
  // search button
  var searchButton: CustomButton = {
    let button = CustomButton(type: .system)
    button.textLable.text = "지역 검색"
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(searchLocalGasStation), for: .touchUpInside)
    return button
  }()
  
  // searchTextField
  var searchTextField: CustomTextField = {
    let textField = CustomTextField()
    textField.placeholder = "검색지역을 입력해 주세요.(예:서울 강남)"
    textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 0.8, alpha: 0.8)])
    
    return textField
  }()
  
  var menuIsExpanded: Bool = false {
    didSet {
      let menuButtons = [displayListButton, currentLocationButton, searchButton, settingButton]
      if self.menuIsExpanded {
        UIView.animate(withDuration: 0.25, animations: {
          self.menuButton.imageView?.transform = CGAffineTransform(rotationAngle: -0.999 * CGFloat.pi)
          print("menu is expended")
        })
        for (index, button) in menuButtons.enumerated() {
          UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            button.alpha = 1
            button.transform = CGAffineTransform(translationX: 0, y: -(30 + button.frame.height) * CGFloat(index + 1))
            button.textLable.alpha = 1
            self.searchButton.textLable.isHidden = false
          })
        }
      } else {
        UIView.animate(withDuration: 0.25, animations: {
          self.menuButton.imageView?.transform = .identity
          print("menu is not expended")
        })
        
        for button in menuButtons {
          UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            button.transform = .identity
            button.alpha = 0
          })
        }
      }
    }
  }
  
  //  var coordinateLabel: String {
  //    didSet {
  //
  //    }
  //  }
  
  private let locationManager = CLLocationManager()
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    searchTextField.delegate = self
    view.backgroundColor = .white
    setupNavibationBarUI()
    setupViews()
    startUpdatingLocation()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .denied, .restricted:
      print("앱을 사용하기 위해서는 위치 정보 사용 권한이 필요합니다.")
    case .authorizedAlways, .authorizedWhenInUse:
      locationManager.requestLocation()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    view.layoutIfNeeded()
  }
  
  private func moveToInitialCoordinate() {
    let center = CLLocationCoordinate2D(latitude: 37.572851, longitude: 126.976881)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  private func moveToCoordinate(center: CLLocationCoordinate2D) {
    let center = CLLocationCoordinate2D(latitude: center.latitude, longitude: center.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
  }

  
  private func updateCurrentLocation() {
    locationManager.requestLocation()
    let coordinate = mapView.centerCoordinate
//    coordinateLabel.text = String(format: "위도: %2.4f, 경도: %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
    startUpdatingLocation()
    let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    stopUpdatieLocation()
    moveToCoordinate(center: center)
  }
  
  private func startUpdatingLocation() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .denied, .restricted:
      print("앱을 사용하기 위해서는 위치 정보 사용 권한이 필요합니다.")
    case .authorizedAlways, .authorizedWhenInUse:
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.distanceFilter = kCLHeadingFilterNone
      locationManager.startUpdatingLocation()
    }
  }
  
  func stopUpdatieLocation() {
    locationManager.stopUpdatingLocation()
  }
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    view.addSubview(mapView)
    mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    
    view.addSubview(menuButton)
    menuButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 150, right: 16), size: CGSize(width: 52, height: 52))
    menuButton.widthAnchor.constraint(equalTo: menuButton.heightAnchor).isActive = true
    
    let menuButtons = [displayListButton, currentLocationButton, searchButton, settingButton]
    menuButtons.forEach { (button) in
      view.addSubview(button)
      button.alpha = 0
      button.anchor(top: nil, leading: nil, bottom: menuButton.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 44, height: 44))
      button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
      button.centerXAnchor.constraint(equalTo: menuButton.centerXAnchor).isActive = true
    }
  }
  
  fileprivate func setupNavibationBarUI() {
    navigationItem.title = "주유지도"
    navigationController?.navigationBar.isHidden = true
  }
  
  @objc func handleMenuTouched() {
    print("menu button touched")
    menuIsExpanded = !menuIsExpanded
  }
  
  @objc func handleCurrentLocationButtonTouched() {
    print("currentLocation Button Touched")
    handleMenuTouched()
//    moveToInitialCoordinate()
    updateCurrentLocation()
  }
  
  fileprivate func setupTextField() {
    view.addSubview(searchTextField)
    searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    searchTextField.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: 0).isActive = true
    searchTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    searchTextField.bottomAnchor.constraint(equalTo: menuButton.topAnchor, constant: -177).isActive = true
    
    UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
      self.searchButton.textLable.isHidden = true
      self.searchTextField.isHidden = false
      self.searchTextField.alpha = 1
      self.searchTextField.transform = CGAffineTransform(translationX: -6, y: 0)
    }) { (_) in
      //
    }
  }
  
  @objc func searchLocalGasStation() {
    print("Searching Local GasStation")
    searchButton.textLable.isHidden = false
    setupTextField()
    print(searchButton.frame)
    //    setupTextField()
    //    view.addSubview(searchTextField)
    //    searchTextField.anchor(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: searchButton.leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 16), size: CGSize(width: 0, height: 30))
    print("searchTextField: ",searchTextField.frame)
  }
  
  @objc func moveToSearchController() {
    let searchController = SearchController()
    let navController = CustomNavigationController(rootViewController: searchController)
    present(navController, animated: true) {
      //
    }
  }
}

// MARK:- CLLocationManager
extension MainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    let coordinate = location.coordinate
    coordinateLabel.text = String(format: "위도: %2.4f, 경도: %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
    let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
    locationManager.stopUpdatingLocation()
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("Authorized")
    default:
      print("Unauthorized")
    }
  }
}


extension MainViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("\n================[enter button pressed]================\n")
    searchTextField.resignFirstResponder()
    UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: UIView.AnimationOptions.transitionFlipFromRight, animations: {
      self.searchTextField.alpha = 0
      self.menuIsExpanded = false
    }) { (_) in
      //
    }
    return true
  }
}

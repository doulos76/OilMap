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
  
  lazy var darkCoverView: UIView = {
    let view = UIView(frame: self.view.bounds)
    view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // AvgAllPrice
  var avgAllPriceOils = [AvgAllPriceOil]()
  var avgAllPriceApi = AvgAllPriceApi()
  
  func displayAvgAllPrice() {
    avgAllPriceApi.getAvgAllPrice { (avgAllPrice) in
      if let avgAllPrice = avgAllPrice {
        self.avgAllPriceOils = avgAllPrice.result.oil
        print("\n================[avgAllPriceOils]================\n")
        print(self.avgAllPriceOils)
       }
    }
  }
  
  // MARK:- Properties
  let oilTypeLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "휘발유"
    return label
  }()

  let currentMapMinimumOilPriceLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "최저: 1458원"
    label.textColor = UIColor.black
    label.backgroundColor = UIColor.customOrangeColor
    return label
  }()

  let nationalAvgOilPriceLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "전국평균: 1567원"
    return label
  }()

  let nationalMinimumOilPriceLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "전국최저: 1375원"
    return label
  }()

  let radiusButton: RectangleCustomButton = {
    let button = RectangleCustomButton()
    button.setTitle("반경: \(5)Km", for: .normal)
    return button
  }()

  let moveLocationButton: RectangleCustomButton = {
    let button = RectangleCustomButton(type: UIButton.ButtonType.system)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.setTitle("위치이동: \("ON")", for: .normal)
    button.addTarget(self, action: #selector(handleLocationLockToggle), for: .touchUpInside)
    return button
  }()
  
  @objc func handleLocationLockToggle() {
    moveLocationButton.setTitle("위치이동: \("OFF")", for: .normal)
  }
  
  var mapView: MKMapView = {
    let map = MKMapView()
    return map
  }()
  
  /// menu button
  lazy var menuButton: RoundCustomButton = {
    let button = RoundCustomButton(type: .system)
    button.textLable.text = "메뉴"
    button.setImage(UIImage(named: "arrowUpMenuButton"), for: .normal)
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
  lazy var displayListButton: RoundCustomButton = {
    let button = RoundCustomButton(type: .system)
    button.textLable.text = "주유소 목록"
    button.setImage(UIImage(named: "iconMenuList"), for: .normal)
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(moveToGasStationListController), for: .touchUpInside)
    return button
  }()
  
  @objc func moveToGasStationListController() {
    print("move to Gas Station List controller")
    let gasStationListController = GasStationListController()
    let navController = CustomNavigationController(rootViewController: gasStationListController)
    present(navController, animated: true, completion: nil)
//    navController.pushViewController(navController, animated: true)
  }
  
  /// current location button
  lazy var currentLocationButton: RoundCustomButton = {
    let button = RoundCustomButton(type: .system)
    button.textLable.text = "현재 위치"
    button.setImage(UIImage(named: "iconMenuLocation"), for: .normal)
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
    button.addTarget(self, action: #selector(handleCurrentLocationButtonTouched), for: .touchUpInside)
    return button
  }()
  
  // setting button
  lazy var settingButton: RoundCustomButton = {
    let button = RoundCustomButton(type: .system)
    button.textLable.text = "설정"
    button.setImage(UIImage(named: "iconMenuSetting"), for: .normal)
    button.backgroundColor = UIColor.customOrangeColor
    button.layer.cornerRadius = 22
//    button.addTarget(self, action: #selector(displaySettingsAViewController), for: .touchUpInside)
//    button.addTarget(self, action: #selector(displaySettingsViewController), for: .touchUpInside)
//    button.addTarget(self, action: #selector(moveToSettingController), for: .touchUpInside)
//    button.addTarget(self, action: #selector(callSettingController), for: .touchUpInside)
    button.addTarget(self, action: #selector(moveToSettingsViewController), for: .touchUpInside)
    return button
  }()
  
  @objc func moveToSettingsViewController() {
    print("Move to Setting View Controller")
    let navController = UINavigationController(rootViewController: settingsViewController)
    navController.view.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height)

    let mainWindow = UIApplication.shared.keyWindow
    mainWindow?.addSubview(navController.view)
    view.addSubview(darkCoverView)
    UIView.animate(withDuration: 0.5, animations: {
      navController.view.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.height * 0.8))
      self.darkCoverView.alpha = 1
    }) { (_) in
      //
    }
    addChild(navController)
  }
  
  let settingsViewController = SettingsViewController()
  let settingController = SettingController()
  let settingMenuHeight: CGFloat = 850
  
  @objc func callSettingController() {
    print("call SettingsController")
    // initial position
    settingController.view.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height)
    let mainWindow = UIApplication.shared.keyWindow
    mainWindow?.addSubview(settingController.view)
    
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.settingController.view.transform = CGAffineTransform(translationX: 0, y: -self.settingMenuHeight)
    })
    addChild(settingController)
  }
  
  @objc func displaySettingsViewController() {
    handleMenuTouched()
    print("display Setting View Controller")
    let settingController = SettingController()
//    let navController = CustomNavigationController(rootViewController: settingController)
    settingController.modalPresentationStyle = .custom
    present(settingController, animated: true, completion: nil)
  }
  
  @objc func displaySettingsAViewController() {
    let vc = ViewControllerB()
    vc.modalPresentationStyle = .custom
    present(vc, animated: true, completion: nil)
  }
  
  @objc func moveToSettingController() {
    handleMenuTouched()
    print("moveToSettingController")
    let settingController = SettingController()

    let navController = CustomNavigationController(rootViewController: settingController)
    present(navController, animated: true)
  }
  
  // search button
  var searchButton: RoundCustomButton = {
    let button = RoundCustomButton(type: .system)
    button.textLable.text = "지역 검색"
    button.setImage(UIImage(named: "iconMenuSearch"), for: .normal)
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
  
  var menuButtonBottomConstraintSize: NSLayoutConstraint!
  var searchTextFieldYConstraintConstant: CGFloat?
  
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
            let offsetY = -(20 + button.frame.height) * CGFloat(index + 1)
            button.transform = CGAffineTransform(translationX: 0, y: offsetY)
            button.textLable.alpha = 1
            self.searchButton.textLable.isHidden = false
            self.searchTextFieldYConstraintConstant = offsetY * 3/4
          })
        }
      } else {
        UIView.animate(withDuration: 0.5, animations: {
          self.menuButton.imageView?.transform = .identity
          print("menu is not expended")
        })
        
        for button in menuButtons {
          UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            button.textLable.alpha = 0
            button.transform = .identity
            button.alpha = 0
          })
        }
      }
    }
  }
  
  private let locationManager = CLLocationManager()
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    locationManager.delegate = self
    mapView.showsUserLocation = true
    searchTextField.delegate = self
    
    setupNavibationBarUI()
    setupViews()
    startUpdatingLocation()
    displayAvgAllPrice()
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
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    let deviceIsLandscape: Bool = UIDevice.current.orientation.isLandscape
    headerStackView.axis = deviceIsLandscape ? .vertical : .horizontal
    if deviceIsLandscape == true {
      headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
      menuButtonBottomConstraintSize.constant = -20
      menuButtonBottomConstraintSize.isActive = true
    } else {
      headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
      menuButtonBottomConstraintSize.constant = -150
      menuButtonBottomConstraintSize.isActive = true

    }
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
    coordinateLabel.text = String(format: "위도: %2.4f, 경도: %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
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
  
  let headerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.alignment = .top
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .green
    return stackView
  }()
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    view.addSubview(mapView)
    mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    
    view.addSubview(menuButton)
    menuButton.translatesAutoresizingMaskIntoConstraints = false
    menuButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    menuButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
    menuButton.widthAnchor.constraint(equalTo: menuButton.heightAnchor).isActive = true
    menuButtonBottomConstraintSize = menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
    menuButtonBottomConstraintSize.isActive = true
    
    let menuButtons = [displayListButton, currentLocationButton, searchButton, settingButton]
    menuButtons.forEach { (button) in
      view.addSubview(button)
      button.alpha = 0
      button.anchor(top: nil, leading: nil, bottom: menuButton.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: 44, height: 44))
      button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
      button.centerXAnchor.constraint(equalTo: menuButton.centerXAnchor).isActive = true
    }
    
//    view.addSubview(headerStackView)
    let arrangedOilPriceDisplaySubView = [oilTypeLabel, currentMapMinimumOilPriceLabel, nationalAvgOilPriceLabel, nationalMinimumOilPriceLabel]
    let oilPriceDisplayStackView = UIStackView(arrangedSubviews: arrangedOilPriceDisplaySubView)
    oilPriceDisplayStackView.axis = .vertical
    oilPriceDisplayStackView.alignment = .fill
    oilPriceDisplayStackView.distribution = .equalSpacing
    oilPriceDisplayStackView.spacing = 2
    view.addSubview(oilPriceDisplayStackView)
    
    let arrangedDisplayStackView = [oilPriceDisplayStackView, radiusButton, moveLocationButton]
    let displayStackView = UIStackView(arrangedSubviews: arrangedDisplayStackView)
    
    displayStackView.axis = .horizontal
    displayStackView.distribution = .fillEqually
    displayStackView.alignment = .top
    displayStackView.spacing = 20
    view.addSubview(displayStackView)
    headerStackView.addArrangedSubview(oilPriceDisplayStackView)
    headerStackView.addArrangedSubview(radiusButton)
    headerStackView.addArrangedSubview(moveLocationButton)
    view.addSubview(headerStackView)
    headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    headerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    headerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    headerStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 100).isActive = true
    headerStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets.init(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 26))
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
    searchTextField.becomeFirstResponder()
    searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    searchTextField.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: 0).isActive = true
    searchTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    searchTextField.centerYAnchor.constraint(equalTo: menuButton.centerYAnchor, constant: searchTextFieldYConstraintConstant ?? 0).isActive = true

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
//    searchButton.textLable.isHidden = false
    setupTextField()
    print(searchButton.frame)
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
      self.searchTextField.text = ""
    }
    return true
  }
}

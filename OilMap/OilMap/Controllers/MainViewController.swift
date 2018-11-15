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
  
  let menuButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "arrowUpMenuButton"), for: .normal)
    button.backgroundColor = .customIndigoColor
    button.tintColor = .white
    button.layer.cornerRadius = 25
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 5
    button.layer.shadowOpacity = 0.25
    button.layer.shadowOffset = CGSize(width: 2, height: 10)
    button.addTarget(self, action: #selector(handleMenuTouched), for: .touchUpInside)
    return button
  }()
  
  var menuIsExpanded: Bool = false {
    didSet {
      
      if self.menuIsExpanded {
        UIView.animate(withDuration: 0.25, animations: {
          self.menuButton.imageView?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
          print("menu is expended")
        })
        
//        for index in menuList {
//          UIView.animate(withDuration: 0.25, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseInOut, animations: {
//            self.menuList[index].transform = CGAffineTransform(translationX: 0, y: CGFloat(-62 * index))
//            self.menuList[index].alpha = 1
//          }) { (_) in
//
//          }
//
//        }
      } else {
        UIView.animate(withDuration: 0.25, animations: {
          self.menuButton.imageView?.transform = .identity
          print("menu is not expended")
        })
        
        
//        UIView.animate(withDuration: 0.25, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIView.AnimationOptions.curveEaseInOut, animations: {
//          self.menuList[index].transform = .identity
//          self.menuList[index].alpha = 0
//        }) { (_) in
//
//        }
      }
    }
  }

  
  var coordinateLabel: String!
  private let locationManager = CLLocationManager()
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    view.backgroundColor = .white
    setupNavibationBarUI()
    setupViews()
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
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    view.addSubview(mapView)
    mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    view.addSubview(menuButton)
    menuButton.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 62, right: 16), size: CGSize(width: 50, height: 50))
  }
  
  fileprivate func setupNavibationBarUI() {
    navigationItem.title = "주유지도"
    navigationController?.navigationBar.isHidden = true
  }
  
  @objc func handleMenuTouched() {
    print("menu button touched")
    menuIsExpanded = !menuIsExpanded
  }
}

// MARK:- CLLocationManager
extension MainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    let coordinate = location.coordinate
    coordinateLabel = String(format: "위도: %2.4f, 경도: %2.4f", arguments: [coordinate.latitude, coordinate.longitude])
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

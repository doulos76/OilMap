//
//  SettingsViewController.swift
//  OilMap
//
//  Created by dave76 on 07/12/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
  
  var isPresenting = false
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationItem()
    setupViews()
    setupGestures()
  }
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    
  }
  
  fileprivate func setupGestures() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleClose))
    view.addGestureRecognizer(panGesture)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleClose))
    view.addGestureRecognizer(tapGesture)
  }
  
  fileprivate func setupNavigationItem() {
    navigationController?.navigationBar.barTintColor = UIColor.customApricotColor
    navigationController?.navigationBar.barTintColor = UIColor.white
    
    if let navControllerLayer = navigationController?.navigationBar.layer {
      navControllerLayer.masksToBounds = true
      navControllerLayer.cornerRadius = 15
      navControllerLayer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    navigationItem.title = "설정"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(handleClose))
    navigationItem.rightBarButtonItem?.tintColor = .black
  }
  
  @objc func handleClose() {
    let mainWindow = UIApplication.shared.keyWindow
    let mainViewController = MainViewController()
    mainWindow?.rootViewController = mainViewController
    mainViewController.darkCoverView.alpha = 0
    view.removeFromSuperview()
    removeFromParent()
  }
}

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
  let headerId = "headerId"
  let cellId = "cellId"
  let sectionItems = ["반경", "유종선택", "검색 상표 입력", "카드 할인 입력"]
  
  var detailViewController: UIViewController = UINavigationController(rootViewController: UIViewController())
  
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationItem()
    setupViews()
//    setupGestures()
//    setupRadiusButtonCondition()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupSettingCondition()
  }
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    
  }
  
//  func setupRadiusButtonCondition() {
//
//  }
  
  fileprivate func setupSettingCondition() {
    print("Setup Setting Condition")
    // read setting data
    // view에 설정
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
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconChevron")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleClose))
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

// MARK:- Table View Data Source
extension SettingsViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sectionItems.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionTitle = sectionItems[section]
    return sectionTitle
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
    switch indexPath.section {
    case 0:
      cell = RadiusCell(style: .default, reuseIdentifier: cellId)
    case 1:
      cell = OilTypeCell(style: .default, reuseIdentifier: cellId)
    case 2:
      cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
      cell.accessoryType = .disclosureIndicator
      cell.textLabel?.text = "검색 상표 입력"
    default:
      cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
    }
    return cell
  }
  
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//     didSelectMenuItem(indexPath: indexPath)
//  }
  
//  func didSelectMenuItem(indexPath: IndexPath) {
//    switch indexPath.section {
//    case 2:
//      detailViewController = UINavigationController(rootViewController: OilStationBrandController())
//    case 3:
//      detailViewController = UINavigationController(rootViewController: OilStationBrandController())
//    default:
//      print("Test")
//    }
//    let navController = UINavigationController(rootViewController: detailViewController)
//    navController.pushViewController(OilStationBrandController(), animated: true)
//  }
}

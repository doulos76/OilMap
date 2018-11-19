//
//  SettingController.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class SettingController: UITableViewController {

  let cellId = "cellId"
  let sectionItems = ["반경", "유종선택", "검색 상표 입력", "카드 할인 입력"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.register(RadiusCell.self, forCellReuseIdentifier: cellId)
    setupNavigationController()
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleClose))
    view.addGestureRecognizer(panGesture)
  }
  
  // MARK:- Setup Work
  fileprivate func setupNavigationController() {
    navigationItem.title = "Settings"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconMenuArrowDown")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleClose))
  }
  
  @objc func handleClose() {
    dismiss(animated: true, completion: nil)
  }
}

extension SettingController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sectionItems.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let sectionTitle = sectionItems[section]
    return sectionTitle
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RadiusCell
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
}

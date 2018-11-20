//
//  GasStationListController.swift
//  OilMap
//
//  Created by dave76 on 20/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class GasStationListController: UIViewController {
  
  let cellId = "cellId"
  let selectSortListView = SelectSortListView()
  let tableView = UITableView()
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    setupNavigationItems()
    setupViews()
    setupTableView()
  }
  
  @objc func handleMapButton() {
    dismiss(animated: true, completion: nil)
  }
  
  
  
  // MARK:- Setup Works
  fileprivate func setupViews() {
    view.addSubview(selectSortListView)
    selectSortListView.translatesAutoresizingMaskIntoConstraints = false
    selectSortListView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    
    view.addSubview(tableView)
    tableView.anchor(top: selectSortListView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
  }
  
  fileprivate func setupNavigationItems() {
    navigationItem.title = "주유소 목록"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconSetSearchA")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMapButton))
  }
  
  fileprivate func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(GasStationCell.self, forCellReuseIdentifier: cellId)
  }
}

// MARK:- TableViewDelegate Method
extension GasStationListController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }  
}

// MARK:- TableViewDataSource Method
extension GasStationListController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GasStationCell
    return cell
  }
}

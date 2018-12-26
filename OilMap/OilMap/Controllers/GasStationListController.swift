//
//  GasStationListController.swift
//  OilMap
//
//  Created by dave76 on 20/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class GasStationListController: UIViewController {
  
//  let dummyTitle = ["우리 주유소", "신기촌 주유소", "신기전 주유소 주식회사 - SK LG ", "소중한 꿈을 지켜주는 교보문고 주유소", "이런 주유소 저런 주요소 그런 주유소"]
  
  let cellId = "cellId"
  let selectSortListView = SelectSortListView()
  let tableView = UITableView()
  
  var aroundAllOils = [AroundAllOil]()
  let aroundAllApi = AroundAllApi()
  

  override func viewDidLoad() {
    view.backgroundColor = .white
    setupNavigationItems()
    setupViews()
    setupTableView()
    
    let radius: Int = 5000
    let x: Double = 306282
    let y: Double = 542437
    let productCode = String(ProductCode.b027.rawValue)
    let sort: Int = 1
    

    getAroundAllGasStations(radius, productCode, x, y, sort)
  }
  
  fileprivate func getAroundAllGasStations(_ radius: Int, _ productCode: String, _ x: Double, _ y: Double, _ sort: Int) {
    aroundAllApi.getAroundAll(radius: radius, productCode: productCode, x: x, y: y, sort: sort) { (aroundAll) in
      if let aroundAll = aroundAll {
        self.aroundAllOils = aroundAll.result.oil
        print("\n================[aroundAll]================\n")
        print(self.aroundAllOils)
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
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
    return 90
  }
}

// MARK:- TableViewDataSource Method
extension GasStationListController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return aroundAllOils.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GasStationCell
    cell.gasStation = aroundAllOils[indexPath.row]
    cell.titleLabel.numberOfLines = 0
    return cell
  }
}

//
//  SearchController.swift
//  OilMap
//
//  Created by dave76 on 16/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class SearchController: UITableViewController {
  
  let menu = ["지역 검색", "내 주변 검색", "고속도로 검색", "즐겨찾기"]
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "검색"
    tableView.backgroundColor = .white
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menu.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    cell.textLabel?.text = menu[indexPath.row]
    cell.backgroundColor = .white
    return cell
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return UIView()
  }
}

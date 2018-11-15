//
//  MainViewController.swift
//  OilMap
//
//  Created by dave76 on 15/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
  // MARK:- View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.title = "주유지도"
    navigationController?.navigationBar.isHidden = true
  }
}

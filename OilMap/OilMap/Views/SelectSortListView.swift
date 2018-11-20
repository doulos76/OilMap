//
//  SelectSortListView.swift
//  OilMap
//
//  Created by dave76 on 20/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class SelectSortListView: UIView {
  
  let segmentedControl: UISegmentedControl = {
    let items = ["가격순", "거리순"]
    let segControl = UISegmentedControl(items: items)
    segControl.translatesAutoresizingMaskIntoConstraints = false
    segControl.backgroundColor = .white
    segControl.tintColor = UIColor.customIndigoColor
    segControl.selectedSegmentIndex = 0
    segControl.addTarget(self, action: #selector(sortList), for: .valueChanged)
    return segControl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSegmentedControlView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func sortList() {
    print("sort")
  }
  
  fileprivate func setupSegmentedControlView() {
    print("setup Segmented control view")
    addSubview(segmentedControl)
    segmentedControl.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 40, bottom: 10, right: 40))
  }
}

//
//  RectangleCustomButton.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class RectangleCustomButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .customIndigoColor
    tintColor = .white
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 5
    layer.shadowOpacity = 0.25
    layer.shadowOffset = CGSize(width: 2, height: 10)
    titleLabel?.textColor = .white
    titleLabel?.textAlignment = .center
    titleLabel?.font = UIFont.systemFont(ofSize: 12)
    alpha = 0.9
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 100, height: 26)
  }
}

//
//  CustomLabel.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.customIndigoColor
    alpha = 0.9
    textColor = .white
    textAlignment = .center
    font = UIFont.systemFont(ofSize: 12)
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 5
    layer.shadowOpacity = 0.25
    layer.shadowOffset = CGSize(width: 2, height: 10)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 100, height: 26)
  }
}

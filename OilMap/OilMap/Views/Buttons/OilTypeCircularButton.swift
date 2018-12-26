//
//  OilTypeCircularButton.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class OilTypeCircularButton: RadiusCircularButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    isSelected = false
    setImage(UIImage(named: "iconOilGun")?.withRenderingMode(.alwaysOriginal), for: .normal)
    backgroundColor = .lightGray
    tintColor = .clear
    layer.cornerRadius = 28
    layer.masksToBounds = true
    addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
  }
  
  @objc override func buttonTouched() {
    if isSelected == true {
      backgroundColor = .lightGray
      isSelected = false
    } else {
      backgroundColor = #colorLiteral(red: 0.9603450894, green: 0.6483944058, blue: 0.1405650675, alpha: 1)
      isSelected = true
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 56, height: 56)
  }
}

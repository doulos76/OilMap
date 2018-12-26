//
//  RadiusCircularButton.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class RadiusCircularButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setTitleColor(.darkGray, for: .normal)
    titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 20)
    backgroundColor = .lightGray
    layer.cornerRadius = 28
    layer.masksToBounds = true
    addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
  }
  
  @objc func buttonTouched() {
    if isSelected == false {
      backgroundColor = .lightGray
      setTitleColor(.darkGray, for: .normal)
      isSelected = true
    } else {
      backgroundColor = .black
      setTitleColor(.white, for: .normal)
      isSelected = false
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 56, height: 56)
  }
}

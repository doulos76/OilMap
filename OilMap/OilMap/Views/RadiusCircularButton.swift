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
    isSelected = false
    setTitleColor(.darkGray, for: .normal)
    setTitleColor(.white, for: .highlighted)
    titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 20)
    backgroundColor = .lightGray
    tintColor = .clear
    layer.cornerRadius = 28 //bounds.size.width / 2
    layer.masksToBounds = true
    backgroundColor = .lightGray
    addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
  }
  
  @objc func buttonTouched() {
    if isSelected == true {
      backgroundColor = .lightGray
      setTitleColor(.darkGray, for: .normal)
      isSelected = false
    } else {
      backgroundColor = .black
      setTitleColor(.white, for: .normal)
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

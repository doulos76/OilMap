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
    setTitleColor(.black, for: .normal)
    titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 14)
    setImage(UIImage(named: "iconSetUzong"), for: .normal)
    backgroundColor = .lightGray
    tintColor = .clear
    layer.cornerRadius = bounds.width / 2
    layer.masksToBounds = true
    addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
  }
  
  @objc override func buttonTouched() {
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

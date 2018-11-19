//
//  CustomButton.swift
//  OilMap
//
//  Created by dave76 on 16/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class RoundCustomButton: UIButton {
  
  let textLable: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.backgroundColor = UIColor.customIndigoColor.withAlphaComponent(0.8)
    label.textAlignment = .center
    label.text = "목록전환"
    label.layer.cornerRadius = 5
    label.layer.masksToBounds = true
    label.alpha = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    setImage(UIImage(named: "iconAd"), for: .normal)
    imageView?.contentMode = .scaleToFill
    backgroundColor = .customIndigoColor
    tintColor = .white
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 5
    layer.shadowOpacity = 0.25
    layer.shadowOffset = CGSize(width: 2, height: 10)
    addSubview(textLable)
    textLable.widthAnchor.constraint(equalToConstant: 90).isActive = true
    textLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
    textLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    textLable.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -10).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

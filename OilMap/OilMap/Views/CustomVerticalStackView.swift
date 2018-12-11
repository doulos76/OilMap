//
//  CustomVerticalStackView.swift
//  OilMap
//
//  Created by dave76 on 10/12/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class CustomVerticalStackView: UIStackView {
  
  let customImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "iconSetUzong")
    return imageView
  }()
  
  let customLabel: UILabel = {
    let label = UILabel()
    label.text = "휘발유"
    label.textColor = .black
    label.font = .systemFont(ofSize: 14)
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(customImageView)
    addSubview(customLabel)
    axis = .vertical
    alignment = .center
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

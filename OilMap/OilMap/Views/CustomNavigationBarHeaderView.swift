//
//  CustomNavigationBarHeaderView.swift
//  OilMap
//
//  Created by dave76 on 22/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class CustomNavigationBarHeaderView: UIView {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "설정(Settings)"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    label.backgroundColor = .blue
    label.translatesAutoresizingMaskIntoConstraints = true
    return label
  }()
  
  let closeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "iconMenuArrowDown"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = true
    button.backgroundColor = .green
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .green
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(titleLabel)
    addSubview(closeButton)
    
    titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
    closeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
    closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
}

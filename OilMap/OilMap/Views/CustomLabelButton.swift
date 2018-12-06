//
//  CustomLabelButton.swift
//  OilMap
//
//  Created by dave76 on 30/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class CustomLabelButton: UIView {
  
  let textField: CustomTextField = {
    let textField = CustomTextField()
    textField.placeholder = "검색지역을 입력해 주세요.(예:서울 강남)"
    textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : UIColor(white: 0.8, alpha: 0.8)])
    return textField
  }()
  
  let customButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .customIndigoColor
    button.tintColor = .white
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowRadius = 5
    button.layer.shadowOpacity = 0.25
    button.layer.shadowOffset = CGSize(width: 2, height: 10)
//    button.titleLabel?.textColor = .white
//    button.titleLabel?.textAlignment = .center
//    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.alpha = 0.9
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews() {
    let arrangedSubviews = [textField, customButton]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.axis = .horizontal
    stackView.alignment = .trailing
    stackView.spacing = 10
    stackView.distribution = .fillProportionally
    
    addSubview(stackView)
    stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
  }
}

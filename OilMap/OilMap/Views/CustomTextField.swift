//
//  CustomTextField.swift
//  OilMap
//
//  Created by dave76 on 16/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
  
  private var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.cornerRadius = 5

    textColor = .white
    backgroundColor = UIColor.customIndigoColor
    alpha = 0.9
    translatesAutoresizingMaskIntoConstraints = false

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
}

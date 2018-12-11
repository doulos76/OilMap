//
//  UIViewExtensions.swift
//  OilMap
//
//  Created by dave76 on 15/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

// MARK:- UIColor Extension
extension UIColor {
  
  // Custom Theme Color
  static let customBisqueColor = rgb(red: 251, green: 238, blue: 216)
  static let customApricotColor = rgb(red: 254, green: 187, blue: 99)
  static let customOrangeColor = rgb(red: 254, green: 121, blue: 93)
  static let customIndigoColor = rgb(red: 102, green: 92, blue: 131)
  
  // color setting convinience method
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
  }
}

// MARK:- AnchoredConstriants structure
struct AnchoredConstraints {
  var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

// MARK:- UIView Extension - Autolayout
extension UIView {
  
  // convience autolayout method
  @discardableResult
  func anchor(top: NSLayoutYAxisAnchor?,
              leading: NSLayoutXAxisAnchor?,
              bottom: NSLayoutYAxisAnchor?,
              trailing: NSLayoutXAxisAnchor?,
              padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
    
    translatesAutoresizingMaskIntoConstraints = false
    var anchoredConstraints = AnchoredConstraints()
    
    if let top = top {
      anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
    }
    
    if let leading = leading {
      anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
    }
    
    if let bottom = bottom {
      anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
    }
    
    if let trailing = trailing {
      anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
    }
    
    if size.width != 0 {
      anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
    }
    
    if size.height != 0 {
      anchoredConstraints.height = widthAnchor.constraint(equalToConstant: size.height)
    }
    
    [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach { $0?.isActive = true }
    return anchoredConstraints
  }
  
  // fill Superview method
  func fillSuperview(padding: UIEdgeInsets = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let superviewTopAnchor = superview?.topAnchor {
      topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
    }
    
    if let superviewBottomAnchor = superview?.bottomAnchor {
      bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    if let superviewLeadingAnchor = superview?.leadingAnchor {
      leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
    }
    
    if let superviewTrailingAnchor = superview?.trailingAnchor {
      trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
    }
  }
  
  // Center in Superview method
  func centerInSuperview(size: CGSize = .zero) {
    translatesAutoresizingMaskIntoConstraints = false
    
    if let superviewCenterXAnchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
    }
    
    if let superviewCenterYAnchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
    }
    
    if size.width != 0 {
      widthAnchor.constraint(equalToConstant: size.width).isActive = true
    }
    
    if size.height != 0 {
      heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
  }
}


extension UIButton {  
  func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
    let imageSize = self.imageView!.frame.size
    let titleSize = self.titleLabel!.frame.size
    let totalHeight = imageSize.height + titleSize.height + padding
    
    self.imageEdgeInsets = UIEdgeInsets(
      top: -(totalHeight - imageSize.height),
      left: 0,
      bottom: 0,
      right: -titleSize.width
    )
    
    self.titleEdgeInsets = UIEdgeInsets(
      top: 0,
      left: -imageSize.width,
      bottom: -(totalHeight - titleSize.height),
      right: 0
    )
  }
}

//
//  HeaderStackView.swift
//  OilMap
//
//  Created by dave76 on 29/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class HeaderStackView: UIStackView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let oilTypeLabel: CustomLabel = {
      let label = CustomLabel()
      label.text = "휘발유"
      return label
    }()
    
    let currentMapMinimumOilPriceLabel: CustomLabel = {
      let label = CustomLabel()
      label.text = "최저: 1458원"
      label.textColor = UIColor.black
      label.backgroundColor = UIColor.customOrangeColor
      return label
    }()
    
    let nationalAvgOilPriceLabel: CustomLabel = {
      let label = CustomLabel()
      label.text = "전국평균: 1567원"
      return label
    }()
    
    let nationalMinimumOilPriceLabel: CustomLabel = {
      let label = CustomLabel()
      label.text = "전국최저: 1375원"
      return label
    }()
    
    let radiusButton: RectangleCustomButton = {
      let button = RectangleCustomButton()
      button.setTitle("반경: \(5)Km", for: .normal)
      return button
    }()
    
    let moveLocationButton: RectangleCustomButton = {
      let button = RectangleCustomButton()
      button.setTitle("위치이동: \("ON")", for: .normal)
      return button
    }()
    
    let arrangedOilPriceDisplaySubView = [oilTypeLabel, currentMapMinimumOilPriceLabel, nationalAvgOilPriceLabel, nationalMinimumOilPriceLabel]
    let oilPriceDisplayStackView = UIStackView(arrangedSubviews: arrangedOilPriceDisplaySubView)
    oilPriceDisplayStackView.axis = .vertical
    oilPriceDisplayStackView.alignment = .fill
    oilPriceDisplayStackView.distribution = .equalSpacing
    oilPriceDisplayStackView.spacing = 2
    
    
    let arrangedDisplayStackView = [oilPriceDisplayStackView, radiusButton, moveLocationButton]
    let displayStackView = UIStackView(arrangedSubviews: arrangedDisplayStackView)
    displayStackView.axis = .horizontal
    displayStackView.distribution = .fillEqually
    displayStackView.alignment = .top
    displayStackView.spacing = 20
    addSubview(displayStackView)
    
    let stackView = UIStackView(arrangedSubviews: arrangedDisplayStackView)
    addSubview(stackView)
    axis = .horizontal
    distribution = .fillEqually
    alignment = .top
    spacing = 20
    anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)

//    setupViews()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
  }
}

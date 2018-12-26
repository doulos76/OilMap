//
//  RadiusCell.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class RadiusCell: UITableViewCell {
  
  let buttonTitles = ["1Km", "2Km", "3Km", "5Km"]
  
  let radiusList = [1000.0, 2000.0, 3000.0, 5000.0]
  
  let oneKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("1Km", for: .normal)
    button.layer.masksToBounds = true
    return button
  }()
  
  let twoKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("2Km", for: .normal)
    return button
  }()
  
  let threeKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("3Km", for: .normal)
    return button
  }()
  
  let fiveKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("5Km", for: .normal)
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    selectButton()
  }
  
  func selectButton() {
    let buttonList = [oneKmCircleButton, twoKmCircleButton, threeKmCircleButton, fiveKmCircleButton]
    for button in buttonList {
      button.isSelected = true
    }
  }
  
  @objc func buttonPressed() {
    print("button pressed")
  }
  
  func setupViews() {
    let arrangedSubviews = [oneKmCircleButton, twoKmCircleButton, threeKmCircleButton, fiveKmCircleButton]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    addSubview(stackView)
    stackView.distribution = .equalCentering
    stackView.alignment = .center
    stackView.spacing = 20
    stackView.axis = .horizontal
    stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: CGSize.zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

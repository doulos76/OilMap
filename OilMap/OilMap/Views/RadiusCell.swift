//
//  RadiusCell.swift
//  OilMap
//
//  Created by dave76 on 19/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class RadiusCell: UITableViewCell {
  
  let buttonTitles = ["1Km", "3Km", "5Km", "10Km"]
  
  let oneKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("1Km", for: .normal)
    button.layer.masksToBounds = true
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

  let tenKmCircleButton: RadiusCircularButton = {
    let button = RadiusCircularButton()
    button.setTitle("10Km", for: .normal)
    return button
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  func setupViews() {
    let arrangedSubviews = [oneKmCircleButton, threeKmCircleButton, fiveKmCircleButton, tenKmCircleButton]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    addSubview(stackView)
    
    stackView.distribution = .equalCentering
    stackView.alignment = .center
    stackView.axis = .horizontal
    stackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: CGSize.zero)
    stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

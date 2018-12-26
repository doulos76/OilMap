//
//  OilTypeCell.swift
//  OilMap
//
//  Created by dave76 on 10/12/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class OilTypeCell: UITableViewCell {
  
  let buttonTitles = ["휘발유", "경유", "고급휘발유", "등유", "LPG"]
  var buttonList = [OilTypeCircularButton]()
  var labelList = [UILabel]()
  var verticalStakViewList = [UIStackView]()
  var horizontalStackView = UIStackView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupVerticalStackView()
    setupViews()
  }

  func setupVerticalStackView() {
    for buttonTitle in buttonTitles {
      let button = OilTypeCircularButton(type: .system)
      button.imageView?.contentMode = .scaleAspectFill
      buttonList.append(button)
      let label = UILabel()
      label.text = buttonTitle
      label.textColor = .black
      label.font = UIFont.systemFont(ofSize: 12)
      labelList.append(label)
      
      let verticalStackView = UIStackView()
      verticalStackView.axis = .vertical
      verticalStackView.spacing = 8
      verticalStackView.addArrangedSubview(button)
      verticalStackView.addArrangedSubview(label)
      verticalStackView.alignment = .center
      verticalStackView.distribution = .equalCentering
      horizontalStackView.addArrangedSubview(verticalStackView)
      horizontalStackView.axis = .horizontal
      horizontalStackView.spacing = 8
      horizontalStackView.alignment = .leading
      horizontalStackView.distribution = .equalSpacing
    }
  }
  
  func printButtonsTag() {
    print(buttonList[0])
  }
  
  func buttonTouched() {
    
  }
  
  fileprivate func setupViews() {
    horizontalStackView.spacing = 8
    horizontalStackView.axis = .horizontal
    horizontalStackView.distribution = .equalSpacing
    addSubview(horizontalStackView)
    horizontalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//
//  GasStationCell.swift
//  OilMap
//
//  Created by dave76 on 20/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class GasStationCell: UITableViewCell {
  
  let stationImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logoSK")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "SJ 주유소"
    label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    label.numberOfLines = 0
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "1515 원"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    return label
  }()

  let distanceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "22.51 Km"
    label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 18)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    accessoryType = .disclosureIndicator
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    addSubview(stationImageView)
    addSubview(titleLabel)
    addSubview(priceLabel)
    addSubview(distanceLabel)
    
    stationImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: CGSize(width: 40, height: 40))
    stationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    titleLabel.anchor(top: topAnchor, leading: stationImageView.trailingAnchor, bottom: nil, trailing: priceLabel.leadingAnchor, padding: .init(top: 16, left: 8, bottom: 0, right: 16), size: CGSize(width: 0, height: 50))
    priceLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: accessoryView?.leadingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 8), size: CGSize(width: 60, height: 22))
    distanceLabel.anchor(top: nil, leading: priceLabel.leadingAnchor, bottom: bottomAnchor, trailing: priceLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0), size: CGSize(width: 0, height: 50))
  }
  
}

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
    label.backgroundColor = .red
    label.numberOfLines = 0
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .green
    label.text = "1515 원"
    label.textAlignment = .right
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    return label
  }()

  let distanceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .yellow
    label.text = "22.51 Km"
    label.textAlignment = .right
    label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 18)
    return label
  }()
  
  let optionLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "세차"
    label.textAlignment = .right
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
    
    
    
    
    let stackView = UIStackView(arrangedSubviews: [optionLabel, distanceLabel, optionLabel, distanceLabel])
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.spacing = 8
    stackView.backgroundColor = .purple
    stackView.distribution = .fillEqually
    
    addSubview(stationImageView)
    addSubview(titleLabel)
    addSubview(stackView)
    addSubview(priceLabel)
    addSubview(distanceLabel)
    
    stationImageView.translatesAutoresizingMaskIntoConstraints = false
    stationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    stationImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
    stationImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    stationImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    priceLabel.translatesAutoresizingMaskIntoConstraints = false
    priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
    priceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    priceLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    distanceLabel.translatesAutoresizingMaskIntoConstraints = false
    distanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
    distanceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    distanceLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.leadingAnchor.constraint(equalTo: stationImageView.trailingAnchor, constant: 8).isActive = true
    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8).isActive = true
    titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 8).isActive = true
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

    
    
    
//    stationImageView.anchor(top: nil, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: CGSize(width: 40, height: 40))
//    stationImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//
//    titleLabel.anchor(top: topAnchor, leading: stationImageView.trailingAnchor, bottom: stackView.topAnchor, trailing: priceLabel.leadingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: CGSize(width: 200, height: 22))
//    stackView.anchor(top: titleLabel.bottomAnchor, leading: stationImageView.trailingAnchor, bottom: bottomAnchor, trailing: priceLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 8, right: 8), size: CGSize(width: 200, height: 22))
//
//    priceLabel.anchor(top: topAnchor, leading: titleLabel.trailingAnchor, bottom: distanceLabel.topAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 0), size: CGSize(width: 200, height: 22))
//
//    distanceLabel.anchor(top: priceLabel.bottomAnchor, leading: titleLabel.trailingAnchor, bottom: bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 0), size: CGSize(width: 200, height: 22))

  }
  
}

//
//  GasStationCell.swift
//  OilMap
//
//  Created by dave76 on 20/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

class GasStationCell: UITableViewCell {
  
  var gasStation: AroundAllOil? {
    didSet {
      titleLabel.text = gasStation?.oilStationName
      priceLabel.text = "\(gasStation!.price)원"
      distanceLabel.text = "\(gasStation!.distance)m"
      guard let imageName: PollDivCode = gasStation?.pollDivCode else { return }
      var imageNameString: String = ""
      switch imageName {
      case .ske:
        imageNameString = "logoSKE"
      case .gsc:
        imageNameString = "logoGSC"
      case .e1g:
        imageNameString = "logoE1G"
      case .hdo:
        imageNameString = "logoHDO"
      case .rto:
        imageNameString = "logoRTO"
      case .sol:
        imageNameString = "logoSOL"
      case .rtx:
        imageNameString = "logoRTX"
      case .nho:
        imageNameString = "logoNHO"
      default:
        imageNameString = "logoETC"
      }
      stationImageView.image = UIImage(named: imageNameString)
    }
  }
  
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
    label.textAlignment = .right
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    return label
  }()

  let distanceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "22.51 Km"
    label.textAlignment = .right
    label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 18)
    return label
  }()
  
  let optionLabel1: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "셀프"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = .white
    return label
  }()

  let optionLabel2: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "세차"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = .white
    return label
  }()
  
  let optionLabel3: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "24시"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = .white

    return label
  }()
  
  let optionLabel4: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "편의점"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = .white
    return label
  }()
  
  let optionLabel5: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.backgroundColor = .orange
    label.text = "정비소"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = .white
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
    let stackView = UIStackView(arrangedSubviews: [optionLabel1, optionLabel2, optionLabel3, optionLabel4, optionLabel5])
    stackView.axis = .horizontal
    stackView.alignment = .leading
    stackView.spacing = 8
    stackView.backgroundColor = .purple
    stackView.distribution = .fill
    
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
    priceLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -4).isActive = true
    priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
    priceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    priceLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    distanceLabel.translatesAutoresizingMaskIntoConstraints = false
    distanceLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 4).isActive = true
    distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
    distanceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
    distanceLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.leadingAnchor.constraint(equalTo: stationImageView.trailingAnchor, constant: 8).isActive = true
    titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8).isActive = true
    titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    stackView.trailingAnchor.constraint(lessThanOrEqualTo: titleLabel.trailingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
  }
  
}

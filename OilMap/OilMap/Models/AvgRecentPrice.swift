//
//  AvgRecentPrice.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AvgRecentPrice: Decodable {
  let result: AvgRecentPriceResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AvgRecentPriceResult: Decodable {
  let oil: AvgRecentPriceOil
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AvgRecentPriceOil: Decodable {
  let date: String
  let productCode: ProductCode
  let price: String
  
  enum CodingKeys: String, CodingKey {
    case date = "DATE"
    case productCode = "PRODCD"
    case price = "PRICE"
  }
}

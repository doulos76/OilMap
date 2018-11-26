//
//  AvgSigunPrice.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AvgSigunPrice: Decodable {
  let result: AvgSigunPriceResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AvgSigunPriceResult: Decodable {
  let oil: [AvgSigunPriceOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AvgSigunPriceOil: Decodable {
  let sigunCode: String
  let sigunName: String
  let productCode: ProductCode
  let price: Int
  let diff: String
  
  enum CodingKeys: String, CodingKey {
    case sigunCode = "SIGUNCD"
    case sigunName = "SIGUNNM"
    case productCode = "PRIDCD"
    case price = "PRICE"
    case diff = "DIFF"
  }
}

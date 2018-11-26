//
//  AvgSidoPrice.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AvgSidoPrice: Decodable {
  let result: AvgSidoPriceResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AvgSidoPriceResult: Decodable {
  let oil: [AvgSidoPriceOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AvgSidoPriceOil: Decodable {
  let sidoCode: String
  let sidoName: String
  let productCode: ProductCode
  let price: Int
  let diff: String
  
  enum CodingKeys: String, CodingKey {
    case sidoCode = "SIDOCD"
    case sidoName = "SIDONM"
    case productCode = "PRODCD"
    case price = "PRICE"
    case diff = "DIFF"
  }
}

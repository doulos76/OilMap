//
//  AvgAllPrice.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AvgAllPrice: Decodable {
  let result: AvgAllPriceResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AvgAllPriceResult: Decodable {
  let oil: [AvgAllPriceOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AvgAllPriceOil: Decodable {
  let tradeDate: String   // 해당일자
  let productCode: String // 제품 구분 코드
  let productName: String // 제품명
  let price: Int       // 평균가격
  let diff: String        // 전일대비 등라값
  
  enum CodkingKeys: String, CodingKey {
    case tradeDate = "TRADE_DT"
    case productCode = "PRODCD"
    case productName = "PRODNM"
    case price = "PRICE"
    case diff = "DIFF"
  }
}

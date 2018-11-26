//
//  AvgLastWeek.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AvgLastWeek: Decodable {
  let result: AvgLastWeekResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AvgLastWeekResult: Decodable {
  let oil: [AvgLastWeekOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AvgLastWeekOil: Decodable {
  let week: String
  let startDate: String
  let endDate: String
  let areaCode: String
  let productCode: ProductCode
  let price: String
  
  enum CodingKeys: String, CodingKey {
    case week = "WEEK"
    case startDate = "STA_DT"
    case endDate = "END_DT"
    case areaCode = "AREA_CD"
    case productCode = "PRODCD"
    case price = "PRICE"
  }
}

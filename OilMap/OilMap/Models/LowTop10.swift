//
//  LowTop10.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct LowTop10: Decodable {
  let result: LowTop10Result
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct LowTop10Result: Decodable {
  let oil: [LowTop10Oil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct LowTop10Oil: Decodable {
  let uniId: String
  let price: String
  let pollDivCode: PollDivCode
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case price = "PRICE"
    case pollDivCode = "POLL_DIV_CD"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
  }
}

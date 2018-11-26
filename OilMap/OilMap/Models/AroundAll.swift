//
//  AroundAll.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AroundAll: Decodable {
  let result: AroundAllResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AroundAllResult: Decodable {
  let oil: [AroundAllOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AroundAllOil: Decodable {
  let uniId: String
  let pollDivCode: PollDivCode
  let oilStationName: String
  let price: String
  let distance: Double
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCode = "POLL_DIV_CD"
    case oilStationName = "OS_NM"
    case price = "PRICE"
    case distance = "DISTANCE"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
  }
}

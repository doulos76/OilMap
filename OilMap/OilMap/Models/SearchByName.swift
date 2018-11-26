//
//  SearchByName.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct SearchByName: Decodable {
  let result: SearchByNameResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct SearchByNameResult: Decodable {
  let oil: [SearchByNameOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct SearchByNameOil: Decodable {
  let uniId: String
  let pollDivCode: PollDivCode
  let gpollDivCode: PollDivCode
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let sigunCode: String
  let lpgYN: LpgYN
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCode = "POLL_DIV_CD"
    case gpollDivCode = "GPOLL_DIV_CD"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case sigunCode = "SIGUNCD"
    case lpgYN = "LPG_YN"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
  }
}

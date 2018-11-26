//
//  DetailById.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct DetailById: Decodable {
  let result: DetailByIdResult
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct DetailByIdResult: Decodable {
  let oil: [DetailByIdOil]
  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct DetailByIdOil: Decodable {
  let uniId: String
  let pollDivCode: PollDivCode
  let gpollDivCode: PollDivCode
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let tel: String
  let sigunCode: String
  let lpgYN: LpgYN
  let maintanceYN: MaintanceYN
  let carWashYN: CarWashYN
  let kpetroYN: KpetroYN
  let cvsYN: CvsYN
  let gisXCoordinate: Double
  let gisYCoordinate: Double
  let oilPrice: [DetailByIdOilPrice]
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCode = "POLL_DIV_CD"
    case gpollDivCode = "GPOLL_DIV_CD"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case tel = "TEL"
    case sigunCode = "SIGUNCD"
    case lpgYN = "LPG_YN"
    case maintanceYN = "MAINT_YN"
    case carWashYN = "CAR_WASH_YN"
    case kpetroYN = "KPETRO_YN"
    case cvsYN = "CVS_YN"
    case gisXCoordinate = "GIS_X_COOR"
    case gisYCoordinate = "GIS_Y_COOR"
    case oilPrice = "OIL_PRICE"
  }
}

struct DetailByIdOilPrice: Decodable {
  let productCode: ProductCode
  let price: Int
  let tradeDate: String
  let tradeTime: String
  
  enum CodingKeys: String, CodingKey {
    case productCode = "PRODCD"
    case price = "PRICE"
    case tradeDate = "TRADE_DT"
    case tradeTime = "TRADE_TM"
  }
}

enum MaintanceYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CarWashYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum LpgYN: String, Decodable {
  case y = "Y"
  case n = "N"
  case c = "C"
}

enum KpetroYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

enum CvsYN: String, Decodable {
  case y = "Y"
  case n = "N"
}

//
//  AreaCode.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

struct AreaCode: Decodable {
  let result: String
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AreaCodeResult: Decodable {
  let oil: [AreaCodeOil]
  enum CodingKeys: String, CodingKey {
    case oil = "Oil"
  }
}

struct AreaCodeOil: Decodable {
  let areaCode: String
  let areaName: String
  
  enum CodingKeys: String, CodingKey {
    case areaCode = "AREA_CD"
    case areaName = "AREA_NM"
  }
}

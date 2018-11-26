//
//  ProductCode.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

enum ProductCode: String, Decodable {
  case b034 = "B034"  // 고급휘발유
  case b027 = "B027"  // 보통휘발유
  case d047 = "D047"  // 자동차경유
  case c004 = "C004"  // 실내등유
  case k015 = "K015"  // 자동차부탄
}

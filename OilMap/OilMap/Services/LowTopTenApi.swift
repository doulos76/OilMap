//
//  LowTopTenApi.swift
//  OilMap
//
//  Created by dave76 on 13/12/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

class LowTopTenApi {
  
  // Web request with Codable
  func getLowTopTen(areaCode: Int = 01, productCode: ProductCode, completion: @escaping LowTopTenResponseCompletion) {
    let urlString = LOW_TOP10 + QUERY_OUT_JSON_AND_OPINET_CODE + "&prodcd=\(productCode.rawValue)" //+ "&area=\(areaCode)"
    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let lowTopTen = try jsonDecoder.decode(LowTopTen.self, from: data)
        completion(lowTopTen)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}

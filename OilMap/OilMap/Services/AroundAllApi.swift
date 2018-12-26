//
//  AroundAllApi.swift
//  OilMap
//
//  Created by dave76 on 13/12/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation


class AroundAllApi {
  // Web request with Codable
  func getAroundAll(radius: Int, productCode: String, x: Double, y: Double, sort: Int, completion: @escaping AroundAllResponseCompletion) {
    let urlString = AROUND_ALL + QUERY_OUT_JSON_AND_OPINET_CODE + "&radius=\(radius)" + "&prodcd=\(productCode)" + "&x=\(x)" + "&y=\(y)" + "&sort=\(sort)"
    print("\n================[\(urlString)]================\n")
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
        let aroundAll = try jsonDecoder.decode(AroundAll.self, from: data)
        completion(aroundAll)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}

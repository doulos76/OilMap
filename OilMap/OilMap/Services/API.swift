//
//  API.swift
//  OilMap
//
//  Created by dave76 on 26/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import Foundation

private let baseURL = "http://www.opinet.co.kr/api/"

// MARK:- API Protocol
protocol APIProtocol {
  var urlString: String { get }
}

// MARK:- API Enum
enum API: APIProtocol {
  enum LIST: String {
    // 전국 주유소 평균가격
    case avgAll = "avgAllPrice.do?code=%@&out=json"
    // 시도별 주유소 평균가격
    case avgSido = "avgSidoPrice.do?code=%@&out=json&sido=%02&prodcd=%@"
    // 시군구별 주유소 평균가격
    case avgSigun = "avgSigunPrice.do?code=%@&out=json&sido=%02d&sigun=%04d&prodcd=%@"
    // 최근 7일간 전국 일일 평균가격
    case avgRecent = "avgRecentPrice.do?code=%@&out=json&prodcd=%@"
    // 최근 1주의 주간 평균유가(전국/시도별)
    case avgLastWeek = "avgLastWeek.do?code=%@&out=json&prodcd=%@&sido=%02d"
    // 지역별 최저가 주유소(TOP10)
    case lowTop10 = "lowTop10.do?code=%@&out=json&prodcd=%@&area=%04d"
    // 반경내 주유소
    case aroundAll = "aroundAll.do?code=%@&out=json&x=%.5f&y=%.5f&radius=%d&prodcd=%@&sort=%d"
    // 주유소 상세정보(ID)
    case detailById = "detailById.do?code=%@&out=json&id=%@"
    // 지역코드
    case areaCode = "areaCode.do?code=%@&out=json&area=%@"
    // 상호로 주유소 검색
    case searchByName = "searchByName.do?code=%@&out=json&osnm=%@&araa=%@"
  }
  
  // API List
  case avgAll(opinetCode: String)
  case avgSido(opinetCode: String, sido: Int, prodcutCode: String)
  case avgSigun(opinetCode: String, sido: Int, sigun: Int, productCode: String)
  case avgRecentPrice(opinetCode: String, productCode: String)
  case avgLastWeek(opinetCode: String, productCode: String, sido: Int)
  case lowTop10(opinetCode: String, productCode: String, area: Int)
  case aroundAll(opinetCode: String, x: Double, y: Double, radius: Int, productCode: String, sort: Int)
  case detailById(opinetCode: String, id: String)
  case areaCode(opinetCode: String, area: String)
  case searchByName(opinetCode: String, osnm: String, area: Int)
  
  // endPoint에 파라미터 값을 반환하는 변수
  private var endPointString: String {
    get {
      var tempString: String = ""
      switch self {
      case .avgAll(let opinetCode):
        tempString = String(format: LIST.avgAll.rawValue, opinetCode)
      case .avgSido(let opinetCode, let sido, let productCode):
        tempString = String(format: LIST.avgSido.rawValue, opinetCode, sido, productCode)
      case .avgSigun(let opinetCode, let sido, let sigun, let productCode):
        tempString = String(format: LIST.avgSigun.rawValue, opinetCode, sido, sigun, productCode)
      case .avgRecentPrice(let opinetCode, let productCode):
        tempString = String(format: LIST.avgRecent.rawValue, opinetCode, productCode)
      case .avgLastWeek(let opinetCode, let productCode, let sido):
        tempString = String(format: LIST.avgLastWeek.rawValue, opinetCode, productCode, sido)
      case .lowTop10(let opinetCode, let productCode, let area):
        tempString = String(format: LIST.lowTop10.rawValue, opinetCode, productCode, area)
      case .aroundAll(let opinetCode, let x, let y, let radius, let productCode, let sort):
        tempString = String(format: LIST.aroundAll.rawValue, opinetCode, x, y, radius, productCode, sort)
      case .detailById(let opinetCode, let id):
        tempString = String(format: LIST.detailById.rawValue, opinetCode, id)
      case .areaCode(let opinetCode, let area):
        tempString = String(format: LIST.areaCode.rawValue, opinetCode, area)
      case .searchByName(let opinetCode, let osnm, let area):
        tempString = String(format: LIST.searchByName.rawValue, opinetCode, osnm, area)
      }
      return tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
  }
  
  // 기본 URL 주소와 EndPoint를 합쳐주는 변수
  var urlString: String {
    get {
      return baseURL + self.endPointString
    }
  }
}

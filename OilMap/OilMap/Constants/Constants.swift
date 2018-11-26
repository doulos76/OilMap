//
//  Constants.swift
//  OilMap
//
//  Created by dave76 on 15/11/2018.
//  Copyright © 2018 dave76. All rights reserved.
//

import UIKit

/*:
 # API List
 - 전국 주유소 평균가격(현재)
 - 시도별 주육소 평균가격(현재)
 - 시군구별 주유소 평균가격(현재)
 - 최근 7일기나 전국 일일 평균가격
 - 전국/지역별 최저가 주유소(Top10)
 - 반경 내 주유소 검색
 - 주유소 상세정보(ID)
 - 지역코드 조회
 - 상호로 주유소 검색
 
 # 이용 기준
 -  Call 제한 수 : 1,000(call/일)
 */

let OPINET_CODE = "F365181005"
let BASE_URL_STRING = "http://www.opinet.co.kr/api/"

let QUERY_OUT_JSON_AND_CODE = "?out=json&code="
let QUERY_OUT_JSON_AND_OPINET_CODE = QUERY_OUT_JSON_AND_CODE + OPINET_CODE

// 전국 주유소 평균 가격(현재)
let AVG_ALL_PRICE = BASE_URL_STRING + "avgAllPrice.do"
// 시도별 주유소 평균가격
let AVG_SIDO_PRICE = BASE_URL_STRING + "avgSidoPrice.do"
// 시군구별 주유소 평균가격(현재)
let AVG_SIGUNGU_PRICE = BASE_URL_STRING + "avgSigunPrice.do"
// 최근 7일간 전국 일일 평균가격
let AVG_RECENT_PRICE = BASE_URL_STRING + "avgRecentPrice.do"
// 최근 1주의 주간 평균 유가 (전국/시도별)
let AVG_LAST_WEEK = BASE_URL_STRING + "avgLastWeek.do"
//  지역별 최저가 주유소(TOP 10)
let LOW_TOP10 = BASE_URL_STRING + "lowTop10.do"
// 반경내 주유소
let AROUND_ALL = BASE_URL_STRING + "aroundAll.do"
let DETAIL_BY_ID = BASE_URL_STRING + "detailById.do"
let AREA_CODE = BASE_URL_STRING + "areaCode.do"
// 상호로 주유소 검색
let SEARCH_BY_NAME = BASE_URL_STRING + "searchByName.do"

typealias AvgAllPriceResponseCompletion = (AvgAllPrice?) -> Void
typealias AvgSidoPriceResponseCompletion = (AvgSidoPrice?) -> Void
typealias AvgSigunPriceResponseCompletion = (AvgSigunPrice?) -> Void

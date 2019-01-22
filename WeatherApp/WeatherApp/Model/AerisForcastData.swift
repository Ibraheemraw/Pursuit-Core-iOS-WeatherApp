//
//  AerisForcastData.swift
//  WeatherApp
//
//  Created by Ibraheem rawlinson on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct AerisForcastData: Codable {
    let response: [AllForcastData]
}

struct AllForcastData: Codable {
    let periods: [PeriodsInfoArray]
    let profile: TimeZoneLocationDictionary
    
}
struct PeriodsInfoArray: Codable {
    let timestamp: Int
    let validTime: String
    let maxTempF: String
    let minTempF: String
    let weather: String
    //
    let weatherPrimary: String
    let icon: String
    let sunrise: Int
    let sunset: Int
}
struct TimeZoneLocationDictionary: Codable {
    let tz: String
    
}

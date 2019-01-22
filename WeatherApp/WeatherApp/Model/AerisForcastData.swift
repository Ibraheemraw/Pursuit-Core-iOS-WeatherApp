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
    
}
struct PeriodsInfoArray: Codable {
    let timestamp: Int
    let validTime: String
    var dateFormattedString: String{
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = validTime
        if let date = isoDateFormatter.date(from: validTime){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-dd-MM"
            
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    let maxTempF: Int
    let minTempF: Int
    let weather: String
    //
    let weatherPrimary: String
    let icon: String
    let sunrise: Int
    let sunset: Int
}


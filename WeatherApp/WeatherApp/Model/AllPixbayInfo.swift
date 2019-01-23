//
//  AllPixbayInfo.swift
//  WeatherApp
//
//  Created by Ibraheem rawlinson on 1/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllPixbayInfo: Codable {
    let hits: [AllHitsDataArr]
}

struct AllHitsDataArr: Codable {
    let largeImageURL: String
}

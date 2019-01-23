//
//  PixbayApiClient.swift
//  WeatherApp
//
//  Created by Ibraheem rawlinson on 1/23/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
//zipcodeEntry: String, callBack: @escaping (AppError?, AerisForcastData?) -> Void
struct PixbayApiClient {
    static func searchCityImages(nameOfCity: String, callback: @escaping (AppError?, AllPixbayInfo?)->Void){
        let pixbayEndpointURLString = "https://pixabay.com/api/?key=\(APIKey.pixbayKey)&q=\(nameOfCity)"
        guard let url = URL.init(string: pixbayEndpointURLString) else {
            callback(AppError.badURL(pixbayEndpointURLString), nil)
            return
        }
        let request = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
        callback(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    callback(AppError.badStatusCode("\(statusCode)"), nil)
                    return
            }
            if let data = data {
                do {
                    let pictureData = try JSONDecoder().decode(AllPixbayInfo.self, from: data)
                    callback(nil, pictureData)
                } catch {
    callback(AppError.jsonDecodingError(error), nil)
                }
            }
        }.resume()
    }
    private init() {}
}

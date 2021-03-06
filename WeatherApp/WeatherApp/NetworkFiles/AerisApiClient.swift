//
//  AerisApiClient.swift
//  WeatherApp
//
//  Created by Ibraheem rawlinson on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct AerisApiClient {
    static func searchWeatherForcast(zipcodeEntry: String, callBack: @escaping (AppError?, AerisForcastData?) -> Void){
        let endpointURLString = "https://api.aerisapi.com/forecasts/\(zipcodeEntry)?client_id=\(APIKey.clientId)&client_secret=\(APIKey.clientKey)"
        guard let url = URL(string: endpointURLString) else {
            callBack(AppError.badURL(endpointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                callBack(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    callBack(AppError.badStatusCode("\(statusCode)"), nil)
                    return
            }
            if let data = data {
                do {
                   let weatherData = try JSONDecoder().decode(AerisForcastData.self, from: data)
                    callBack(nil, weatherData)
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
        }.resume()
    }
    private init() {}
}

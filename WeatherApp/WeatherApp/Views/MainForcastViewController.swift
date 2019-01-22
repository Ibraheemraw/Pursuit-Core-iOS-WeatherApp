//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alex Paul on 1/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainForcastViewController: UIViewController {
    @IBOutlet weak var titleLabelObj: UILabel!
    @IBOutlet weak var userInputTxtFieldObj: UITextField!
    @IBOutlet weak var zipCodeTitleLabelObj: UILabel!
    @IBOutlet weak var weakForcastCollectionViewObj: UICollectionView!
    var forcastReport = [PeriodsInfoArray]()
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        gatherWeatherForcastData()
  }
    func gatherWeatherForcastData(){
//        guard let encodedSearchTerm = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
//            print("percent encoding failed")
//            return
//        }
        let input = "10009"
        AerisApiClient.searchWeatherForcast(ZipCodeInPut: input) { (appError, onlineWeatherData) in
            if let appError = appError {
                print("error message states: \(appError.errorMessage())")
            }
            if let onlineWeatherData = onlineWeatherData {
                print(" at this zip code 10009 we have \(onlineWeatherData.count) counts of data")
            }
        }
    }
}


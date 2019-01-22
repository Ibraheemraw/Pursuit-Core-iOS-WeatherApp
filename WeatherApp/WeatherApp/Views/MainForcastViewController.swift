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
    var defaultZipcode = "10009"
    var forcastReport = [PeriodsInfoArray](){
        didSet{
            DispatchQueue.main.async {
                self.weakForcastCollectionViewObj.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        userInputTxtFieldObj.delegate = self
        weakForcastCollectionViewObj.dataSource = self
        gatherWeatherForcastData(zipcodeEntry: "10009")
//        dump(self.forcastReport)
  }
    func gatherWeatherForcastData(zipcodeEntry: String){
        AerisApiClient.searchWeatherForcast(zipcodeEntry: zipcodeEntry) { (appError, onlineWeatherData) in
            if let appError = appError {
                print("error message states: \(appError.errorMessage())")
            }
            if let onlineWeatherData = onlineWeatherData {
//                print(" at this zip code \(zipcodeEntry) we have \(onlineWeatherData.count) counts of data")
                self.forcastReport = onlineWeatherData.response[0].periods
//                dump(self.forcastReport)

            }
        }
    }
}

extension MainForcastViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        if var txtEntryFromUser = [textField].first?.text{
            if txtEntryFromUser == "" {
                txtEntryFromUser = defaultZipcode
            }
            gatherWeatherForcastData(zipcodeEntry: userInputTxtFieldObj.text ?? "Error")
            UserDefaults.standard.set(txtEntryFromUser, forKey: txtEntryFromUser)
            return true
        } else {
            print("issue with user entering text into the text field")
            return false
        }
    }
}

extension MainForcastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return forcastReport.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCellID", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        let settingWeatherData = forcastReport[indexPath.row]
        cell.dateLabelObj.text = settingWeatherData.dateFormattedString
        cell.highTemperatureReadingLabelObj.text = "\(settingWeatherData.maxTempF) °F"
        cell.lowTemperatureReadingLabelObj.text = "\(settingWeatherData.minTempF) °F"
        cell.forcastImageObj.image = UIImage.init(named: settingWeatherData.images)
        return cell
    }
    
    
}

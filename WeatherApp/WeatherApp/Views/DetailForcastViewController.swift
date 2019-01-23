//
//  DetailForcastViewController.swift
//  WeatherApp
//
//  Created by Ibraheem rawlinson on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailForcastViewController: UIViewController {
    @IBOutlet weak var detailTitleLabelObj: UILabel!
    @IBOutlet weak var forcastImageObj: UIImageView!
    @IBOutlet weak var forcastDescriptionLabel: UILabel!
    @IBOutlet weak var detailHighTmpLabelObj: UILabel!
    @IBOutlet weak var detailLowTmpLabelObj: UILabel!
    @IBOutlet weak var SunriseTimeStampLabelObj: UILabel!
    @IBOutlet weak var sunsetTimeStampLabelObj: UILabel!
    @IBOutlet weak var windSpeedLabelObj: UILabel!
    @IBOutlet weak var inchesOfPercipitationLabelObj: UILabel!
    var expectingForecastObj: PeriodsInfoArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailForecastUI()
        setUpImage()
    }
    func setupDetailForecastUI() {
      detailTitleLabelObj.text = "Sample"
     forcastDescriptionLabel.text = "\(expectingForecastObj.weather)"
    // image
        detailHighTmpLabelObj.text = "High Temperature: 🌡\(expectingForecastObj.maxTempF)°F"
        detailLowTmpLabelObj.text = "Low Temperature: 🌡\(expectingForecastObj.minTempF)°F"
        SunriseTimeStampLabelObj.text = "Sunrise: 🌅 \(expectingForecastObj.sunriseDateFormattedString)"
        sunsetTimeStampLabelObj.text = "Sunset: 🌇 \(expectingForecastObj.sunsetDateFormattedString)"
        windSpeedLabelObj.text = "WindSpeed: 🌬 \(expectingForecastObj.windSpeedMPH) MPH" //works
        inchesOfPercipitationLabelObj.text = "Inches Of Percipitation: 💦  \(expectingForecastObj.precipIN)" //works
        
    }
    
    func setUpImage(){
        
    }
    
    
    
}

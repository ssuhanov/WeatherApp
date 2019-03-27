//
//  CityDetailView.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 3/27/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer

class CityDetailView: NibLoadableView {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    func configure(city: City?) {
        city.map { city in
            self.temperatureLabel.text = "\(city.temperature)°С"
            self.weatherImageView.image = UIImage(named: city.weatherIconName)
            city.pressure.map { self.pressureLabel.text = "\($0) hPa" }
            city.humidity.map { self.humidityLabel.text = "\($0)%" }
            city.windSpeed.map { self.windSpeedLabel.text = "\($0) km/h" }
        }
    }
}

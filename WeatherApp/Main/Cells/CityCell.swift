//
//  CityCell.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/26/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer

class CityCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    func configure(city: City) {
        self.clearFields()
        self.nameLabel.text = city.name
        self.temperatureLabel.text = "\(city.temperature)°С"
        print(city.weather)
        self.weatherImageView.image = UIImage(named: city.weatherIconName)
    }
    
    private func clearFields() {
        self.nameLabel.text = nil
        self.temperatureLabel.text = nil
        self.weatherImageView.image = nil
    }
}

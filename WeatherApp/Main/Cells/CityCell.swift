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
    @IBOutlet weak var cityLabel: UILabel!
    
    func configure(city: City) {
        self.clearFields()
        self.cityLabel.text = city.name
    }
    
    private func clearFields() {
        self.cityLabel.text = nil
    }
}

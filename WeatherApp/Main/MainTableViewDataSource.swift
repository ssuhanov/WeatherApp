//
//  MainTableViewDataSource.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/26/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer

class MainTableViewDataSource: NSObject {
    private var cities: [City] = []
    
    func update(cities: [City]) {
        self.cities = cities
    }
}

extension MainTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCellOfType(CityCell.self) else {
            return UITableViewCell()
        }
        
        let city = self.cities[indexPath.row]
        cell.configure(city: city)
        return cell
    }
}

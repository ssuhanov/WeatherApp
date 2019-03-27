//
//  MainTableViewDelegate.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/26/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer

class MainTableViewDelegate: NSObject {
    weak var view: MainViewController?
    private var cities: [City] = []
    
    func update(cities: [City]) {
        self.cities = cities
    }
}

extension MainTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city = cities[indexPath.row]
        let detailView = CityDetailViewController.storyboardInstance(city: city)
        detailView.map { self.view?.navigationController?.pushViewController($0, animated: true) }
    }
}

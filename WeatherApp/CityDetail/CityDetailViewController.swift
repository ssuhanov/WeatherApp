//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 3/27/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer

class CityDetailViewController: UIViewController {
    @IBOutlet weak var cityDetailView: CityDetailView?
    
    var city: City?
    
    static func storyboardInstance(city: City?) -> CityDetailViewController? {
        let viewController = self.storyboardInstance()
        viewController?.city = city
        return viewController
    }
    
    override func viewDidLoad() {
        self.cityDetailView?.configure(city: self.city)
        self.navigationItem.title = self.city?.name
    }
}

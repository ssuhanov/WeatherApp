//
//  CityNetworkingService.swift
//  CityNetworkingService
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation
import NetworkingService
import CityTransformer

public typealias CitiesCompletion = ([City]?) -> Void

public class CityNetworkingService {
    private var networkingService: WeatherNetworkingService
    
    public init() {
        self.networkingService = WeatherNetworkingService()
    }
    
    public func getCityData(completion: CitiesCompletion?) {
        self.networkingService.getData { (simpleCities) in
            let cities = simpleCities?.compactMap { City(simpleCity: $0) }
            completion?(cities)
        }
    }
}

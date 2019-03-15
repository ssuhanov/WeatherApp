//
//  City.swift
//  CityTransformer
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation
import NetworkingService

public class City {
    public let weather: String
    public let temperature: Int
    public let pressure: Int?
    public let humidity: Int?
    public let windSpeed: Int?
    public let name: String

    public init?(simpleCity: SimpleCity) {
        guard let weather = simpleCity.weather?.first?.main,
            let temperature = simpleCity.main?.temp,
            let name = simpleCity.name else {
                return nil
        }
        
        self.weather = weather
        self.temperature = Int(temperature)
        self.name = name
        
        self.pressure = simpleCity.main?.pressure
        self.humidity = simpleCity.main?.humidity
        self.windSpeed = simpleCity.wind?.speed.map { Int($0) }
    }
}

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
    public let weatherDescription: String
    public let temperature: Double
    public let pressure: Int?
    public let humidity: Int?
    public let windSpeed: Double?
    public let name: String

    public init?(simpleCity: SimpleCity) {
        guard let weatherDescription = simpleCity.weather?.first?.description,
            let temperature = simpleCity.main?.temp,
            let name = simpleCity.name else {
                return nil
        }
        
        self.weatherDescription = weatherDescription
        self.temperature = temperature
        self.name = name
        
        self.pressure = simpleCity.main?.pressure
        self.humidity = simpleCity.main?.humidity
        self.windSpeed = simpleCity.wind?.speed
    }
}

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
    public var weather: String
    public var temperature: Int
    public var pressure: Int?
    public var humidity: Int?
    public var windSpeed: Int?
    public var name: String
    
    public var weatherIconName: String {
        return "\(self.weather)-thin"
    }

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
    
    public init(name: String, weather: String, temperature: Int) {
        self.name = name
        self.weather = weather
        self.temperature = temperature
    }
}

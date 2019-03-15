//
//  SimpleCity.swift
//  NetworkingService
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation

public struct SimpleCity: Decodable {
    public var weather: [SimpleWeather]?
    public var main: SimpleMain?
    public var wind: SimpleWind?
    public var name: String?
    
    public init() { }
}

public struct SimpleWeather: Decodable {
    public var main: String?
    
    public init() { }
}

public struct SimpleMain: Decodable {
    public var temp: Double?
    public var pressure: Int?
    public var humidity: Int?
    
    public init() { }
}

public struct SimpleWind: Decodable {
    public var speed: Double?
    
    public init() { }
}

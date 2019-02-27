//
//  CityTransformerTests.swift
//  CityTransformerTests
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import XCTest
import NetworkingService
@testable import CityTransformer

class CityTransformerTests: XCTestCase {
    var instance: City?
    var correctSimpleCity = SimpleCity()
    var incorrectSimpleCity = SimpleCity()
    
    let correctWeatherDescription = "correct_weather_description"
    let correctTemperature = 56.8
    let correctPressure = 23356
    let correctHumidity = 1234
    let correctWindSpeed = 123.567
    let correctName = "correct_name"

    override func setUp() {
        var weather = SimpleWeather()
        weather.description = self.correctWeatherDescription
        
        var main = SimpleMain()
        main.temp = self.correctTemperature
        main.pressure = self.correctPressure
        main.humidity = self.correctHumidity
        
        var wind = SimpleWind()
        wind.speed = self.correctWindSpeed
        
        self.correctSimpleCity.weather = [weather]
        self.correctSimpleCity.main = main
        self.correctSimpleCity.wind = wind
        self.correctSimpleCity.name = self.correctName
    }
    
    func testCorrectCityInitializing() {
        let result = City(simpleCity: self.correctSimpleCity)
        XCTAssertEqual(result?.weatherDescription, self.correctWeatherDescription, "weather description should be \(self.correctWeatherDescription)")
        XCTAssertEqual(result?.temperature, self.correctTemperature, "temperature should be \(self.correctTemperature)")
        XCTAssertEqual(result?.pressure, self.correctPressure, "pressure should be \(self.correctPressure)")
        XCTAssertEqual(result?.humidity, self.correctHumidity, "humidity should be \(self.correctHumidity)")
        XCTAssertEqual(result?.windSpeed, self.correctWindSpeed, "wind speed should be \(self.correctWindSpeed)")
        XCTAssertEqual(result?.name, self.correctName, "city name should be \(self.correctName)")
    }
    
    func testCorrectCityInitializingOnlyRequiredFields() {
        var main = SimpleMain()
        main.temp = self.correctTemperature
        self.correctSimpleCity.main = main
        self.correctSimpleCity.wind = nil
        
        let result = City(simpleCity: self.correctSimpleCity)
        XCTAssertEqual(result?.weatherDescription, self.correctWeatherDescription, "weather description should be \(self.correctWeatherDescription)")
        XCTAssertEqual(result?.temperature, self.correctTemperature, "temperature should be \(self.correctTemperature)")
        XCTAssertNil(result?.pressure, "pressure should be nil")
        XCTAssertNil(result?.humidity, "humidity should be nil")
        XCTAssertNil(result?.windSpeed, "wind speed should be nil")
        XCTAssertEqual(result?.name, self.correctName, "city name should be \(self.correctName)")
    }
    
    func testIncorrectCityInitializing() {
        let result = City(simpleCity: self.incorrectSimpleCity)
        XCTAssertNil(result, "city from incorrectSimpleCity should be nil")
    }
}

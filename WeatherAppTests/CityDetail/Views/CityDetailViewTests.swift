//
//  CityDetailViewTests.swift
//  WeatherAppTests
//
//  Created by Serge Sukhanov on 3/27/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import XCTest
import CityTransformer
@testable import WeatherApp

class CityDetailViewTests: XCTestCase {
    var instance: CityDetailView!
    var city: City?
    
    let correctCityName = "Dubai"
    let correctCityWeather = "Rain"
    let correctCityTemperature = 100500
    let correctCityPressure = 25000
    let correctCityHumidity = 123456
    let correctCityWindSpeed = 35555
    
    override func setUp() {
        super.setUp()
        self.instance = CityDetailView()
        self.city = City(name: self.correctCityName,
                         weather: self.correctCityWeather,
                         temperature: self.correctCityTemperature)
        self.city?.pressure = self.correctCityPressure
        self.city?.humidity = self.correctCityHumidity
        self.city?.windSpeed = self.correctCityWindSpeed
    }
    
    func testConfigureWithCity() {
        self.instance.configure(city: self.city)
        XCTAssertEqual(self.instance.temperatureLabel.text, "\(self.correctCityTemperature)°С", "temperature text field text should be \(self.correctCityTemperature)°С")
        XCTAssertEqual(self.instance.pressureLabel.text, "\(self.correctCityPressure) hPa", "pressure text field text should be \(self.correctCityPressure) hPa")
        XCTAssertEqual(self.instance.humidityLabel.text, "\(self.correctCityHumidity)%", "humidity text field text should be \(self.correctCityHumidity)%")
        XCTAssertEqual(self.instance.windSpeedLabel.text, "\(self.correctCityWindSpeed) km/h", "wind speed text field text should be \(self.correctCityWindSpeed) km/h")
        XCTAssertEqual(self.instance.weatherImageView.image, UIImage(named: "\(self.correctCityWeather)-thin"), "image should be \(self.correctCityWeather)-thin)")
    }
}

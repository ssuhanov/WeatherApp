//
//  WeatherNetworkingService.swift
//  WeatherAppTests
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation
import Alamofire

public typealias SimpleCitiesCompletion = ([SimpleCity]?) -> Void

private let RequestURL = "https://api.openweathermap.org/data/2.5/group"
private let RequestParameters: Parameters = ["id" : "2643743,6167865,703448,2950158",
                                             "appid" : "a9c5d3933c9d14e8699c682c39f5cb9d",
                                             "units" : "metric"]

public class WeatherNetworkingService {
    public init() { }
    
    public func getData(completion: SimpleCitiesCompletion?) {
        Alamofire.request(RequestURL,
                          method: .get,
                          parameters: RequestParameters).responseJSON { (response) in
                            let transfomedResponse: SimpleResponse? = ResponseTransformer().transform(data: response.data)
                            completion?(transfomedResponse?.list)
        }
    }
}

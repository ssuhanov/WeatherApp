//
//  SimpleResponse.swift
//  NetworkingService
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation

struct SimpleResponse: Decodable {
    var list: [SimpleCity]?
}

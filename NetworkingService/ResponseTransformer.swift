//
//  ResponseTransformer.swift
//  NetworkingService
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import Foundation
import Alamofire

class ResponseTransformer {
    func transform<T: Decodable>(data: Data?) -> T? {
        return data?.decoded()
    }
}

extension Data {
    func decoded<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}

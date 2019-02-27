//
//  UITableView.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/26/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCellType<T: UITableViewCell>(_ type: T.Type) {
        self.register(UINib(nibName: String(describing: type), bundle: nil), forCellReuseIdentifier: String(describing: type))
    }
    
    func dequeueCellOfType<T: UITableViewCell>(_ type: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: String(describing: type)) as? T
    }
}

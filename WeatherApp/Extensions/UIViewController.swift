//
//  UIViewController.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/26/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit

extension UIViewController {
    private static func storyboardInstancePrivate<T: UIViewController>() -> T? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? T
    }
    
    static func storyboardInstance() -> Self? {
        return storyboardInstancePrivate()
    }
}

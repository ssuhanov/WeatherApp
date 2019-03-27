//
//  NibLoadableView.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 3/27/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit

class NibLoadableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func loadFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setup() {
        if let view = self.loadFromNib() {
            view.frame = self.bounds
            view.backgroundColor = .clear
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
    }
}

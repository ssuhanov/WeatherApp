//
//  ViewController.swift
//  WeatherApp
//
//  Created by Serge Sukhanov on 2/24/19.
//  Copyright © 2019 Serge Sukhanov. All rights reserved.
//

import UIKit
import CityTransformer
import CityNetworkingService

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewDataSource: MainTableViewDataSource?
    private var tableViewDelegate: MainTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.navigationItem.title = "Weather App"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CityNetworkingService().getCityData { [weak self] (cities) in
            cities.map { self?.updateDataSource(cities: $0) }
        }
    }
    
    private func updateDataSource(cities: [City]) {
        self.tableViewDataSource?.update(cities: cities)
        self.tableViewDelegate?.update(cities: cities)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        self.tableViewDataSource = MainTableViewDataSource()
        self.tableViewDelegate = MainTableViewDelegate()
        self.tableViewDelegate?.view = self
        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate
        self.tableView.registerCellType(CityCell.self)
    }
}

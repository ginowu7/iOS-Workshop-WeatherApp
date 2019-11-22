//
//  WeatherInterface.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit


protocol WeatherUserInterface: class {
    func configure(viewModel: WeatherViewModel)
}

protocol WeatherPresenterInterface: class, UITableViewDataSource, UITableViewDelegate {
    func didLoad()
    func mapsButtonPressed()
}

protocol WeatherInteractorInput {
    func fetchDarkSky(latitude: Double, longitude: Double)
    func fetchCityState(latitude: Double, longitude: Double)
    func dateString() -> String
}

protocol WeatherInteractorOutput: class {
    func didFetchWeatherData(_ weatherData: WeatherData)
    func didFetchCityState(_ city: String, _ state: String)
}

protocol WeatherWireframeInterface {
    func showMaps()
}

protocol WeatherEventTracking {

}

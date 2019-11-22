//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class WeatherPresenter: NSObject {

    var interactor: WeatherInteractorInput!
    var userInterface: WeatherUserInterface!
    var wireframe: WeatherWireframeInterface!
    var viewModel = WeatherViewModel() {
        didSet {
            userInterface.configure(viewModel: viewModel)
        }
    }
    let latitude = 40.730610
    let longitude = -73.935242


}

extension WeatherPresenter: WeatherInteractorOutput {

    func didFetchWeatherData(_ weatherData: WeatherData) {
        viewModel.weatherData = weatherData
    }

    func didFetchCityState(_ city: String, _ state: String) {
        viewModel.city = city
        viewModel.state = state
    }
}

extension WeatherPresenter: WeatherPresenterInterface {

    func didLoad() {
        interactor.fetchDarkSky(latitude: latitude, longitude: longitude)
        interactor.fetchCityState(latitude: latitude, longitude: longitude)

        viewModel.dateString = interactor.dateString()
    }

    func mapsButtonPressed() {
        wireframe.showMaps()
    }

}

extension WeatherPresenter: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Weather.CodingKeys.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        let forcast = viewModel.weatherData?.daily.days.first
        let row = Weather.CodingKeys.rows[indexPath.row]

        cell.topLabel.text = row.displayTitle
        cell.bottomLabel.text = forcast?.value(codingKeys: row)

        return cell
    }


}

//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

class WeatherInteractor: WeatherInteractorInput {

    weak var output: WeatherInteractorOutput?

    let session = URLSession.shared

    func fetchDarkSky(latitude: Double, longitude: Double) {
        let url = URL(string: "https://api.darksky.net/forecast/4ce974ff337c67b2029030c467d68480/\(latitude),\(longitude)")!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                let json = try! JSONSerialization.jsonObject(with: data!, options: [])
                print(json)

                let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data!)
                self.output?.didFetchWeatherData(weatherData)
            }
        }
        task.resume()
    }

    func fetchCityState(latitude: Double, longitude: Double) {
        let url = URL(string: "https://nominatim.openstreetmap.org/reverse?format=json&lat=\(latitude)&lon=\(longitude)&zoom=18&addressdetails=1")!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data,
                    let mapResponse = try? JSONSerialization.jsonObject(with: data, options: []),
                    let mapHash = mapResponse as? [String: Any],
                    let address = mapHash["address"] as? [String: Any],
                    let city = address["city"] as? String,
                    let state = address["state"] as? String else {
                        return
                }
                self.output?.didFetchCityState(city, state)
            }
        }
        task.resume()
    }
    
}

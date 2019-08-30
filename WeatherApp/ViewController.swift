//
//  ViewController.swift
//  WeatherApp
//
//  Created by Gino Wu on 8/9/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentSkyconContainerView: UIView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var horizontalStackView: UIStackView! {
        didSet {
            horizontalStackView.backgroundColor = .clear
        }
    }
    
    let session = URLSession.shared
    let latitude = 40.730610
    let longitude = -73.935242

    var dateString: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todaysDateLabel.text = "Today's Date"
        todaysDateLabel.textColor = .lightText
        currentDateLabel.text = dateString
        currentDateLabel.textColor = .white
        currentSkyconContainerView.backgroundColor = .clear
        currentDateLabel.font = UIFont.systemFont(ofSize: 45, weight: UIFont.Weight.bold)


        currentSummaryLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        currentSummaryLabel.textColor = .white
        currentSummaryLabel.numberOfLines = 0

        currentTemperatureLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        currentTemperatureLabel.textColor = .white

        cityStateLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        cityStateLabel.textColor = .white

        view.backgroundColor = UIColor(displayP3Red: 20/256.0, green: 27/256.0, blue: 36/256.0, alpha: 1.0)
        fetchDarkSky()
        fetchGeolocation()

    }

    private func fetchDarkSky() {
        let url = URL(string: "https://api.darksky.net/forecast/4ce974ff337c67b2029030c467d68480/\(latitude),\(longitude)")!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                let json = try! JSONSerialization.jsonObject(with: data!, options: [])
                print(json)

                let weatherData = try! JSONDecoder().decode(WeatherData.self, from: data!)
                self.update(weatherData: weatherData)
            }
        }
        task.resume()
    }

    private func fetchGeolocation() {
        let url = URL(string: "https://nominatim.openstreetmap.org/reverse?format=json&lat=\(latitude)&lon=\(longitude)&zoom=18&addressdetails=1")!
        let task = session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data,
                    let mapResponse = try? JSONSerialization.jsonObject(with: data, options: []),
                    let mapHash = mapResponse as? [String: Any],
                    let address = mapHash["address"] as? [String: Any],
                    let city = address["city"] as? String,
                    let state = address["state"] as? String else {
                    self.cityStateLabel.text = "Could not find location"
                    return
                }
                self.cityStateLabel.text = "\(city), \(state)"
            }
        }
        task.resume()
    }

    func update(weatherData: WeatherData) {
        currentSummaryLabel.text = weatherData.currently.summary
        currentTemperatureLabel.text = "\(Int(weatherData.currently.temperature))℉"

        if let icon = weatherData.currently.icon {
            let iconView = SKYIconView(frame: currentSkyconContainerView.bounds)
            iconView.setType = icon
            iconView.setColor = icon.color
            iconView.backgroundColor = .clear
            currentSkyconContainerView.addSubview(iconView)
        }

        for (index, day) in weatherData.daily.days.enumerated() {
            let view: ForcastView = ForcastView.fromNib()
            view.backgroundColor = .clear
            horizontalStackView.addArrangedSubview(view)

            let date = Calendar.current.date(byAdding: .day, value: index, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E"

            if let icon = day.icon {
                view.iconView.setType = icon
                view.iconView.setColor = icon.color
                view.iconView.backgroundColor = .clear
                view.iconView.play()
            }

            view.topLabel.text = "\(Int(day.temperatureHigh))℉"
            view.bottomLabel.text = "\(Int(day.temperatureLow))℉"
            view.headerLabel.text = dateFormatter.string(from: date!)
        }
        


    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

struct WeatherData: Codable {
    let currently: Weather
    let daily: DailyForcast
}

struct DailyForcast: Codable {
    let days: [Forcast]
    let icon: Skycons?
    let summary: String

    enum CodingKeys: String, CodingKey {
        case days = "data"
        case icon, summary
    }
}

struct Forcast: Codable {
    let temperatureHigh: Double
    let temperatureLow: Double
    let icon: Skycons?
}

struct Weather: Codable {
    let cloudCover: Double
    let dewPoint: Double
    let humidity: Double
    let icon: Skycons?
    let ozone: Double
    let precipitationProbability: Double
    let pressure: Double
    let summary: String
    let temperature: Double
    let uvIndex: Int
    let windSpeed: Double

    enum CodingKeys: String, CodingKey {
        case cloudCover, dewPoint, humidity, icon, ozone, pressure, summary, temperature, uvIndex, windSpeed
        case precipitationProbability = "precipProbability"
    }
}


//
//  Weather.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

struct Weather: Codable, BaseWeather {
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

        static var rows: [CodingKeys] {
            return [.summary, .humidity, .precipitationProbability, .uvIndex, .windSpeed, .cloudCover, .dewPoint]
        }

        var displayTitle: String {
            switch self {
            case .summary:
                return "Summary"
            case .humidity:
                return "Humidity"
            case .uvIndex:
                return "UV Index"
            case .windSpeed:
                return "Wind Speed"
            case .precipitationProbability:
                return "Precipitation Probability"
            case .cloudCover:
                return "Cloud Cover"
            case .dewPoint:
                return "Dew Point"
            case .ozone, .icon, .pressure, .temperature:
                return ""
            }
        }


    }
}

protocol BaseWeather {
    var icon: Skycons? { get }
    var summary: String { get }
}


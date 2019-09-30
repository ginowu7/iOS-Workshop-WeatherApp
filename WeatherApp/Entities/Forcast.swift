//
//  Forcast.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

struct Forcast: Codable, BaseWeather {
    let temperatureHigh: Double
    let temperatureLow: Double
    let icon: Skycons?
    let summary: String
    let humidity: Double
    let uvIndex: Int
    let windSpeed: Double
    let precipProbability: Double
    let cloudCover: Double
    let dewPoint: Double

    func value(codingKeys: Weather.CodingKeys) -> String {
        switch codingKeys {
        case .cloudCover:
            return cloudCover.percentage
        case .dewPoint:
            return "\(dewPoint) F"
        case .summary:
            return summary
        case .humidity:
            return humidity.percentage
        case .uvIndex:
            return "\(uvIndex)"
        case .windSpeed:
            return "\(windSpeed) mph"
        case .precipitationProbability:
            return precipProbability.percentage
        case .icon:
            return ""
        case .ozone:
            return ""
        case .pressure:
            return ""
        case .temperature:
            return ""
        }
    }
}


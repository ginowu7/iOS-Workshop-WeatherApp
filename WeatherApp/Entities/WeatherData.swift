//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let currently: Weather
    let daily: DailyForcast
}

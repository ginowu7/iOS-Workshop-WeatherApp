//
//  DailyForcast.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

struct DailyForcast: Codable {
    let days: [Forcast]
    let icon: Skycons?
    let summary: String

    enum CodingKeys: String, CodingKey {
        case days = "data"
        case icon, summary
    }
}

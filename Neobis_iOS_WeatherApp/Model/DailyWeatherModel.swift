//
//  DailyWeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 18/06/2024.
//

import Foundation

struct DailyWeatherModel {
    let date: Date
    let minTemperature: Double
    let maxTemperature: Double
    let conditionId: Int
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "thunderstorm"
        case 300...321:
            return "drizzle"
        case 500...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "atmosphere"
        case 800:
            return "clear"
        case 801...804:
            return "clouds"
        default:
            return "unknown"
        }
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}

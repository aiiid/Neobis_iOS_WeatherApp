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
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.horizon"
        case 801...804:
            return "cloud"
        default:
            return "cloud.moon"
        }
    }
    
    var formattedDate: String {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "d MMMM"
        outputFormatter.timeZone = TimeZone.current
        return outputFormatter.string(from: date)
    }
    
    var formattedMinTemperature: String {
        return String(format: "%.0f°", minTemperature)
    }
}

//
//  WeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import Foundation

struct WeatherModel{
    let conditionId: Int
    let weatherName: String
    let cityName: String
    let temperature: Double
    let wind: Int
    let humidity: Int
    
    
    var temper: String {
        return String(format: "%.1f", temperature)
    }
    
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
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default: return "cloud"
        }
    }
}

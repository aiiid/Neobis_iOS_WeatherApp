//
//  WeatherData.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 18/06/2024.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let cod: String
    let message, cnt: Int
    let list: [WeatherList]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - WeatherList
struct WeatherList: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
    
    var formattedTemperature: String {
        return String(format: "%.0f°", temp)
    }
}

// MARK: - Rain
struct Rain: Codable {
    let threeHour: Double?

    enum CodingKeys: String, CodingKey {
        case threeHour = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

extension Weather {
    var assetName: String {
            switch main.lowercased() {
            case "clouds":
                return "cloudy"
            case "clear":
                return "sunshine"
            case "rain":
                return "rain"
            case "drizzle":
                return "sunCloud"
            case "thunderstorm":
                return "moonCloud"
            case "snow":
                return "moonCloud"
            case "mist", "smoke", "haze", "dust", "fog", "sand", "ash", "squall", "tornado":
                return "sun"
            default:
                return "moonCloud" // A default image name if no match is found
            }
        }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg, gust: Double
}

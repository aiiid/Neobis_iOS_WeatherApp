//
//  WeatherData.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import Foundation

struct WeatherData: Decodable {
    var name: String
    var main: Main
    var wind: Wind
    var weather: [Weather]
}

struct Main: Decodable {
    var temp: Double
    var humidity: Int
}

struct Wind: Decodable {
    var speed: Int
}

struct Weather: Decodable {
    let id: Int
    let main: String
}

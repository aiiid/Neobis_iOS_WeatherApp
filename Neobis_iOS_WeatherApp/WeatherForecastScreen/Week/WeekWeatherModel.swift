//
//  WeekWeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 17/06/2024.
//

import Foundation

struct WeekWeatherModel {
    let day: String
    let icon: String
    let degree: String
    
    static let MockData = [
        WeekWeatherModel(day: "Апр, 27",icon: Constants.weatherIcons.randomElement()!, degree: "16°C"),
        WeekWeatherModel(day: "Апр, 28",icon: Constants.weatherIcons.randomElement()!, degree: "19°C"),
        WeekWeatherModel(day: "Апр, 29",icon: Constants.weatherIcons.randomElement()!, degree: "23°C"),
        WeekWeatherModel(day: "Апр, 30",icon: Constants.weatherIcons.randomElement()!, degree: "21°C"),
        WeekWeatherModel(day: "Май, 1", icon: Constants.weatherIcons.randomElement()!, degree: "22°C"),
        WeekWeatherModel(day: "Май, 2", icon: Constants.weatherIcons.randomElement()!, degree: "23°C"),
        WeekWeatherModel(day: "Май, 3", icon: Constants.weatherIcons.randomElement()!, degree: "25°C")
    ]
}



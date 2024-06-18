//
//  MainViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

class MainViewModel: WeatherManagerDelegate{
    init(){
        weatherManager.delegate = self
    }
    func didUpdateWeather(_ weatherManage: WeatherManager, weather: WeatherData) {
        weatherData = weather
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    var weatherManager = WeatherManager()
     var weatherData: WeatherData?
    
   
    var dayWeatherData: [WeatherList] = []
    var weekWeatherData: [DailyWeatherModel] = []
    
    func fetchWeather(for cityName: String) {
        weatherManager.fetchWeather(cityName: cityName)
        extractDayWeatherData()
        extractWeekWeatherData()
    }
    
    private func extractDayWeatherData() {
        guard let weatherData = weatherData else { return }
        // Filter the list to include data for the next 24 hours (e.g., every 3 hours)
        self.dayWeatherData = weatherData.list.filter { $0.dtTxt.contains("09:00:00") || $0.dtTxt.contains("12:00:00") || $0.dtTxt.contains("15:00:00") || $0.dtTxt.contains("18:00:00") || $0.dtTxt.contains("21:00:00") }
    }
    
    private func extractWeekWeatherData() {
        guard let weatherData = weatherData else { return }
        // Extract a summary for each day (e.g., max and min temperature for the day)
        let groupedByDay = Dictionary(grouping: weatherData.list) { (list) -> String in
            let date = list.dtTxt.split(separator: " ").first!
            return String(date)
        }
        self.weekWeatherData = groupedByDay.map { (key, values) -> DailyWeatherModel in
            let minTemp = values.map { $0.main.tempMin }.min() ?? 0
            let maxTemp = values.map { $0.main.tempMax }.max() ?? 0
            return DailyWeatherModel(date: Date(timeIntervalSince1970: TimeInterval(values.first!.dt)), minTemperature: minTemp, maxTemperature: maxTemp, conditionId: values.first!.weather.first!.id)
        }
    }
}
    

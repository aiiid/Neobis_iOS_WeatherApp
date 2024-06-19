//
//  MainViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

class MainViewModel{
    
//    
    var weatherManager = WeatherManager()
    var weatherData: WeatherData? {
        didSet {
                  updateWeather()
              }
    }
    
   
    var dayWeatherData: [WeatherList] = []
    var weekWeatherData: [DailyWeatherModel] = []
    
    func fetchWeather(for cityName: String) {
        weatherManager.fetchWeather(cityName: cityName)
    }
    
    func updateWeather(){
        extractDayWeatherData()
        extractWeekWeatherData()
    }
    
    private func extractDayWeatherData() {
           guard let weatherData = weatherData else { return }
           weatherData.list.forEach { print($0.dtTxt) }
        
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           let todayDateString = dateFormatter.string(from: Date())
           
           let desiredTimes = ["09:00:00", "12:00:00", "15:00:00", "18:00:00", "21:00:00"]
           let todayData = weatherData.list.filter { listItem in
               listItem.dtTxt.contains(todayDateString) && desiredTimes.contains { listItem.dtTxt.contains($0) }
           }
           
           self.dayWeatherData = Array(todayData.prefix(7))
           
           dayWeatherData.forEach { print($0.dtTxt) }
       }
    
    private func extractWeekWeatherData() {
            guard let weatherData = weatherData else { return }
            // Group data by day and calculate min and max temperatures for each day
            let groupedByDay = Dictionary(grouping: weatherData.list) { (list) -> String in
                let date = list.dtTxt.split(separator: " ").first!
                return String(date)
            }
            self.weekWeatherData = groupedByDay.map { (key, values) -> DailyWeatherModel in
                let minTemp = values.map { $0.main.tempMin }.min() ?? 0
                let maxTemp = values.map { $0.main.tempMax }.max() ?? 0
                return DailyWeatherModel(date: key.toDate()!, minTemperature: minTemp, maxTemperature: maxTemp, conditionId: values.first!.weather.first!.id)
            }.sorted { $0.date < $1.date } // Ensure sorting by date
        }
    
}
    
extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.date(from: self)
    }
}

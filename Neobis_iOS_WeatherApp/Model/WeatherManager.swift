//
//  WeatherManager.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//


import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManage: WeatherManager,weather: WeatherData)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let apiKey = "df827df44c42afcafac84c7c21d9c3eb"
//    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=df827df44c42afcafac84c7c21d9c3eb&units=metric"
    let weatherURL = "https://api.openweathermap.org/data/2.5/forecast?q=London&appid=df827df44c42afcafac84c7c21d9c3eb&cnt=5&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String){
        //1. Create URL
        if let url = URL(string: urlString){
            //2. Create URLSession
            let session = URLSession(configuration: .default)
            //3. Give Session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJson(weatherData: safeData){
                        delegate?.didUpdateWeather(self ,weather: weather)
                    }
                }
            }
            
            //4. Start the task (enter)
            task.resume()
        }
    }
    
    func parseJson(weatherData: Data) -> WeatherData?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
    
            return decodedData
            
        } catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}


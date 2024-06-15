//
//  MainModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//

import Foundation

class MainModel{
    var temperature = "0"
 
    var weatherManager = WeatherManager()
    
 
    
    func displayTemperature() -> String{
        return temperature
    }
}





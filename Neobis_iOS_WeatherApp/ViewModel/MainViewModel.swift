//
//  MainViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

class MainViewModel {

    var onWeatherDataFetched: ((Double) -> Void)?
    var onNavigateToDetail: (() -> Void)?
    var onNavigateToSearch: (() -> Void)?

    func fetchWeather() {
        // Example API call, replace with actual OpenWeather API request
        let temperature = 22.5 // This should come from the API response
        onWeatherDataFetched?(temperature)
    }

    func handleNextScreenButtonTap() {
        onNavigateToDetail?()
    }

    func handleSearchButtonTap() {
        onNavigateToSearch?()
    }
}

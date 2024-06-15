//
//  MainViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

class MainViewModel{
    var weatherManager = WeatherManager()
    
    var onWeatherDataFetched: ((String) -> Void)?
    var onWeatherFetchFailed: ((Error) -> Void)?
    var onNavigateToDetail: (() -> Void)?
    var onNavigateToSearch: (() -> Void)?
    
    func fetchWeather(for cityName: String) {
        weatherManager.fetchWeather(cityName: cityName)
    }

    func handleNextScreenButtonTap() {
        onNavigateToDetail?()
    }

    func handleSearchButtonTap() {
        onNavigateToSearch?()
    }
    
    func configureNavigationBar(navigationItem: UINavigationItem?, navigationController: UINavigationController?) {
        guard let navigationItem = navigationItem, let navigationController = navigationController else { return }
        
        let customNavBarView = NavigationBarConfigurator.createCustomNavigationBar(with: "Astana")
        let rightBarButtonItem = NavigationBarConfigurator.createRightBarButtonItem()
        
        navigationItem.titleView = customNavBarView
        navigationItem.rightBarButtonItem = rightBarButtonItem
            
        navigationController.navigationBar.tintColor = .white
    }
}



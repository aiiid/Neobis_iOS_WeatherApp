//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 12/06/2024.
//

import UIKit

class MainViewController: UIViewController {
    private let mainView = MainView()
    private var viewModel: MainViewModel!
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupViewModel()
        setupTargets()
        setupDelegates()
        setupNavigationBar()
    }
    
    private func setupViewModel() {
        viewModel = MainViewModel()
    }
    
    private func setupTargets(){
        mainView.weatherForecastButton.addTarget(
            self,
            action: #selector(nextScreenButtonTapped),
            for: .touchUpInside
        )
    }
    
    private func setupDelegates() {
        viewModel.weatherManager.delegate = self
    }
    
    private func setupNavigationBar() {
        let customNavBarView = NavigationBarConfigurator.createCustomNavigationBar(with: "Astana")
        let rightBarButtonItem = NavigationBarConfigurator.createRightBarButtonItem()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navBarTitleTapped))
            customNavBarView.addGestureRecognizer(tapGesture)
            customNavBarView.isUserInteractionEnabled = true
        
        navigationItem.titleView = customNavBarView
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func nextScreenButtonTapped(){
        let WeatherForecast = WeatherForecastViewController()
        navigationController?.pushViewController(WeatherForecast, animated: true)
            viewModel.fetchWeather(for: "Astana")
    }
    
    @objc private func navBarTitleTapped() {
        let SearchScreen = SearchViewController()
        navigationController?.pushViewController(SearchScreen, animated: true)
    }
}

extension MainViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData) {
        let weatherDetails = self.mainView.weatherCardView
        viewModel.weatherData = weather
        DispatchQueue.main.async {
            weatherDetails.set(weather: weather)
            print(weather)
            print(self.viewModel.dayWeatherData)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

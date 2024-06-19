//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 12/06/2024.
//

import UIKit

class MainViewController: UIViewController {
     let mainView = MainView()
     var viewModel: MainViewModel!
    
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
        viewModel.fetchWeather(for: "Astana")
        viewModel.updateWeather()
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customNavBarView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func nextScreenButtonTapped(){
        let WeatherForecast = WeatherForecastViewController()
        WeatherForecast.viewModel = viewModel
        navigationController?.pushViewController(WeatherForecast, animated: true)
        
    }
    
    @objc private func navBarTitleTapped() {
        let SearchScreen = SearchViewController()
        SearchScreen.viewModel = viewModel
        navigationController?.pushViewController(SearchScreen, animated: true)
    }
}

extension MainViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData) {
        let weatherDetails = self.mainView.weatherCardView
        viewModel.weatherData = weather
        DispatchQueue.main.async {
            weatherDetails.set(weather: weather)
            self.viewModel.updateWeather()
            NavigationBarConfigurator.updateTitle(weather.city.name)
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

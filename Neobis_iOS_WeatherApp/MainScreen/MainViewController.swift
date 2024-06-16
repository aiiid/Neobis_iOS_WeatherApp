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
        setupNavigation()
        setupTargets()
        setupDelegates()
    }
    
    private func setupViewModel() {
        viewModel = MainViewModel()
        viewModel.configureNavigationBar(
            navigationItem: navigationItem,
            navigationController: navigationController
        )
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
    
    private func setupNavigation() {
        viewModel.onNavigateToDetail = { [weak self] in
            let detailViewController = WeatherForecastViewController()
            self?.navigationController?.pushViewController(detailViewController, animated: true)
        }
        
        viewModel.onNavigateToSearch = { [weak self] in
            let searchViewController = SearchViewController()
            self?.navigationController?.pushViewController(searchViewController, animated: true)
        }
    }

    @objc private func nextScreenButtonTapped(){
            viewModel.handleNextScreenButtonTap()
            viewModel.fetchWeather(for: "Astana")
    }
    
    @objc private func searchButtonTapped() {
        viewModel.handleSearchButtonTap()
    }
}

extension MainViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManage: WeatherManager, weather: WeatherIconModel) {
        let weatherDetails = self.mainView.weatherCardView
        DispatchQueue.main.async {
            weatherDetails.set(weather: weather)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

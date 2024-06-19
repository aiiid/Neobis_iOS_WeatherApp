//
//  SearchViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

import UIKit

class SearchViewController: UIViewController {
    private let searchView = SearchView()
    var weatherManager = WeatherManager()
    var viewModel: MainViewModel!
    
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        setupDelegates()
        searchView.searchTextField.delegate = self
        weatherManager.delegate = self
        searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        if viewModel.weatherData == nil {
                    viewModel.fetchWeather(for: "Astana")
                }
    }
    
//    private func setupDelegates() {
//        contentView.dayForecastCollectionView.dataSource = self
//        contentView.dayForecastCollectionView.delegate = self
//    }
    
    @objc private func searchButtonTapped() {
        searchView.searchTextField.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchView.searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "Search"
            return true
        } else {
            textField.placeholder = "Write a city"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchView.searchTextField.text {
            viewModel.fetchWeather(for: city)
        }
        print("should search")
        searchView.searchTextField.text = ""
    }
}

// MARK: - WeatherManagerDelegate
extension SearchViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManage: WeatherManager, weather: WeatherData) {
        DispatchQueue.main.async {
            print("City: \(weather.city.name), Temperature: \(weather.list[0].main.temp)")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

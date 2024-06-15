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
        setupActions()
        setupNavigation()
        configureNavigationBar()
    }

    private func setupViewModel() {
        viewModel = MainViewModel()
        viewModel.onWeatherDataFetched = { [weak self] temperature in
            self?.mainView.temperatureLabel.text = "\(temperature) °C"
        }
        viewModel.fetchWeather()
    }

    private func setupActions() {
        mainView.nextScreenButton.addTarget(self, action: #selector(nextScreenButtonTapped), for: .touchUpInside)
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }

    private func setupNavigation() {
        viewModel.onNavigateToDetail = { [weak self] in
            let detailViewController = DetailViewController()
            self?.navigationController?.pushViewController(detailViewController, animated: true)
            print("should be covered")
        }

        viewModel.onNavigateToSearch = { [weak self] in
            let searchViewController = SearchViewController()
            self?.navigationController?.pushViewController(searchViewController, animated: true)
        }
    }

    @objc private func nextScreenButtonTapped() {
        print("next screen tapped")
        viewModel.handleNextScreenButtonTap()
    }

    @objc private func searchButtonTapped() {
        viewModel.handleSearchButtonTap()
    }
    
    private func configureNavigationBar() {
        // Left icon
        let leftIcon = UIButton(type: .system)
        leftIcon.setImage(UIImage(named: "mapPin.png"), for: .normal)
        leftIcon.tintColor = .white
        
        // Title button
        let titleButton = UIButton(type: .system)
        titleButton.setTitle("Astana", for: .normal)
        
        // Smaller chevron down icon
        let chevronIcon = UIImageView()
        chevronIcon.image = UIImage(systemName: "chevron.down")
        chevronIcon.tintColor = .white
        chevronIcon.contentMode = .scaleAspectFit
        
        titleButton.tintColor = .white
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        // Stack view to hold the left icon and title button
        let stackView = UIStackView(arrangedSubviews: [leftIcon, titleButton, chevronIcon])
        stackView.axis = .horizontal
        stackView.spacing = 16
        
        // Container view for the stack view
        let containerView = UIView()
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let leftBarButtonItem = UIBarButtonItem(customView: containerView)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // Right icon
        let rightIcon = UIBarButtonItem(
            image: UIImage(named: "notification.png"),
            style: .plain,
            target: self,
            action: nil
        )
        rightIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightIcon
        
        // Back button settings
        navigationItem.backButtonTitle = "Назад"
        
        // Change the navigation bar's tint color to white
        navigationController?.navigationBar.tintColor = .white
    }
}

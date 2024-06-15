//
//  MainView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit
import SnapKit

class MainView: UIView {
    var weatherWindState: WeatherStateView
    var weatherHumidState: WeatherStateView
    var weatherCardView = WeatherCardView()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "City Name"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
//    let weatherCardView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        view.layer.cornerRadius = 10
//        return view
//    }()
//    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "-- °C"
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Today, 12 September"
        label.textColor = .white
        return label
    }()
    
    let weatherDescription: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .white
        return label
    }()
    
    let nextScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        
        self.weatherWindState = WeatherStateView(for: .wind, with: "22 km/h")
        self.weatherHumidState = WeatherStateView(for: .humid, with: "60 %")

        super.init(frame: frame)
        setupUI()
        setupBackground()
    }
    
    required init?(coder: NSCoder) {
        
        self.weatherWindState = WeatherStateView(for: .wind, with: "22 km/h")
        self.weatherHumidState = WeatherStateView(for: .humid, with: "60 %")
        
        super.init(coder: coder)
        setupUI()
        setupBackground()
    }
    
    private func setupUI() {
        
        addSubview(cityNameLabel)
        addSubview(weatherCardView)
        addSubview(nextScreenButton)
        addSubview(searchButton)
        
        weatherCardView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        nextScreenButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(nextScreenButton.snp.top).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    private func setupBackground() {
        gradientLayer.colors = [UIColor(hex: "#47BFDF").cgColor, UIColor(hex: "#4A91FF").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
        
        
        let line1 = UIImageView(image: UIImage(named: "line1.png"))
        let line2 = UIImageView(image: UIImage(named: "line2.png"))
        
        addSubview(line1)
        addSubview(line2)
        
        line1.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        line2.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(110)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}

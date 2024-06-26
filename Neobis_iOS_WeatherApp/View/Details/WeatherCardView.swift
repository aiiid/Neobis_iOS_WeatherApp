//
//  WeatherCardView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 14/06/2024.
//

import UIKit
import SnapKit

class WeatherCardView: UIView {
    var weatherWindState: WeatherStateView = WeatherStateView(for: .wind, with: "22 km/h")
    var weatherHumidState: WeatherStateView = WeatherStateView(for: .humid, with: "60 %")
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "-- °C"
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "18 september"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Cloudy"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func set(weather: WeatherData) {
        dateLabel.text = weather.list[0].dtTxt.toFormattedDay()
        weatherWindState.stateDetail.text = "\(weather.list[0].wind.speed) km/h"
        weatherHumidState.stateDetail.text = "\(weather.list[0].main.humidity)%"
        temperatureLabel.text = "\(weather.list[0].main.temp) °C"
        descriptionLabel.text = "\(weather.list[0].weather[0].main)"
    }
    
    
    private func setupUI() {
        addSubview(cardView)
        cardView.addSubview(stackView)
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(weatherWindState)
        stackView.addArrangedSubview(weatherHumidState)
        
        cardView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.width.equalTo(353)
            make.height.equalTo(335)
        }
    
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        
        weatherWindState.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        weatherHumidState.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
    }
}


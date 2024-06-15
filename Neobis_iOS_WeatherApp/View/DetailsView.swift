//
//  DetailsView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 15/06/2024.
//


import UIKit
import SnapKit

class DetailsView: UIView {
    var weatherWindState: WeatherStateView
    var weatherHumidState: WeatherStateView
    var weatherCardView = WeatherCardView()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "City Name"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
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
    
    let weatherForecastButton = ButtonWithIcon(
        backgroundColor: .white,
        title: "Weather forecast",
        icon: "chevron.up"
    )
    
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
        addSubview(weatherForecastButton)
        
        weatherCardView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        weatherForecastButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
            make.centerX.equalToSuperview()
            make.height.equalTo(64)
            make.width.equalTo(220)
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

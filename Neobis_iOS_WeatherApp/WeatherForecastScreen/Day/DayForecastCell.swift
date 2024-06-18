//
//  DayForecastCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 16/06/2024.
//

import UIKit
import SnapKit

class DayForecastCell: UICollectionViewCell {
    
    static let cellIdentifier = "DayForecastCell"
    
//    var cellData: DayWeatherModel? {
//        didSet {
//            guard let cellData = cellData else { return }
//            weatherIcon.image = UIImage(named: cellData.icon)
//            degreeLabel.text = cellData.degree
//            timeLabel.text = cellData.time
//        }
//    }

    private lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        verticalStackView.addArrangedSubview(degreeLabel)
        verticalStackView.addArrangedSubview(weatherIcon)
        verticalStackView.addArrangedSubview(timeLabel)
        
        addSubview(verticalStackView)
        
        weatherIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func set(degree: String, icon: String, time: String ) {
        weatherIcon.image = UIImage(named: icon)
        degreeLabel.text = degree
        timeLabel.text = time
    }
}

extension DayForecastCell {
    static let mockData = [
        DayWeatherModel(degree: "29°C", icon: Constants.weatherIcons.randomElement()!, time: "15.00"),
        DayWeatherModel(degree: "26°C", icon: Constants.weatherIcons.randomElement()!, time: "16.00"),
        DayWeatherModel(degree: "24°C", icon: Constants.weatherIcons.randomElement()!, time: "17.00"),
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "18.00"),
        DayWeatherModel(degree: "22°C", icon: Constants.weatherIcons.randomElement()!, time: "19.00"),
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00"),
        
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00"),
        
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00"),
        
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00"),
        
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00"),
        
        DayWeatherModel(degree: "23°C", icon: Constants.weatherIcons.randomElement()!, time: "20.00"),
        DayWeatherModel(degree: "25°C", icon: Constants.weatherIcons.randomElement()!, time: "21.00")
    ]

}

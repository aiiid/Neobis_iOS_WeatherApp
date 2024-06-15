//
//  DayWeatherDetailsView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 14/06/2024.
//


import UIKit
import SnapKit

enum WeatherIcon: String {
    case cloudy = "cloudy.png"
    case moonCloud = "moonCloud.png"
    case rain = "rain.png"
    case sunCloud = "sunCloud.png"
    case sunshine = "sunshine.png"
    
    var iconName: String {
        return self.rawValue
    }
}

enum weatherState {
    case humid
    case wind
}

class WeatherStateView: UIView {
    
    var stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    var stateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let stateDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        return label
    }()
   
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let divider: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .white
        return label
    }()
    
    init(for info: weatherState, with detail: String) {
        super.init(frame: .zero)
        configureUI(for: info, with: detail)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(for info: weatherState, with detail: String) {
        switch info{
        case .humid:
            stateLabel.text = "Hum"
            stateIcon = UIImageView(image: UIImage(systemName: "drop"))
        case .wind:
            stateLabel.text = "Wind"
            stateIcon = UIImageView(image: UIImage(systemName: "wind"))
        }
    
        stateDetail.text = detail
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(stateIcon)
        stackView.addArrangedSubview(stateLabel)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(stateDetail)
        
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

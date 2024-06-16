//
//  WeekForecastCell.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 17/06/2024.
//


import UIKit

class WeekForecastCell: UICollectionViewCell {
    
    static let cellIdentifier = "WeekForecastCell"
    
    var cellData: WeekWeatherModel? {
        didSet {
            guard let cellData = cellData else { return }
            weatherIcon.image = UIImage(named: cellData.icon)
            degreeLabel.text = cellData.degree
            dayLabel.text = cellData.day
        }
    }
    
    private var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private var degreeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private var dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let horizontalStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.distribution = .equalSpacing
            return stackView
        }()
        
        horizontalStackView.addArrangedSubview(dayLabel)
        horizontalStackView.addArrangedSubview(weatherIcon)
        horizontalStackView.addArrangedSubview(degreeLabel)
        
        addSubview(horizontalStackView)
        
        weatherIcon.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(45)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//
//  WeatherHeaderView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 18/06/2024.
//

import UIKit
enum weatherForecast {
    case day
    case week
}

class WeatherHeaderView: UICollectionReusableView {
    static let headerIdentifier = "WeatherHeaderView"
    
    private var leftLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var rightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "This week"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private var iconImage: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "calendar"))
        image.tintColor = .white
        return image
    }()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(for forecast: weatherForecast = .day, with title: String, date: String = "Sep, 3") {
        addSubview(leftLabel)
        leftLabel.text = title
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        switch forecast {
        case .day:
            addSubview(rightLabel)
            rightLabel.text = date
            rightLabel.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
            }
        case .week:
            addSubview(iconImage)
            iconImage.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.width.height.equalTo(32)
            }
        }
    }
}


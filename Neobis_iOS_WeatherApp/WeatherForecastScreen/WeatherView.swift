//
//  WeatherView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 18/06/2024.
//

import UIKit
import SnapKit

class WeatherView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    lazy var dayForecastCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createCompositionalLayout()
        )
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(
            DayForecastCell.self,
            forCellWithReuseIdentifier: DayForecastCell.cellIdentifier
        )
        collectionView.register(
            WeekForecastCell.self,
            forCellWithReuseIdentifier: WeekForecastCell.cellIdentifier
        )
        collectionView.register(
            WeatherHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: WeatherHeaderView.headerIdentifier
        )
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBackground()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(dayForecastCollectionView)
        
        dayForecastCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(safeAreaLayoutGuide)
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
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.dayForecastSection()
            case 1:
                return AppLayouts.shared.weekForecastSection()
            default:
                return AppLayouts.shared.dayForecastSection()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}


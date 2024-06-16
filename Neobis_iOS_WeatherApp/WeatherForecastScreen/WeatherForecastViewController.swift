//
//  DetailViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 13/06/2024.
//

import UIKit

class WeatherForecastViewController: UIViewController {

    lazy var dayForecastCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout())
        collectionView.register(
            DayForecastCell.self,
            forCellWithReuseIdentifier: DayForecastCell.cellIdentifier
        )
        collectionView.register(
            WeekForecastCell.self,
            forCellWithReuseIdentifier: WeekForecastCell.cellIdentifier
        )
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
//    lazy var weekForecastCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(
//            frame: .zero,
//            collectionViewLayout: UICollectionViewLayout())
//        collectionView.register(
//            WeekForecastCell.self,
//            forCellWithReuseIdentifier: WeekForecastCell.cellIdentifier
//        )
//        collectionView.backgroundColor = .clear
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        return collectionView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        configureUI()
    }
    
    private func configureUI() {
        configureLayout()
        
        view.addSubview(dayForecastCollectionView)
        
        dayForecastCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    private func configureLayout() {
//        let dayForecastlayout = UICollectionViewCompositionalLayout(section: AppLayouts.shared.dayForecastSection())
//        dayForecastlayout.configuration.scrollDirection = .horizontal
//        dayForecastlayout.collectionView?.isScrollEnabled = true
//        dayForecastCollectionView.setCollectionViewLayout(dayForecastlayout, animated: true)
//        
//        let weekForecastLayout =  UICollectionViewCompositionalLayout(section: AppLayouts.shared.weekForecastSection())
//        dayForecastlayout.configuration.scrollDirection = .vertical
//        dayForecastlayout.collectionView?.isScrollEnabled = true
//        dayForecastCollectionView.setCollectionViewLayout(weekForecastLayout, animated: true)
      
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.dayForecastSection()
            case 1:
                return AppLayouts.shared.weekForecastSection()
            default:
                return AppLayouts.shared.dayForecastSection()
            }
        }
        dayForecastCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    
    private func configureNavigationBar() {
        let rightIcon = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: nil
        )
        rightIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightIcon
    }

}

extension WeatherForecastViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DayForecastCell.mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DayForecastCell.cellIdentifier,
                for: indexPath
            ) as? DayForecastCell else {
                return UICollectionViewCell()
            }
            cell.cellData = DayForecastCell.mockData[indexPath.row]
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WeekForecastCell.cellIdentifier,
                for: indexPath
            ) as? WeekForecastCell else {
                return UICollectionViewCell()
            }
            cell.cellData = WeekWeatherModel.MockData[indexPath.row]
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

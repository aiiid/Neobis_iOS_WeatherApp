import UIKit

class WeatherForecastViewController: UIViewController {
    private let contentView = WeatherView()
    var viewModel: MainViewModel!
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDataSource()
        setupNavigationBar()
        setupCollectionViewLayout()
        
        if viewModel.weatherData == nil {
            viewModel.fetchWeather(for: "Astana")
        }
    }
    
    private func setupDataSource() {
        contentView.dayForecastCollectionView.dataSource = self
        contentView.dayForecastCollectionView.delegate = self
    }
    
    private func setupNavigationBar() {
        let rightIcon = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: nil
        )
        rightIcon.tintColor = .white
        navigationItem.rightBarButtonItem = rightIcon
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.dayForecastSection()
            case 1:
                return AppLayouts.shared.weekForecastSection()
            default:
                return nil
            }
        }
        
        contentView.dayForecastCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension WeatherForecastViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.dayWeatherData.count
        case 1:
            return viewModel.weekWeatherData.count
        default:
            return 0
        }
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
            let data = viewModel.dayWeatherData[indexPath.row]
            let time = data.dtTxt.toFormattedTime() ?? "00.00"
        
            cell.set(degree: String(data.main.formattedTemperature), icon: data.weather[0].assetName, time: time)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WeekForecastCell.cellIdentifier,
                for: indexPath
            ) as? WeekForecastCell else {
                return UICollectionViewCell()
            }
            let data = viewModel.weekWeatherData[indexPath.row]
            _ = data.date.description
        
            cell.set(degree: data.formattedMinTemperature, icon: data.conditionName, day: data.formattedDate)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: WeatherHeaderView.headerIdentifier,
                for: indexPath
            ) as? WeatherHeaderView else {
                return UICollectionReusableView()
            }
            switch indexPath.section {
            case 0:
                let firstDayWeather = viewModel.dayWeatherData.first?.dtTxt.toFormattedDay() ?? "N/A"
                header.configureHeader(for: .day, with: "Today", date: firstDayWeather)
            case 1:
                header.configureHeader(for: .week, with: "Next Week")
            default:
                break
            }
            return header
        }
        return UICollectionReusableView()
    }
}

extension WeatherForecastViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManage: WeatherManager, weather: WeatherData) {
        DispatchQueue.main.async {
            self.contentView.dayForecastCollectionView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print("error")
    }
}


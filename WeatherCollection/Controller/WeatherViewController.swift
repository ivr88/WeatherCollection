import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherCollectionView = WeatherCollectionView()
    
    private let weatherView = WeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(weatherCollectionView)
        view.addSubview(weatherView)
        weatherView.weatherImageView.image = weatherView.randomImage()
        weatherView.backgroundColor = .black
        weatherView.layer.cornerRadius = 20
    }
}

//MARK: - SetConstraints

extension WeatherViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: 10),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

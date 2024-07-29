import UIKit

class WeatherViewController: UIViewController {
    
    private let weatherModel = WeatherModel()
    private var weatherCollectionView: WeatherCollectionView!
    private let weatherView = WeatherView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
        displayRandomImage()
    }
    
    func updateImageView(with imageName: String) {
                              UIView.transition(with: weatherView,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.weatherView.updateImage(named: imageName)
                              }, completion: nil)
    }
    
    private func setupView() {
        weatherCollectionView = WeatherCollectionView(weatherModel: weatherModel, weatherViewController: self)
        view.backgroundColor = .white
        view.addSubview(weatherCollectionView)
        view.addSubview(weatherView)
        weatherView.backgroundColor = .black
        weatherView.layer.cornerRadius = 20
    }
    
    private func displayRandomImage() {
        if let randomImageName = weatherModel.imageNames.randomElement() {
            updateImageView(with: randomImageName)
        }
    }
}

//MARK: - SetConstraints

extension WeatherViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            weatherCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherCollectionView.heightAnchor.constraint(equalToConstant: (view.frame.width - 20) / 3)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: weatherCollectionView.bottomAnchor, constant: 10),
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

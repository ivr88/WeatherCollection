import UIKit

class WeatherCollectionView: UIView {
    
    let weatherView = WeatherView()
    
    let weather = ["Гроза", "Дождь", "Облачно", "Снег", "Ясно"]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal 
        layout.itemSize = CGSize(width: 120, height: 120)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        setDelegates()
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(collectionView)
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - UICollectionViewDataSource
extension WeatherCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as! WeatherCollectionViewCell
        cell.configure(weatherImage: weather[indexPath.row], weatherText: weather[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension WeatherCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! WeatherCollectionViewCell
        weatherView.weatherImageView.image = selectedCell.weatherImageView.image
        print(indexPath.row)
    }
}

//MARK: - SetConstraints
extension WeatherCollectionView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}

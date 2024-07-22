import UIKit

class WeatherView: UIView {
    
    let weather = ["Гроза", "Дождь", "Облачно", "Снег", "Ясно"]
    
    func randomImage() -> UIImage {
        let unsignedArrayCount = UInt32(weather.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        return UIImage(named: weather[randomNumber])!
    }
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(weatherImageView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-10)
        ])
    }
    
}

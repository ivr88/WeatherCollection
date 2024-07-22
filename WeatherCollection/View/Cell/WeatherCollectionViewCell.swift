import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    static let identifier = "Cell"
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupViews() {
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        addSubview(weatherImageView)
        addSubview(weatherLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(weatherImage: String, weatherText: String) {
        weatherImageView.image = UIImage(named: weatherImage)
        weatherLabel.text = weatherText
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            weatherLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 5)
        ])
    }
}

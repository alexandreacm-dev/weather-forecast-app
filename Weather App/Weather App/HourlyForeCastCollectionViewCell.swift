//
//  HourlyForecastCollectionViewCell.swift
//  Weather App
//
//  Created by Alexandre Marques on 1/22/25.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HourlyForecastCollectionViewCell"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
    
        imageView.image = UIImage.sunImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var hourlyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.textAlignment = .center
        
        return label
        
    }()
    
    private lazy var temperaturyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.textAlignment = .center
        
        return label
        
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            hourlyLabel,
            iconImageView,
            temperaturyLabel
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.whiteColor?.cgColor
        stackView.layer.cornerRadius = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 8,
            leading: 8,
            bottom: 8,
            trailing:8)
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(mainStackView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
    func loadData(hourly: String?, icon: UIImage?, temp: String?){
        hourlyLabel.text = hourly
        temperaturyLabel.text = temp
        iconImageView.image = icon
    }
}

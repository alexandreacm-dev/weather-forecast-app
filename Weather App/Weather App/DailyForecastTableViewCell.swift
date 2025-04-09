//
//  DailyForecastTableViewCell.swift
//  Weather App
//
//  Created by Alexandre Marques on 1/23/25.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    static let identifier = "DailyForecastTableViewCell"
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
//        label.text = "TER"
        
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.whiteColor
//        label.text = "min 20°C"
        
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.whiteColor
//        label.text = "max 29°C"
        
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            weekDayLabel,
            iconImageView,
            minTemperatureLabel,
            maxTemperatureLabel
        ])
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16)
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
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
        contentView.addSubview(stackView)
    }
    
    private func setConstraints(){
        stackView.setConstrantsToParent(contentView)
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
//            iconImageView.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func loadData(weekDay: String?, min: String?, max: String?, icon: UIImage?) {
        weekDayLabel.text = weekDay
        minTemperatureLabel.text = "Min \(min ?? "Min 0°C")"
        maxTemperatureLabel.text = "Max \(max ?? "Max 0°C")"
        iconImageView.image = icon
    }
    
}

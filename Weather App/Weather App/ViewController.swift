//
//  ViewController.swift
//  Weather App
//
//  Created by Alexandre Marques on 11/30/24.
//

import UIKit

//let width = UIScreen.main.bounds.width;
//let height = UIScreen.main.bounds.height;

class ViewController: UIViewController {
    
    let items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        imageView.image = UIImage.bgImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return (
            imageView
        )
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let image = UIImageView(frame: .zero)
        
        image.image = UIImage.sunImage
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        
        view.backgroundColor = UIColor.whiteColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor.primaryColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sao Paulo"
        
        return label
    }()
    
    private lazy var temperaturyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 70, weight: .bold)
        label.textColor = UIColor.primaryColor
        label.textAlignment = .left
        label.text = "25°C"
        
        return label
        
    }()
    
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "Umidade"
        
        return label
        
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "1000mm"
        
        return label
        
    }()
    
    private lazy var humidityStackView: UIStackView =  {
        let stackView = UIStackView(arrangedSubviews: [
            humidityLabel,
            humidityValueLabel
        ])
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView;
    }()
    
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "Vento"
        
        return label
        
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "10km/h"
        
        return label
        
    }()
    
    private lazy var windStackView: UIStackView =  {
        let stackView = UIStackView(arrangedSubviews: [
            windLabel,
            windValueLabel
        ])
        
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView;
    }()
    
    private lazy var defaultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            humidityStackView,
            windStackView
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = UIColor.softGrayColor
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 12,
            leading: 24,
            bottom: 12,
            trailing: 24)
        
        return stackView
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "PREVISÃO POR HORA"
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 12,
            bottom: 0,
            right: 12)
               
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var dailyForecastLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.whiteColor
        label.text = "PROXIMOS DIAS"
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var dailyForecastTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(DailyForecastTableViewCell.self,
                           forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        
        tableView.separatorColor = UIColor.whiteColor
        return tableView
    }()
    
    private let service = Service()
    private var city = City(lat: "-23.6814346", lon: "-46.9249599", name: "São Paulo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        service.fecthData(city: city) { data in
            print(data)
        }
    }
    
    private func setupView(){
        view.backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(defaultStackView)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(hourlyCollectionView)
        view.addSubview(dailyForecastLabel)
        view.addSubview(dailyForecastTableView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperaturyLabel)
        headerView.addSubview(weatherIcon)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            temperaturyLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            temperaturyLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 26),
            
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperaturyLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperaturyLabel.trailingAnchor, constant: 15),
        ])
        
        
        NSLayoutConstraint.activate([
            defaultStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            defaultStackView.widthAnchor.constraint(equalToConstant: 206),
            defaultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: defaultStackView.bottomAnchor, constant: 29),
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
//            hourlyForecastLabel.widthAnchor.constraint(equalToConstant: 318),
            
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 29),
            dailyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            dailyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            
            dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 15),
            dailyForecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dailyForecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dailyForecastTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath)
                
        return cell
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dailyForecastTableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath)
        
        return cell
    }
}

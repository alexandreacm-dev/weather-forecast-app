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

    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
//        imageView.image = UIImage.bgImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return (
            imageView
        )
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let image = UIImageView(frame: .zero)
        
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
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textColor = UIColor.primaryColor
        label.textAlignment = .left
        
        return label
        
    }()
    
    private lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.subTitle
        label.textAlignment = .center
        
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
        label.font = UIFont.semiBoldFont
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
        tableView.delegate = self
        tableView.register(DailyForecastTableViewCell.self,
                           forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
        
        tableView.separatorColor = UIColor.whiteColor
        return tableView
    }()
    
    private lazy var loaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large);
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    private let service = Service()
    private var city = City(lat: "-29.9333", lon: "-51.1833", name: "Canoas")
    private var forecastResponse: ForecastResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    private func fetchData(){
        showLoader()
        
        service.fecthData(city: city) { [weak self] response in
            self?.forecastResponse = response
            
            DispatchQueue.main.async {
                self?.loadData()
            }
        }
    }
    
    private func loadData(){
        cityLabel.text = city.name
        temperaturyLabel.text = "\(forecastResponse?.currentConditions.temp.toCelsius() ?? "0°C")"
        feelsLikeLabel.text = "Sensação térmica \(forecastResponse?.currentConditions.feelslike.toCelsius() ?? "0°C")"
        humidityValueLabel.text = "\(forecastResponse?.currentConditions.humidity.toMillimeters() ?? "0mm")"
        windValueLabel.text = "\(forecastResponse?.currentConditions.windspeed.toKm() ?? "0km/h")"
        weatherIcon.image = UIImage(named: "\(forecastResponse?.currentConditions.icon ?? Icon.clearDay)")
        
        if (forecastResponse?.currentConditions.datetime.isDay()) != nil {
            backgroundView.image =  UIImage.bgDay
        } else {
            backgroundView.image = UIImage.bgNight
        }
        
        hourlyCollectionView.reloadData()
        dailyForecastTableView.reloadData()
        
        hideLoader()
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
        view.addSubview(loaderView)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperaturyLabel)
        headerView.addSubview(feelsLikeLabel)
        headerView.addSubview(weatherIcon)
        loaderView.addSubview(loader)
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
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            temperaturyLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            temperaturyLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 26),
            
            feelsLikeLabel.topAnchor.constraint(equalTo: temperaturyLabel.bottomAnchor, constant: 10),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            feelsLikeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
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
        
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: view.topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loader.centerXAnchor.constraint(equalTo: loaderView.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderView.centerYAnchor)
        ])
    }
    
    private func showLoader() {
        loaderView.isHidden = false
        loader.startAnimating()
    }
    
    private func hideLoader() {
        loaderView.isHidden = true
        loader.stopAnimating()
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastResponse?.days.first?.hours?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as? HourlyForecastCollectionViewCell else { return UICollectionViewCell() }
        
        
        let forecast = forecastResponse?.days.first?.hours?[indexPath.row]
        
        cell.loadData(hourly: forecast?.datetime.formatTime(), icon: UIImage(named: "\(forecast?.icon ?? Icon.clearDay)"), temp: forecast?.temp.toCelsius())
        
        return cell
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return forecastResponse?.days.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dailyForecastTableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell else { return UITableViewCell()}
        
        let forecast = forecastResponse?.days[indexPath.row]
        
        cell.loadData(weekDay: forecast?.datetime.formattDate(), min: forecast?.tempmin?.toCelsius() , max: forecast?.tempmax?.toCelsius(), icon: UIImage(named: "\(forecast?.icon ?? Icon.clearDay)"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

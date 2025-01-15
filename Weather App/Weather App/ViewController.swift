//
//  ViewController.swift
//  Weather App
//
//  Created by Alexandre Marques on 11/30/24.
//

import UIKit

let width = UIScreen.main.bounds.width;
let height = UIScreen.main.bounds.height;

class ViewController: UIViewController {
    
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return (
            view
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad")
        
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        
        setHierarchy()
        
        setConstranits()
        
    }
    
    private func setConstranits(){
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
        ])
    }
    
    private func setHierarchy() {
        view.addSubview(customView)
    }
}


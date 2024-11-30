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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: width / 2, height: height / 2))
        
        label.font = UIFont(name: "Arial", size: 30)
        label.text = "First Application"
        
        self.view.addSubview(label)
    }


}


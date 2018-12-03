//
//  ViewController.swift
//  KDCircularActivityIndicatorExample
//
//  Created by Kauna Mohammed on 03/12/2018.
//  Copyright © 2018 Kauna Mohammed. All rights reserved.
//

import UIKit
import KDCircularActivityIndicator

class ViewController: UIViewController {

    lazy var activityIndicator: KDCircularActivityIndicator = {
        let indicator = KDCircularActivityIndicator()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(activityIndicator)
        activityIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        activityIndicator.colors = [#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)]
        activityIndicator.startAnimating()
        
    }

}


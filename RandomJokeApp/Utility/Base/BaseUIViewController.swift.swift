//
//  BaseUIViewController.swift.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setTheme()
        localization()
    }
    
    // MARK: - Public methods
    
    func localization() {
        
    }
    
    func setTheme() {
        view.backgroundColor = .white
    }
}

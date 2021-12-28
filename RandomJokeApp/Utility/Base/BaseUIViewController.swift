//
//  BaseUIViewController.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import UIKit
import SnapKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTheme()
        localization()
    }
    
    // MARK: - Public methods
    
    func localization() {
        
    }
    
    func setTheme() {
        view.backgroundColor = .white
        
#warning("Fix navigation bar + status bar on iOS 15 with UINavigationBarAppearance()")
        navigationController?.navigationBar.backgroundColor = .clear
    }
}

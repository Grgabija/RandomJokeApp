//
//  BaseUIViewController.swift.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        localization()
    }
    
    // MARK: - Public methods
    
    func localization() {
        
    }
    
    func setTheme() {
        view.backgroundColor = .white
    }
}

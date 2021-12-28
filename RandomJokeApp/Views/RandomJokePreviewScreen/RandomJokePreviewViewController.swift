//
//  RandomJokePreviewViewController.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-27.
//

import UIKit

class RandomJokePreviewViewController: BaseUIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private var labelText: String?
    
    // MARK: - Initializers
    
    init(_ labelText: String) {
        self.labelText = labelText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        label.text = labelText
    }
    
    // MARK: - Parent class functionality
    
    override func setTheme() {
        super.setTheme()
        
        navigationController?.navigationBar.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

// MARK: - Private functionality

private extension RandomJokePreviewViewController {
    func setupViewController() {
        view.addSubview(label)
        
        setConstraints(subview: label)
    }
    
    func setConstraints(subview: UIView) {
        subview.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}

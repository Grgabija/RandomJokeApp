//
//  RandomJokeSelectionViewController.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-20.
//

import UIKit

class RandomJokeSelectionViewController: BaseUIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var randomJokeSelectionTitle: UILabel!
    @IBOutlet private weak var randomJokeSelectionGuidelines: UILabel!
    @IBOutlet private weak var randomChuckNorrisJokeButton: UIButton!
    @IBOutlet private weak var randomDadJokeButton: UIButton!
    
    // MARK: - Constants
    
    private let ButtonFontSize = 16.0
    private let TitleFontSize = 36.0
    private let ButtonCornerRadius = 5.0
    
    // MARK: - ViewModel
    
    lazy var viewModel: RandomJokeSelectionViewModel = {
        let viewModel = RandomJokeSelectionViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    // MARK: - Parent class functionality
    
    override func setTheme() {
        super.setTheme()
        
        randomJokeSelectionTitle.font = .systemFont(ofSize: TitleFontSize, weight: .bold)
        
        randomChuckNorrisJokeButton.titleLabel?.font = .systemFont(ofSize: ButtonFontSize, weight: .bold)
        randomDadJokeButton.titleLabel?.font = .systemFont(ofSize: ButtonFontSize, weight: .bold)
        
        randomChuckNorrisJokeButton.backgroundColor = .systemBlue
        randomDadJokeButton.backgroundColor = .systemBlue
        
        randomChuckNorrisJokeButton.setTitleColor(.white, for: .normal)
        randomDadJokeButton.setTitleColor(.white, for: .normal)
        
        randomChuckNorrisJokeButton.layer.cornerRadius = ButtonCornerRadius
        randomDadJokeButton.layer.cornerRadius = ButtonCornerRadius
    }
    
    override func localization() {
        randomJokeSelectionTitle.text = "landingScreen.label.title".localized
        randomJokeSelectionGuidelines.text = "landingScreen.label.description".localized
        randomChuckNorrisJokeButton.setTitle("landingScreen.button.randomChuckNorrisJokeButtonTitle".localized, for: .normal)
        randomDadJokeButton.setTitle("landingScreen.button.randomDadJokeButtonTitle".localized, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func showRandomChuckNorrisJoke(_ sender: Any) {
        viewModel.didTapChuckNorrisJokeButton()
    }
    
    @IBAction func showRandomDadJoke(_ sender: Any) {
        viewModel.didTapDadJokeButton()
    }
}

// MARK: - Private functionality

private extension RandomJokeSelectionViewController {
    
    func setNavigationBarTitle(_ sender: UIButton, _ randomJokeViewController: RandomJokePreviewViewController) {
        let isSenderRandomDadJokeButton = sender == randomDadJokeButton
        let navigationBarTitle = isSenderRandomDadJokeButton ?
        "navigationBar.navigationItemTitleWhenNavigatingToDadJoke".localized :
        "navigationBar.navigationItemTitleWhenNavigatingToChuckNorrisJoke".localized
        
        randomJokeViewController.navigationItem.title = navigationBarTitle
    }
    
    func navigateToRandomJokeViewController(_ joke: String, sender: UIButton) {
        let randomJokeViewController = RandomJokePreviewViewController(joke)
        
        setNavigationBarTitle(sender, randomJokeViewController)
        navigationController?.pushViewController(randomJokeViewController, animated: true)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "general.error".localized, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "general.ok".localized, style: .cancel))
        
        self.present(alert, animated: true)
    }
}

// MARK: - RandomJokeSelectionViewModelDelegate

extension RandomJokeSelectionViewController: RandomJokeSelectionViewModelDelegate {
    func didResponseSucceededWithChuchNorrisJoke(_ joke: String) {
        navigateToRandomJokeViewController(joke, sender: randomChuckNorrisJokeButton)
    }
    
    func didResponseSucceededWithDadJoke(_ joke: String) {
        navigateToRandomJokeViewController(joke, sender: randomDadJokeButton)
    }
    
    func didErrorOccured(errorMessage: String) {
        showAlert(message: errorMessage)
    }
}

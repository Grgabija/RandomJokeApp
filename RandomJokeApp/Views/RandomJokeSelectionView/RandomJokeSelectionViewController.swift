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
    
    // MARK: - Parent class functionality
    
    override func setTheme() {
        super.setTheme()
        
        randomJokeSelectionTitle.font = UIFont.systemFont(ofSize: TitleFontSize, weight: .bold)
        randomChuckNorrisJokeButton.titleLabel?.font = UIFont.systemFont(ofSize: ButtonFontSize, weight: .bold)
        randomDadJokeButton.titleLabel?.font = UIFont.systemFont(ofSize: ButtonFontSize, weight: .bold)
    }
    
    override func localization() {
        randomJokeSelectionTitle.text = "landingScreen.label.title".localized
        randomJokeSelectionGuidelines.text = "landingScreen.label.description".localized
        randomChuckNorrisJokeButton.titleLabel?.text = "landingScreen.button.randomChuckNorrisJokeButtonTitle".localized
        randomDadJokeButton.titleLabel?.text = "landingScreen.button.randomDadJokeButtonTitle".localized
    }
    
    // MARK: - Actions
    
    @IBAction func showRandomChuckNorrisJoke(_ sender: Any) {
        Networking.sharedInstance.getRandomChuckNorrisJoke()
            .done { json -> Void in
                  print(json)
              }
              .catch { error in
                  print(error.localizedDescription)
              }
#warning("implement navigation to joke preview")
    }
    
    @IBAction func showRandomDadJoke(_ sender: Any) {
        Networking.sharedInstance.getRandomDadJoke()
            .done { json -> Void in
                  print(json)
              }
              .catch { error in
                  print(error.localizedDescription)
              }
#warning("implement navigation to joke preview")
    }
}

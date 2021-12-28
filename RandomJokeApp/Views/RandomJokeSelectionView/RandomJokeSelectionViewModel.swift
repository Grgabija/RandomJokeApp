//
//  RandomJokeSelectionViewModel.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-28.
//

protocol RandomJokeSelectionViewModelDelegate: AnyObject {
    func didResponseSucceededWithChuchNorrisJoke(_ joke: String)
    func didResponseSucceededWithDadJoke(_ joke: String)
    func didErrorOccured(errorMessage: String)
}

class RandomJokeSelectionViewModel {
    weak var delegate: RandomJokeSelectionViewModelDelegate?
    
    private var networkManager = Networking.sharedInstance
    
    // MARK: - Initializer
    
    init (_ networkManager: Networking = Networking.sharedInstance) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public methods
    
    func didTapChuckNorrisJokeButton() {
        networkManager.getRandomChuckNorrisJoke()
            .done { response in
                self.delegate?.didResponseSucceededWithChuchNorrisJoke(response.joke)
            }
            .catch { error in
                self.delegate?.didErrorOccured(errorMessage: error.localizedDescription)
            }
    }
    
    func didTapDadJokeButton() {
        networkManager.getRandomDadJoke()
            .done { response in
                self.delegate?.didResponseSucceededWithDadJoke(response.joke)
            }
            .catch { error in
                self.delegate?.didErrorOccured(errorMessage: error.localizedDescription)
            }
    }
}

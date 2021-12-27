//
//  Networking.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

import Alamofire
import PromiseKit

class Networking {
    
    //MARK: - Network & Singleton
    static let baseChuckNorrisJokesURL = "https://api.chucknorris.io"
    static let baseDadJokesURL = "https://icanhazdadjoke.com"
    
    static let sharedInstance = Networking()
    private init() {}
    
    //MARK: - Constants
    private let ContentType = ["application/json"]
    private let Headers: HTTPHeaders = ["Accept": "application/json"]
    
    
    //MARK: - Requests
    
    func getRandomChuckNorrisJoke() -> Promise<RandomChuckNorrisJokeResponse> {
        return Promise { seal in
            let url = "\(Networking.baseChuckNorrisJokesURL)/jokes/random"
            let responseType = RandomChuckNorrisJokeResponse.self
            
            AF
                .request(url, headers: Headers)
                .validate(statusCode: 200..<300)
                .validate(contentType: self.ContentType)
                .responseDecodable(of: responseType) { response in
                    switch response.result {
                    case .success(let json):
                        seal.fulfill(json)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
    
    func getRandomDadJoke() -> Promise<RandomDadJokeResponse> {
        return Promise { seal in
            let url = Networking.baseDadJokesURL
            let responseType = RandomDadJokeResponse.self
            
            AF
                .request(url, headers: Headers)
                .validate(statusCode: 200..<300)
                .validate(contentType: self.ContentType)
                .responseDecodable(of: responseType) { response in
                    switch response.result {
                    case .success(let json):
                        seal.fulfill(json)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}

//
//  RandomDadJokeResponse.swift
//  RandomJokeApp
//
//  Created by Gabija on 2021-12-21.
//

struct RandomDadJokeResponse: Decodable {
    let jokeId: String
    let joke: String
    
    enum CodingKeys: String, CodingKey {
        case jokeId = "id"
        case joke
    }
}

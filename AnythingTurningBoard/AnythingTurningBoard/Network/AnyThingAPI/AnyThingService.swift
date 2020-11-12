//
//  AnyThingService.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation
import Combine
import UIKit

protocol AnyThingService {
    var apiSession: APIService {get}
    
//    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError>
//    func getPokemon(pokemonURL: String) -> AnyPublisher<Pokemon, APIError>
}

extension AnyThingService {
    
//    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError> {
//        return apiSession.request(with: PokemonEndpoint.pokemonList)
//            .eraseToAnyPublisher()
//    }
    
//    func getPokemon(pokemonURL: String) -> AnyPublisher<Pokemon, APIError> {
//        return apiSession.request(with: PokemonEndpoint.pokemonDetail(pokemonURL))
//            .eraseToAnyPublisher()
//    }
}

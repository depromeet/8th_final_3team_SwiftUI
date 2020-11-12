//
//  AnyThingEndpoint.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation

enum PokemonEndpoint {
//    case pokemonList
//    case pokemonDetail(String)
}

extension PokemonEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
//        case .pokemonList:
//            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
//                else {preconditionFailure("Invalid URL format")}
//            let request = URLRequest(url: url)
//            return request
//        case .pokemonDetail(let pokemonURL):
//
//            guard let url = URL(string: pokemonURL)
//                else {preconditionFailure("Invalid URL format")}
//
//            let request = URLRequest(url: url)
//            return request
        default: break
        }
        
    }
}

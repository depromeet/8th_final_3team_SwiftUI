//
//  MainViewModel.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation
import Combine
import SwiftUI

class MainViewModel: ObservableObject, AnyThingService {
    var apiSession: APIService
//    @Published var model = [PokemonListItem]()
    
    // deinit 될때 자동으로 취소 됨
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getPokemonList() {
//        let cancellable = self.getPokemonList()
//            .sink(receiveCompletion: { result in
//                switch result {
//                case .failure(let error):
//                    print("Handle error: \(error)")
//                case .finished:
//                    break
//                }
//                
//            }) { (pokemon) in
//                self.pokemon = pokemon.results
//        }
//        cancellables.insert(cancellable)
    }
}


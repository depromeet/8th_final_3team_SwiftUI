//
//  SplashView.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/10.
//

import SwiftUI
import UIKit
import Combine

struct SplashView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var viewModel = SplashViewModel()
    
    var latitude: String { return "\(locationManager.location?.coordinate.latitude ?? 0)" }
    var longitude: String { return "\(locationManager.location?.coordinate.longitude ?? 0)" }
    
    var body: some View {
        
        if latitude != "0.0" {
            Image("splash")
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: {
                    print(latitude)
                    print(longitude)
                    
                    /*
                     - 250m 5분
                     - 500m 10분
                     - 1,000m 20분
                     - 1,500m 30분
                     */
                    
                    viewModel.get주변음식점목록(lat: latitude, lng: longitude, radius: 500)
                })
        }
    }
//
//    func get한식(lng: String, lat: String) -> AnyPublisher<Data, Never> {
//        let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&page=1&size=15&sort=accuracy&radius=500&x=\(lng)&y=\(lat)")!
//
//        let request = URLRequest(url: url)
//
//        let cancellable = viewModel.apiSession.request(with: request as! RequestBuilder)
//            .eraseToAnyPublisher()
////
////            self.getPokemon(pokemonURL: pokemonListItem.url)
////            .sink(receiveCompletion: { (result) in
////                print(result)
////            }) { (pokemon) in
////                self.pokemon = pokemon
////                self.getPokemonSprites()
////        }
////        cancellables.insert(cancellable)
//
//
//        /*
//         https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&page=1&size=15&sort=accuracy&radius=500&x=126.9786962993293&y=37.5568321698673"
//         */
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .eraseToAnyPublisher()
//            .map(p)
//    }
    
    func getPokemon() {
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

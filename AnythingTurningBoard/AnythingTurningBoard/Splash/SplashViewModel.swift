//
//  SplashViewModel.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/10.
//

import Foundation
import Combine
import SwiftUI

class SplashViewModel: ObservableObject {
    var apiSession: APIService
    //    @Published var model = [PokemonListItem]()
    
    // deinit 될때 자동으로 취소 됨
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func get주변음식점목록(lat: String, lng: String, radius: Int) {
        let 한식 = self.get한식(lat: lat, lng: lng, radius: radius)
        let 양식 = self.get양식(lat: lat, lng: lng, radius: radius)
        let 중식 = self.get중식(lat: lat, lng: lng, radius: radius)
        let 일식 = self.get일식(lat: lat, lng: lng, radius: radius)
        let 분식 = self.get분식(lat: lat, lng: lng, radius: radius)
        
        let zeps1 = Publishers.Zip3(한식, 양식, 중식)
        let zeps2 = Publishers.Zip(일식, 분식)
        
//        Publishers.Zip(zeps1, zeps2)
//            .sink { (<#Subscribers.Completion<Publishers.Zip3<AnyPublisher<PlaceModel, APIError>, AnyPublisher<PlaceModel, APIError>, AnyPublisher<PlaceModel, APIError>>.Failure>#>) in
//                <#code#>
//            } receiveValue: { (<#(Publishers.Zip3<AnyPublisher<PlaceModel, APIError>, AnyPublisher<PlaceModel, APIError>, AnyPublisher<PlaceModel, APIError>>.Output, Publishers.Zip<AnyPublisher<PlaceModel, APIError>, AnyPublisher<PlaceModel, APIError>>.Output)#>) in
//                <#code#>
//            }

        
        let cancellable = Publishers.Zip(zeps1, zeps2)
            .sink { completion in
                // 화면 이도
                print(completion)
            } receiveValue: { (res1, res2) in
                //FIXME: 왜 같지?
                
                print("1 : \(res1.0.documents?.first?.addressName)")
                print("2 : \(res1.1.documents?.first?.addressName)")
                print("3 : \(res1.2.documents?.first?.addressName)")
                print("4 : \(res2.0.documents?.first?.addressName)")
                print("5 : \(res2.1.documents?.first?.addressName)")
                
                
            }
        cancellables.insert(cancellable)


//            .zip(양식, 중식, 일식, 분식)
//            .handleEvents { (subscription) in
//                print("==== subscription: \(subscription)")
//            } receiveOutput: { (한식목록, 양식목록, 중식목록, 일식목록, 분식목록) in
//                print("\n==== a: \(한식목록)")
//                print("==== b: \(양식목록)")
//                print("==== c: \(중식목록)")
//                print("==== d: \(일식목록)")
//            }
//        let cancellable = self.get한식(lat: lat, lng: lng, radius: radius)
//            .sink(receiveCompletion: { result in
//                switch result {
//                case .failure(let error):
//                    print("Handle error: \(error)")
//                case .finished:
//                    break
//                }
//
//            }) { (m) in
//                print(m.meta?.totalCount)
//                //                self.pokemon = pokemon.results
//            }
//        cancellables.insert(cancellable)
    }
    
    
    private func get한식(lat: String, lng: String, radius: Int) -> AnyPublisher<PlaceModel, APIError> {
        return apiSession.request(with: AnyThingEndpoint.한식목록(lat: lat, lng: lng, radius: radius))
            .eraseToAnyPublisher()
    }
    
    private func get양식(lat: String, lng: String, radius: Int) -> AnyPublisher<PlaceModel, APIError> {
        return apiSession.request(with: AnyThingEndpoint.양식목록(lat: lat, lng: lng, radius: radius))
            .eraseToAnyPublisher()
    }
    
    private func get중식(lat: String, lng: String, radius: Int) -> AnyPublisher<PlaceModel, APIError> {
        return apiSession.request(with: AnyThingEndpoint.중식목록(lat: lat, lng: lng, radius: radius))
            .eraseToAnyPublisher()
    }
    
    private func get일식(lat: String, lng: String, radius: Int) -> AnyPublisher<PlaceModel, APIError> {
        return apiSession.request(with: AnyThingEndpoint.일식목록(lat: lat, lng: lng, radius: radius))
            .eraseToAnyPublisher()
    }
    
    private func get분식(lat: String, lng: String, radius: Int) -> AnyPublisher<PlaceModel, APIError> {
        return apiSession.request(with: AnyThingEndpoint.분식목록(lat: lat, lng: lng, radius: radius))
            .eraseToAnyPublisher()
    }
    
}


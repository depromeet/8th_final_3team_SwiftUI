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
    
    @Published var model: [PlaceModel] = []
    var apiSession: APIService
    // deinit 될때 자동으로 취소 됨
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func get주변음식점목록(lat: String, lng: String, radius: Int, callback: @escaping ([PlaceModel]) -> Void) {
        let 한식 = self.get한식(lat: lat, lng: lng, radius: radius)
        let 양식 = self.get양식(lat: lat, lng: lng, radius: radius)
        let 중식 = self.get중식(lat: lat, lng: lng, radius: radius)
        let 일식 = self.get일식(lat: lat, lng: lng, radius: radius)
        let 분식 = self.get분식(lat: lat, lng: lng, radius: radius)
        let zeps1 = Publishers.Zip3(한식, 양식, 중식)
        let zeps2 = Publishers.Zip(일식, 분식)
        
        let aroundRequest = Publishers.Zip(zeps1, zeps2)
            .sink { [weak self] completion in
                guard let self = self else { return }
                print("completion: ", completion)
                callback(self.model)
            } receiveValue: { (res1, res2) in
                self.model.append(res1.0)
                self.model.append(res1.1)
                self.model.append(res1.2)
                self.model.append(res2.0)
                self.model.append(res2.1)
            }
        cancellables.insert(aroundRequest)
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


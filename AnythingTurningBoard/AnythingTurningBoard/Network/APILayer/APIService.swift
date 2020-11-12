//
//  APIService.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation
import Combine
import UIKit

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError>
}

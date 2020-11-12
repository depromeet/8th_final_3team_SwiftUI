//
//  APIError.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}


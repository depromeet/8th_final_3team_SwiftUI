//
//  AnyThingEndpoint.swift
//  AnythingTurningBoard
//
//  Created by 이규현 on 2020/11/09.
//

import Foundation

enum AnyThingEndpoint {
    case 한식목록(lat:String, lng:String, radius: Int)
    case 양식목록(lat:String, lng:String, radius: Int)
    case 중식목록(lat:String, lng:String, radius: Int)
    case 일식목록(lat:String, lng:String, radius: Int)
    case 분식목록(lat:String, lng:String, radius: Int)
}

extension AnyThingEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .한식목록(let lat, let lng, let radius):
            guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=\("한식".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=1&size=15&sort=accuracy&radius=\(radius)&x=\(lng)&y=\(lat)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            print("한식 request: \(request)")
            request.addValue("KakaoAK d4262128e54ef4660302a63cb3a9994a", forHTTPHeaderField: "Authorization")
            return request
            
        case .양식목록(lat: let lat, lng: let lng, radius: let radius):
            guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=\("양식".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=1&size=15&sort=accuracy&radius=\(radius)&x=\(lng)&y=\(lat)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            print("양식 request: \(request)")
            request.addValue("KakaoAK d4262128e54ef4660302a63cb3a9994a", forHTTPHeaderField: "Authorization")
            return request
            
        case .중식목록(lat: let lat, lng: let lng, radius: let radius):
            guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=\("중식".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=1&size=15&sort=accuracy&radius=\(radius)&x=\(lng)&y=\(lat)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            print("중식 request: \(request)")
            request.addValue("KakaoAK d4262128e54ef4660302a63cb3a9994a", forHTTPHeaderField: "Authorization")
            return request
            
        case .일식목록(lat: let lat, lng: let lng, radius: let radius):
            guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=\("일식".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=1&size=15&sort=accuracy&radius=\(radius)&x=\(lng)&y=\(lat)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            print("일식 request: \(request)")
            request.addValue("KakaoAK d4262128e54ef4660302a63cb3a9994a", forHTTPHeaderField: "Authorization")
            return request
            
        case .분식목록(lat: let lat, lng: let lng, radius: let radius):
            guard let url = URL(string: "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&query=\("분식".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&page=1&size=15&sort=accuracy&x=\(lng)&y=\(lat)&radius=\(radius)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            print("분식 request: \(request)")
            request.addValue("KakaoAK d4262128e54ef4660302a63cb3a9994a", forHTTPHeaderField: "Authorization")
            return request
        }
    }
}

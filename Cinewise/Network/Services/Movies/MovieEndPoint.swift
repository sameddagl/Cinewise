//
//  MovieEndPoint.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

enum MovieEndPoint: HTTPEndpoint {
    case getNowPlaying(page: Int)
    case getTopRated(page: Int)
    case getPopular(page: Int)
    case getUpComing(page: Int)
    
    var path: String {
        switch self {
        case .getNowPlaying:
            return Paths.nowPlaying.rawValue
        case .getTopRated:
            return Paths.topRated.rawValue
        case .getPopular:
            return Paths.popular.rawValue
        case .getUpComing:
            return Paths.upComing.rawValue
        }
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .getNowPlaying(let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: String(page))
            ]
        case .getTopRated(let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: String(page))
            ]
        case .getPopular(let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: String(page))
            ]
        case .getUpComing(let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}

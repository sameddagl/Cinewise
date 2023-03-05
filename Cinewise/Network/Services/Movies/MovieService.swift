//
//  MovieService.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(category: MovieCategories, page: Int, completion: @escaping (Result<MovieResult, NetworkError>) -> Void)
}

final class MovieService: MovieServiceProtocol {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies(category: MovieCategories, page: Int, completion: @escaping (Result<MovieResult, NetworkError>) -> Void) {
        switch category {
        case .nowPlaying:
            service.fetch(endPoint: MovieEndPoint.getNowPlaying(page: page)) { result in
                completion(result)
            }
        case .topRated:
            service.fetch(endPoint: MovieEndPoint.getTopRated(page: page)) { result in
                completion(result)
            }
        case .popular:
            service.fetch(endPoint: MovieEndPoint.getPopular(page: page)) { result in
                completion(result)
            }
        case .upComing:
            service.fetch(endPoint: MovieEndPoint.getUpComing(page: page)) { result in
                completion(result)
            }
        }
    }
}

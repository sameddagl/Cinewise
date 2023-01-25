//
//  MovieService.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(endPoint: MovieEndPoint, completion: @escaping (Result<MovieResult, NetworkError>) -> Void)
}

final class MovieService: MovieServiceProtocol {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies(endPoint: MovieEndPoint, completion: @escaping (Result<MovieResult, NetworkError>) -> Void) {
        service.fetch(endPoint: endPoint) { (result: Result<MovieResult, NetworkError>) in
            completion(result)
        }
    }
}

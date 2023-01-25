//
//  AppContainer.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

enum AppContainer {
    static let service = Service()
}

enum ServiceContainer {
    static let moviesService = MovieService(service: AppContainer.service)
}

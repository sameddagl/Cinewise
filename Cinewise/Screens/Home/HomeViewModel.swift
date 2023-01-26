//
//  HomeViewModel.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

final class HomeViewModel: HomeVMProtocol {
    weak var delegate: HomeVMDelegate?
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    private var currentPage = 1
    
    func load() {
        notify(.startLoading)
        movieService.fetchMovies(endPoint: .getPopular(page: currentPage)) { [weak self] result in
            guard let self = self else { return }
            self.notify(.endLoading)
            switch result {
            case .success(let movieResult):
                let moviesPresentation = movieResult.results.map{ HomePresentation(movie: $0) }
                self.notify(.fetchedMovies(movies: moviesPresentation))
            case .failure(let error):
                print(error)
                //TODO: Error handling
            }
        }
    }
    
    func selectItem(at index: Int) {
        
    }
    
    private func notify(_ output: HomeOutputs) {
        delegate?.handleOutput(output)
    }
}

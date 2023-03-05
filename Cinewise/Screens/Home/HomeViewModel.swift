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
    private var currentCategory: MovieCategories = .popular
    
    func load() {
        let group = DispatchGroup()
        var topRated = [HomePresentation]()
        var selectedCategory = [HomePresentation]()
        
        group.enter()
        
        notify(.startLoading)
        movieService.fetchMovies(category: .topRated, page: currentPage) { result in
            switch result {
            case .success(let movieResult):
                topRated = movieResult.results.map{ HomePresentation(movie: $0) }
                group.leave()
            case .failure(let error):
                print(error)
                group.leave()
                //TODO: Error handling
            }
        }
        
        group.enter()
        movieService.fetchMovies(category: currentCategory, page: currentPage) { result in
            switch result {
            case .success(let movieResult):
                selectedCategory = movieResult.results.map{ HomePresentation(movie: $0) }
                group.leave()
            case .failure(let error):
                print(error)
                group.leave()
                //TODO: Error handling
            }
        }
        
        group.notify(queue: .main) {
            self.notify(.endLoading)
            self.notify(.fetchedMovies(topRated: topRated, selectedCategory: selectedCategory))
        }
    }
    
    func selectItem(at index: Int) {
        
    }
    
    private func notify(_ output: HomeOutputs) {
        delegate?.handleOutput(output)
    }
}

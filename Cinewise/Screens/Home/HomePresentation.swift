//
//  HomePresentation.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

struct HomePresentation: Hashable {
    let title: String
    let posterPath: String?
    
    init(movie: Movie) {
        self.title = movie.title
        self.posterPath = movie.posterPath
    }
    
    init(title: String, posterPath: String?) {
        self.title = title
        self.posterPath = posterPath
    }
}

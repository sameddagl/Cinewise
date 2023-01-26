//
//  HomeBuilder.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import UIKit

struct HomeBuilder {
    static func make() -> UIViewController {
        let homeVC = HomeViewController()
        let viewModel = HomeViewModel(movieService: ServiceContainer.moviesService)
        
        homeVC.viewModel = viewModel
        viewModel.delegate = homeVC
        
        return homeVC
    }
}

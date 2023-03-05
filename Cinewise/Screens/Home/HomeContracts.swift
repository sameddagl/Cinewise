//
//  HomeContracts.swift
//  Cinewise
//
//  Created by Samed Dağlı on 25.01.2023.
//

import Foundation

protocol HomeVMProtocol {
    var delegate: HomeVMDelegate? { get set }
    func load()
    func selectItem(at index: Int)
    
}

enum HomeOutputs {
    case startLoading
    case endLoading
    case fetchedMovies(topRated: [HomePresentation], selectedCategory: [HomePresentation])
}

enum HomeRoute {
    
}

protocol HomeVMDelegate: AnyObject {
    func handleOutput(_ output: HomeOutputs)
    func navigate(to route: HomeRoute)
}
